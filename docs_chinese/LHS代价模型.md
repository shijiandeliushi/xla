> 本文翻译自 docs/lhs_cost_model.md

# LHS 代价模型

---

## tl;dr

本页描述延迟隐藏调度器 (Latency Hiding Scheduler, LHS) 使用的代价模型内部机制。如果您对调优模型感兴趣，请直接跳转到[调优部分](#调优)。

延迟隐藏调度器是一个编译器 Pass，以最小化挂钟时间为目标调度 HLO DAG。其决策由统一代价模型指导，该模型混合使用性能表和分析模型。具体来说，XLA 嵌入了 GEMM 和快速互连集合通信的性能表，并对其他情况使用分析性网络和融合代价模型。

---

## 性能表 — ICI 集合通信

性能表由两个主要组件组成：收集器和插值器。

### 收集器 (Collector)

[收集器](https://github.com/openxla/xla/blob/main/xla/tools/collective_perf_table_gen_main.cc) 是一个 C++ 工具，负责生成集合通信操作的性能表。它对集体操作类型、传输大小和传输方案进行参数扫描。

**数据收集参数：**
- **集体操作类型**：`all-reduce`、`all-gather`、`reduce-scatter`
- **传输大小**：从 1024B 到 2GiB 的对数尺度
- **传输方案**：`rail-aligned`、`non-rail-aligned`

针对具有 **2、4 和 8 个设备** 的节点内集群运行此扫描。结果是以 `.pbtxt` 格式的延迟表（每个平台约 116 KB）。

### 插值器 (Interpolator)

[插值器](https://github.com/openxla/xla/blob/main/xla/service/gpu/model/collective_interpolator.h) 是编译器组件，消费生成的性能表以在编译期间提供运行时估算。

**内部数据结构：** 插值器将性能表处理为一个映射，key 是 `(collective_type, transfer_scheme)` 元组，value 是一个 2D 欧几里得平面，按传输大小和设备数量索引网络吞吐量。

**查找和插值步骤：**
1. 使用操作的 `(collective_type, transfer_scheme)` 作为键识别正确的 2D 吞吐量平面
2. 在该平面内使用加权平均检索（基于欧几里得距离）
3. 结果是单一的**网络吞吐量**值

### 设计理由：吞吐量和外推

系统设计为存储**网络吞吐量**而非原始延迟。如果延迟表在集体通信大小 `S` 处捕获了网络带宽饱和，则该点的吞吐量 `T` 被视为最大值。对于任何大小 `S' > S` 的新集体操作：

$$\text{EstimatedTime}(S') = \frac{S'}{T_{\text{saturated}}}$$

**重要提示：** 此外推模型依赖于生成的延迟表**捕获真实的网络带宽饱和**。如果表中没有包含达到或超过饱和点的测量值，插值器将**低估**最大吞吐量，从而**高估**大型传输的运行时。

---

## 性能表 — GEMM

与集合通信系统类似，GEMM 延迟表由收集器和插值器支持。

### 收集器

[GEMM 收集器](https://github.com/openxla/xla/blob/main/xla/tools/matmul_perf_table_gen_main.cc) 扫描 GEMM 维度空间（batch、两个非收缩维度、一个收缩维度）和数据类型。

**默认数据类型：** LHS/RHS/OUT = 或 bf16 或 f32。

**收集参数：**
- batch: {1, 2, 4}
- m (非收缩): {256, 512, ..., 4096}
- n (非收缩): {256, 512, ..., 4096}
- k (收缩): {256, 512, ..., 4096}

### 插值器

[GEMM 插值器](https://github.com/openxla/xla/blob/main/xla/service/gpu/model/matmul_interpolator.h) 从收集的数据重建 FLOPS：

$$\text{FLOPS} = \frac{2 \times b \times m \times n \times k}{\text{runtime}}$$

关键洞察是 FLOPS 在某个点**饱和**——即硬件在超过某个矩阵形状后达到峰值 FLOPS。这允许使用与集合通信相同的外推方法。插值器构建一个 **4D 欧几里得空间**并执行加权平均插值。

---

## 分析代价模型 — DCN

### S 曲线集合通信代价模型

**S 曲线**模型是一个完全分析性的网络性能上限模型，根据固定网络属性估算集体操作的性能。

**模型输入：**
1. **固定网络属性（用户定义）：** 集合通信启动开销、NIC 速度、RTT（往返时间）。默认情况下 XLA 自动检测平台并为最常见架构使用默认值。
2. **每个集体操作的输入：** 集体操作类型、传输大小、涉及的节点数。

S 曲线模型已集成到 XLA:GPU 中，并在 Hopper 和 Blackwell 上使用。

---

## 分析代价模型 — 融合

对于其他内核，我们依赖 [GPU 性能代价模型](https://github.com/openxla/xla/blob/main/xla/service/gpu/model/gpu_performance_model.h) 来估算正确的运行时。

---

## 调优

S 曲线模型可以通过 XLA 标志进行调优：

```bash
export NIC_SPEED_GBPS=...       # 每个 GPU 的 NIC 速度 (GB/s)
export GPUS_PER_NODE=...        # 通过快速网络（如 NVLINK）互连的每个节点 GPU 数
export XLA_FLAGS=--xla_gpu_analytical_latency_estimator_options="nic_speed_gbps=$NIC_SPEED_GBPS,gpus_per_node=$GPUS_PER_NODE"
```
