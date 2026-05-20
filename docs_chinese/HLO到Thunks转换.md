> 本文翻译自 docs/hlo_to_thunks.md

# 从 HLO 到 Thunks

## 预优化 HLO

我们从预优化 HLO 开始。预优化 HLO 不包含被视为 XLA 内部的操作（如 `fusion` 或 `bitcast`）。此阶段的操作还没有 layout，或者即使有也会被忽略。预优化 HLO 通常由更高级别的框架（如 TensorFlow 和 JAX）产生。当使用 XLA 标志 `-xla_dump_to` 时，预优化 HLO 被转储到文件，文件名后缀为 "before_optimizations.txt"。

## 优化 HLO 模块

XLA:GPU 流水线将通过运行一系列 Pass 将预优化 HLO 转换为优化后的 HLO。这些 Pass 可以按语义分组，并按以下顺序运行：

### Sharding 相关 Pass

[Shardy Partitioner](https://openxla.org/shardy/overview) 或 SPMD sharding。

### 优化 Pass

包括合法化 (legalization) Pass 和简化 (simplification) Pass。

### 集合通信优化 Pass

与**优化 Pass** 类似，但侧重于集合通信操作。

### Layout 分配 Pass

每个 HLO 操作都被分配一个 Layout，作为指令形状的一部分。Layout 控制张量在内存中物理布局的方式。

带 Layout 的形状示例：
```
f32[10,20,30]{2,0,1}
```

元素类型之后是形状的逻辑维度，接着是 Minor-to-Major 顺序的 Layout 排列。在此例中，最内层维度是 30，第二内层维度是 10，最外层维度是 20。

Layout 分配的目标是使用贪心策略最小化所需的物理 Transpose 次数。它从某些 Layout 约束开始（例如 CuDNN/cuBLAS 库期望连续维度），并沿 HLO 图"向下"、"向上"传播 Layout。在 Layout 传播结束时，某些指令可能会出现冲突的 Layout（一个来自操作数，一个来自使用者）。为解决此冲突，会插入一个 `copy` HLO 指令来改变 Layout。

### Layout 规范化 Pass

由于物理形状在某种程度上难以处理，Layout 规范化试图重写形状以使用默认 Layout `{rank-1, rank-2, ..., 0}`。在上面的例子中，规范化后的形状是 `f32[20,10,30]{2,1,0}`。改变 Layout 的 Copy 操作被重写为 `transpose` + `bitcast` 的组合。由于目前无法对所有操作进行规范化，仍有一些操作可能保留非默认 Layout（最值得注意的是 `gather` 和 `dot`）。在规范化操作和非规范化操作之间的边界处，会有表示 Transpose 的 `bitcast` 操作（即被分配了使其在物理上成为 no-op 的 Layout 的 Transpose）。

Layout 规范化还会使一些隐式 Transpose 变为显式，这一点很重要，因为代码生成可以通过专用的发射器处理显式 Transpose。例如，`ReshapeDecomposer` Pass 将 Reshape 转换为 `transpose`、Reshape `bitcast` 和 `transpose` 的序列。

### Layout 分配后的优化 Pass

此处最重要的 Pass 是 Triton 融合（GEMM 融合 + Softmax/Layernorm 融合）或重写为库调用。此外，自动调优 (Autotuning) 也在此步骤中运行，为卷积或 Dot 选择最佳算法，为旧版 Triton GEMM 发射器的 Dot 选择最佳分块策略，以及为某个 Dot 融合选择使用 Triton 还是 cuBLAS。

### 融合 Pass

两个主要 Pass 是 `PriorityFusion` 和 `Multi-Output` 融合。

在 `PriorityFusion` 中，根据代价模型引导形成融合。融合时，如果某个操作可以被融合到其所有使用者中，则允许复制具有多个使用者的操作。

`Multi-Output` 融合是一个单独的 Pass，允许将共享操作数的操作/融合融合在一起，或通过增加额外输出（而非复制）将操作数/操作数融合融合到使用者中。其他使用者可重定向到这些额外输出。此 Pass 需要小心避免在 HLO 图中引入循环。

Multi-Output 融合之后，运行公共子表达式消除 (`HloCSE`)，这可能会将之前复制后分散在不同融合中的相同操作重新合并。

### 若干 Post-Fusion Pass

与集合通信相关的多个 Pass（如将其转为异步，或强制执行集合通信的特定相对顺序）。

最后运行 `CopyInsertion`，添加 Copy 以确保 In-Place 操作不会覆盖其他地方仍需要的数据。

优化完成后，优化后的 HLO 被转储到文件名后缀为 "after_optimizations.txt" 的文件中（使用 `-xla_dump_to` 标志）。如需转储中间 Pass 的 HLO，使用 `-xla_dump_hlo_pass_re=.*`。

## 调度

没有调度信息的 HloModule 在处理操作的顺序上仍有一定自由度。基本上，任何符合操作数/结果关系和控制依赖的拓扑排序都可以。调度强制执行特定的顺序，这会影响所需的内存量（因为在某个缓冲区的所有读取者处理完毕之前，无法复用该缓冲区）。

后续运行 `LatencyHidingScheduler` Pass，尝试最大化计算-通信的重叠，但可能再次增加内存使用。

调度之后运行 `HloRematerialization`（重计算），在峰值内存消耗超过可用内存时尝试减少内存使用。代价是性能下降（例如某些融合可能被拆分，某些操作可能被复制以缩短缓冲区生命周期）。

## 缓冲区分配

在降低到 LLVM IR 之前，立即运行 Buffer Assignment Pass，为 HLO 图中的每条指令分配缓冲区切片。缓冲区分配分为几个步骤：

1. **`HloDataflowAnalysis`**：为指令分配 `HloValues`（本质上是逻辑缓冲区）。对于 In-Place 操作，操作数的 `HloValue` 可以被复用。
2. **`HloAliasAnalysis`**：尝试为别名操作合并缓冲区，计算从 `HloValue` 到 `HloBuffer` 的映射。
3. **`BufferAssignment`**：计算 `HloBuffers` 到大缓冲区中缓冲区切片的映射，确保不同但生命周期重叠的 `HloBuffers` 不会使用同一缓冲区切片。对于可能存在别名关系的操作，允许轻微的重叠。

使用 `-xla_dump_to` 标志时，缓冲区分配的某些信息被转储到文件名后缀为 "after_optimizations-buffer-assignment.txt" 的文件中。
