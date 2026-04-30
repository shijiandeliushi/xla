> 本文翻译自 docs/sparsecore.md

# SparseCore 深度解析：面向大型嵌入模型 (LEM)

SparseCore 是一种专门的分块处理器，为涉及不规则、稀疏内存访问和计算的工作负载提供高性能加速，特别是在存储在 HBM 中的大型数据集上。虽然它擅长嵌入查找等任务，但其能力扩展到加速各种其他动态和稀疏工作负载。

## 1. SparseCore 简介

关键架构特性：
- **分块架构**：包含多个计算块（每个块是具有自己本地内存和处理单元的完整数据流单元），允许并行处理
- **动态执行**：原生支持数据依赖的控制流和内存访问，对稀疏数据至关重要
- **向量处理**：利用小向量任务（8 元素或 16 元素，取决于硬件版本）进行高效计算
- **集中控制**：单个 SparseCore 序列器协调所有块的任，确保同步操作
- **数据摘要支持**：包括专门的跨通道操作，有利于排序、过滤和前缀和等任务
- **内存层次**：策略性地利用 HBM 存储大型数据集，使用本地 scratchpad 内存 (SPMEM) 暂存频繁访问的数据，显著减少 HBM 延迟

### 规格一览：

| 属性 | TPU v4 | TPU v5p | Trillium |
| :--- | :--- | :--- | :--- |
| **每芯片 SparseCore 数** | 4 | 4 | 2 |
| **每 SparseCore 块数** | 16 | 16 | 16 |
| **SIMD 宽度** | 8 | 8 | 8 (F32) 16 (BF16) |
| **HBM 容量** | 32 GiB | 96 GiB | 32 GiB |

## 2. SparseCore 主机预处理

有效的数据准备对 SparseCore 性能至关重要：
- **数据转换**：将原始输入数据转换为 COO 稀疏格式，并分区以高效分布到不同 SparseCore
- **限制验证**：确保输入数据特征符合预定义的操作限制（如 `max_ids_per_partition`、`max_unique_ids_per_partition`）
- **数据传输**：高效地将处理后的数据传输到 TPU 的 HBM

### 表堆叠 (Table Stacking)

表堆叠是一种将多个嵌入表逻辑组合以增强嵌入查找效率的重要优化技术。主要优势是创建更大的有效批次大小，减少计算开销并有效隐藏 ICI 延迟。为获得最佳性能，推荐适度数量的堆叠表（通常在 5 到 100 之间）。

## 3. 转换为 COO 张量

数据在由 SparseCore 处理之前，通常转换为 COO 稀疏张量格式：
- `row_ids`：每个非零元素的行索引数组（通常对应批次维度）
- `col_ids`：每个非零元素的列索引数组（通常是特征或 ID 值）
- `values`（可选）：非零元素的实际值数组

## 4. SparsecoreConfig：高级 API

主要配置参数：
- **`disable_table_stacking`**：控制是否禁用自动表堆叠（默认 `false`，启用）
- **`max_ids_per_chip_per_sample`**：单个芯片每个样本可处理的最大嵌入 ID 总数（默认 `64`）
- **`max_ids_per_table`**：每个逻辑表可处理的最大 ID 数
- **`max_unique_ids_per_table`**：每个逻辑表可处理的最大唯一 ID 数
- **`allow_id_dropping`**：控制 ID 丢弃（默认 `false`，溢出时触发错误而非静默丢弃）
- **`initialize_tables_on_host`**：表是否在主机 CPU 上初始化（默认 `true`）
- **`enable_fast_table_initialization`**：直接在 TPU 上初始化表，减少模型启动时间

## 5. 流水线化

流水线化是一种性能优化技术，允许 TensorCore (TC) 和 SparseCore (SC) 同时执行操作。通过重叠这些计算，可显著提高总体吞吐量。流水线化可能导致最高 2 倍的设备步长时间改进，但可能影响数值收敛行为。

## 6. XLA 的角色

XLA 是将高级计算图转换为高度优化的 TPU 机器代码的领域特定编译器。在 SparseCore 上下文中，它负责编译稀疏操作、集成限制、执行优化策略。

## 7. 限制如何转化为 SparseCore 上的表

"限制"是基本的配置参数，主要指每个表在每个 SparseCore 上的：
- **`max_ids_per_partition`**：单个 SparseCore 在单个计算步骤中应处理的最大 ID 数（含重复）
- **`max_unique_ids_per_partition`**：单个 SparseCore 应处理的最大唯一 ID 数

表通常在所有 SparseCore 上"模分片"，ID `j` 分配给 `SparseCore_k` 的公式为 `k = j % num_total_sparse_cores`。

## 8. 每个 SparseCore 如何通信

SparseCore 通信依赖多个协调机制：
- **模分片和隐式路由**：通过 `col_id % num_total_sparse_cores` 确定目标 SparseCore
- **主机数据分布**：主机预处理分区并分布数据
- **SparseCore 内部处理**：去重和嵌入向量收集
- **SparseCore 间通信 (All-to-All)**：跨 SparseCore 合并或重新分布结果
- **与 TensorCore 的通信**：通过 HBM 发送嵌入激活和接收梯度

## 9. SparseCore 内存管理

- **SPMEM**：小而快的本地 SRAM，由 XLA 编译器显式管理，静态分配缓冲区
- **HBM**：大型共享内存，存储嵌入表和中间结果
- **VMEM**：TensorCore 使用的本地 scratchpad 内存

## 10. 性能和内存瓶颈

常见性能瓶颈：
- **主机瓶颈**：CPU 预处理跟不上，导致 SparseCore/TensorCore 利用不足
- **次优的 TC/SC 同步**：流水线化未启用或效率低下
- **限制引起的瓶颈**：限制设置太低或太高
- **数据分布倾斜**：某些 SparseCore 分区接收不成比例的 ID 数量
- **表堆叠问题**：太少或太多表堆叠
- **低效的数值/量化**：使用不必要的全精度
- **HBM 带宽饱和**：过多的数据移动

常见内存瓶颈：
- **SPMEM 溢出**：编译失败
- **HBM 栈溢出**：运行时或编译时 OOM
- **HBM 堆耗尽**：过大的密集层权重或过度预取
- **填充开销**：小特征宽度的显著浪费

## 11. 分析 SparseCore 性能

关键步骤：获取跟踪 → 检查 Trace Viewer → 内存分析 → 寻找特定模式 → 关联标志和配置 → 迭代优化

## 12. 通用调试标志

- `xla_sparse_core_enable_id_bound_check=true`：ID 越界检查
- `xla_sc_detect_nan=true`：NaN 检测
- `xla_sc_assert_level=bounds`：内存访问边界检查
- Buffer Sanitizer 标志：内存损坏检测

## 13. 量化支持

SparseCore 的 `SparseDenseMatmulOp` 支持 FP32 和整数数据类型。训练后量化 (PTQ) 允许使用更低精度数据类型进行推理。配置属性包括 `quantization_config_num_buckets`、`quantization_config_low`、`quantization_config_high`。

## 14. 即将推出的功能和近期改进

- **样本维度 mini-batching**：沿样本维度进一步分区嵌入输入
- **改进对小于 8 个整数的嵌入支持**：减轻小特征维度的填充开销
- **最近的改进**：HBM gather 操作数暂存、减少栈内存使用
