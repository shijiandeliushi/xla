> 本文翻译自 docs/hlo_passes.md

# HLO Pass

本文档概述了 [XLA 编译器](https://openxla.org/xla/architecture) 中的 [HLO](https://openxla.org/xla/terminology) 优化和变换 Pass。

## 概述

一个 HLO Pass 可以由一个或多个编译器优化和变换组成，XLA 提供了数百个这样的 Pass。HLO 只关注数组的**形状**（如 3x4 矩阵）和[操作语义](https://openxla.org/xla/operation_semantics)，这使得优化或变换更加简单。

例如：

- **`AlgebraicSimplifier`**：执行一系列主要是算术简化和优化的 Pass，例如当除以一个常量时，将除法优化为乘以该常量的倒数。

- **`HloRematerialization`**：重计算图中选定的表达式，以减少由长生命周期数组值引起的内存压力。

## 开发者细节

HLO Pass 的基类定义在 [`xla/hlo/pass/hlo_pass_interface.h`](https://github.com/openxla/xla/blob/main/xla/hlo/pass/hlo_pass_interface.h) 中。HLO Pass 不应直接扩展此类，而应扩展 [`HloModulePass`](https://github.com/openxla/xla/blob/main/xla/hlo/pass/hlo_pass_interface.h#L142)。

另请参阅 [XLA HLO Pass Framework](https://github.com/openxla/xla/tree/main/xla/hlo/pass#readme)。

### 工具与测试

XLA 附带多个命令行工具，包括 **hlo-opt**。该工具支持独立于特定平台的编译阶段来执行单个 Pass。更多信息请参阅[工具链文档](https://openxla.org/xla/tools#hlo-opt_hlo_pass_development_and_debugging)。

关于编写 HLO Pass 单元测试的信息，请参阅[测试 HLO Pass](https://openxla.org/xla/test_hlo_passes)。

## 硬件无关的 HLO Pass 示例

以下是跨 XLA 后端共享的一些 Pass 示例。某些 Pass 可能针对特定后端进行了专门化，但高层功能类似。

共享的或硬件无关的 Pass 位于 [`xla/hlo/transforms`](https://github.com/openxla/xla/tree/main/xla/hlo/transforms) 中。

### Rematerialization（重计算）

选择性地在 HLO 图中重新计算表达式，以减少内存使用。以更高的计算量换取更低的内存使用量。可以将内存使用量降低数十个百分点，对于运行许多大型模型是必需的。

### Algebraic Simplifier（代数简化器）

一个汇集了各种简化、优化和规范化的 Pass，类似于 [LLVM 的 `instcombine` Pass](https://llvm.org/docs/Passes.html#instcombine-combine-redundant-instructions)。

### Constant Folding（常量折叠）

用常量等价值替换可以在编译时求值的表达式。

### Dead Code Elimination（死代码消除）

移除具有未使用结果的操作（快速实现）。

### Call Graph Flattening（调用图扁平化）

一个合法化 Pass，通过克隆计算体将 HLO 调用图转换为树形结构。之所以需要，是因为内存是静态分配给 HLO 操作的，而非基于动态调用上下文。

### Reshape Mover（reshape 移动）

Reshape 和 Transpose 可能很昂贵，尤其是在 TPU 上。此 Pass 将 Reshape 和 Transpose 在逐元素操作之间移动，使这些操作能够被合并或消除。

### Zero-sized HLO Elimination（零尺寸 HLO 消除）

HLO 支持大小为 0 的数组（一个或多个维度的边界为 0）。此 Pass 通过将零尺寸操作替换为零尺寸常量来简化图。

## TPU 专有 HLO Pass 示例

特定于 TPU 后端的 Pass。

### 模型并行

XLA 程序在多个核心上的分区是在 HLO 级别执行的，TPU HLO 流水线包含多个支持多核执行的 Pass。

#### 空间分区 (`ShardingPropagation`)

支持沿非 batch 维度在不同设备之间划分操作的 Pass。

### bfloat16 处理

TPU 支持 bfloat16 作为一种比 32 位浮点更紧凑的低精度浮点表示。使用 bfloat16 可以减少内存占用和内存带宽。TPU HLO 流水线包含各种 Pass，用于将浮点数替换为 bfloat16 并在图中传播精度。

### 合法化 Pass (Legalization)

将不支持的 HLO 转换为后端能够发射的、或后端能够为其生成更高效 Lowering 的形式的 Pass。

## GPU 专有 HLO Pass 示例

特定于 GPU 后端的 Pass 位于 [`xla/service/gpu`](https://github.com/openxla/xla/tree/main/xla/service/gpu) 中。这些 Pass 可被标识为 `namespace gpu` 中定义的类。

### cuDNN Rewriter

将融合的卷积和归一化操作分别重写为 cuDNN 中对应的库调用。

## CPU 专有 HLO Pass 示例

特定于 CPU 后端的 Pass 位于 [`xla/service/cpu`](https://github.com/openxla/xla/tree/main/xla/service/cpu) 中。这些 Pass 可被标识为 `namespace cpu` 中定义的类。

### Convolution Canonicalization（卷积规范化）

将卷积规范化，使其可以被 Lowering 为 Eigen 中的快速实现。

### Operation Parallelization（操作并行化）

将 HLO 划分为在不同线程上执行的任务。

## 分析 Pass

分析 Pass 不被视为"HLO Pass"，因为它们不修改 HLO 且可能不扩展 `HloModulePass`。共享的分析 Pass 位于 [`xla/hlo/analysis`](https://github.com/openxla/xla/tree/main/xla/hlo/analysis) 中。

### 分析 Pass 示例

- **Dataflow Analysis**：识别图中的所有 HLO 值及其使用。
- **Alias Analysis**：识别程序中值之间的"must-alias"关系。
- **Computation Cost Analysis**：计算程序中所有操作的 FLOP 计数和内存使用量。
- **HLO Verification**：验证 HLO 图的各种不变量。
