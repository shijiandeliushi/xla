> 本文翻译自 docs/flags_guidance.md

# XLA 标志指南

本文提供 XLA 关键标志的精选集合，帮助用户有效导航和利用 XLA 的功能。以下各节详细介绍了会显著影响运行时性能和内存利用率的标志。如果在启用某个标志后出现崩溃等问题，建议恢复默认设置并在 GitHub 上创建 issue。

## 正确性标志

| 标志 | 描述 | 默认值 | 建议值 | 候选值 |
| :--- | :--- | :--- | :--- | :--- |
| `xla_mosaic_on_device_checks` | 启用 Mosaic 代码生成的设备端检查。当前支持的检查包括边界检查，即如果访问了越界内存，编译/执行会捕获它。 | `bounds` | `bounds` | `bounds` |

## 性能标志

以下标志有助于增强运行时性能。尝试调整这些设置可能会带来显著的性能提升。

| 标志 | 描述 | 默认值 | 建议值 | 候选值 |
| :--- | :--- | :--- | :--- | :--- |
| **流水线** <br> 1. `xla_should_allow_loop_variant_parameter_in_chain` <br> 2. `xla_should_add_loop_invariant_op_in_chain` <br> 3. `xla_tpu_enable_ici_ag_pipelining` | 这三个标志应配合使用，以启用 ICI(片间互连) all-gather 操作的集合通信流水线化，创造更多重叠执行的机会。 | 1. `kDisabled` <br> 2. `kDisabled` <br> 3. `false` | 1. `kEnabled` <br> 2. `kEnabled` <br> 3. `true` | 1. `kDisabled/kEnabled/kAuto` <br> 2. `kDisabled/kEnabled/kAuto` <br> 3. `true/false` |
| **v5e/异步** <br> `xla_enable_async_all_gather` <br> `xla_tpu_enable_async_collective_fusion` <br> `xla_tpu_enable_async_collective_fusion_fuse_all_gather` | 这三个标志应配合使用，以在 v5e 上激活异步 all-gather 操作。 | `kAuto` / `true` / `true` | `kAuto` / `true` / `true` | 同上 |
| **v5e/异步** <br> `xla_tpu_enable_async_collective_fusion` <br> `xla_tpu_enable_async_collective_fusion_fuse_all_reduce` | 这两个标志应配合使用，以在 v5e 上激活异步 all-reduce 操作。 | `true` / `false` | `true` / `true` | `true/false` / `true/false` |
| **异步** <br> `xla_tpu_enable_async_all_to_all` | 启用异步 all-to-all 通信。 | `false` | `true` | `true/false` |
| **延迟受限** <br> `xla_all_gather_latency_bound_threshold_in_bytes` | 针对延迟受限（即小尺寸）的 all-gather 操作。启用后会触发特定优化以减少延迟受限 all-gather 的执行时间。通常用于推理工作负载。 | `-1`（禁用） | `4~16MB` | `[0, 9223372036854775807]` |
| **延迟受限** <br> `xla_all_reduce_latency_bound_threshold_in_bytes` | 针对延迟受限的 all-reduce 操作，类似上述。 | `-1` | `4~16MB` | `[0, 9223372036854775807]` |
| **延迟受限** <br> `xla_collective_permute_latency_bound_threshold_in_bytes` | 针对延迟受限的 collective-permute 操作。 | `-1` | `4~16MB` | `[0, 9223372036854775807]` |
| **延迟受限** <br> `xla_all_to_all_latency_bound_threshold_in_bytes` | 针对延迟受限的 all-to-all 操作。 | `-1` | `4~16MB` | `[0, 9223372036854775807]` |
| `xla_enable_async_collective_permute` | 将所有 collective-permute 重写为异步变体。设为 `auto` 时，XLA 可根据其他配置自动开启异步集合通信。 | `kAuto` | `kAuto` | `kAuto/kEnabled/kDisabled` |
| **计算密集型** <br> `xla_tpu_enable_dot_strength_reduction` | 将非计算密集型的 dot 重写为 multiply + reduce 操作。 | `true` | `true` | `true/false` |
| **计算密集型** <br> `xla_tpu_dot_dot_fusion` | 启用 dot-dot 融合，将生产者 dot 操作与消费者 dot 操作融合。 | `true` | `true` | `true/false` |
| **计算密集型** <br> `xla_jf_enable_multi_output_fusion` | 启用多输出融合。 | `true` | `true` | `true/false` |
| **计算密集型** <br> `xla_tpu_scoped_vmem_limit_kib` | 设置每个操作可本地使用的 scratchpad VMEM 量（KB），其余 VMEM 用作缓冲区空间。 | `16384` | `16384` | `[4096, VMEM大小-1024]` |
| **计算密集型** <br> `xla_tpu_async_copy_bandwidth_scaling_factor` | 缩放异步拷贝的有效带宽。用于预取决策和决定哪些张量应驻留在 VMEM 中。 | `1` | `1` | `(0, 1]` |
| **计算密集型** <br> `xla_msa_enable_cross_program_prefetch_freeing` | 启用跨程序预取缓冲区的释放优化。 | `enabled` | `enabled` | `enabled/disabled` |
| **计算密集型** <br> `xla_tpu_msa_inefficient_use_to_copy_ratio` | 使用字节与拷贝字节的比率阈值，低于此值认为分配点是低效的。 | `0.5` | `0.5` | `[0, 1]` |

## 内存标志

以下标志用于解决 HBM 相关问题。仅在模型编译期间遇到 HBM "out of memory" 错误时才应调整。其他情况下推荐使用默认值，因为更改可能会对性能产生负面影响。

| 标志 | 描述 | 默认值 | 建议值 | 候选值 |
| :--- | :--- | :--- | :--- | :--- |
| **调度器** <br> `xla_latency_hiding_scheduler_rerun` | 调整延迟隐藏调度器的行为。每次"重新运行"时逐步减少调度分配的内存限制。 | `1` | `5` | `0~10` |
| **融合** <br> `xla_tpu_rwb_fusion` | 启用 reduce+broadcast 类型融合，可能减少内存使用。 | `true` | `false` | `true/false` |
| **调度器** <br> `xla_memory_scheduler` | 指定内存调度器用于最小化内存消耗的算法。使用更高级的算法可能获得更低内存消耗的调度，但编译时间更长。 | `kDefault` | `kBrkga` | `kDefault/kList/kDfs/kPostOrder/kBrkga` |
| **调度器** <br> `xla_tpu_enable_latency_hiding_scheduler` | 启用延迟隐藏调度器。禁用它可减少内存使用，但会失去异步操作的性能收益。 | `true` | `false` | `true/false` |
| **SPMD** <br> `xla_jf_spmd_threshold_for_windowed_einsum_mib` | 设置触发集合通信 matmul 的 dot 最小尺寸阈值。设置较高值可节省内存，但会失去执行集合通信 matmul 的机会。 | `-1` | `10MB~1GB` | `[0, 9223372036854775807]` |
| **调度器** <br> `xla_gpu_enable_analytical_sol_latency_estimator` | 启用分析估算器，最大化 GPU 上的计算-通信重叠。 | `true` | `false` | `true/false` |

## 其他常用标志

| 标志 | 类型 | 说明 |
| :--- | :--- | :--- |
| `xla_dump_to` | String (路径) | 预优化 HLO 文件和其他工件的存放目录（参见 [XLA Tools](https://openxla.org/xla/tools)）。 |

### TPU XLA 标志

| 标志 | 类型 | 说明 |
| :--- | :--- | :--- |
| `xla_tpu_enable_data_parallel_all_reduce_opt` | Boolean | 增加 DCN（数据中心网络）all-reduce 的重叠机会，用于数据并行分片。 |
| `xla_tpu_data_parallel_opt_different_sized_ops` | Boolean | 启用跨多次迭代的数据并行操作流水线化，即使输出大小不匹配。可能增加内存压力。 |
| `xla_tpu_spmd_rng_bit_generator_unsafe` | Boolean | 以分区方式运行 RngBitGenerator HLO，如果期望不同分片上有确定性结果，这是不安全的。 |
| `xla_tpu_megacore_fusion_allow_ags` | Boolean | 允许将 all-gather 与卷积/all-reduce 融合。 |
| `xla_tpu_enable_ag_backward_pipelining` | Boolean | 将 all-gather（目前是 megascale all-gather）通过扫描循环向后流水线化。 |

### GPU XLA 标志

| 标志 | 类型 | 说明 |
| :--- | :--- | :--- |
| `xla_gpu_enable_latency_hiding_scheduler` | Boolean | 启用延迟隐藏调度器以有效重叠异步通信与计算。默认为 false。 |
| `xla_gpu_enable_analytical_sol_latency_estimator` | Boolean | 启用平台特定的调度决策，改善计算-通信重叠。默认为 true。 |
| `xla_gpu_analytical_latency_estimator_options` | 结构化字符串 | 配置 `xla_gpu_enable_analytical_sol_latency_estimator` 的参数。 |
| `xla_gpu_enable_triton_gemm` | Boolean | 使用基于 Triton 的矩阵乘法。 |
| `xla_gpu_enable_command_buffer` | List | 哪些类型的命令应被捕获到命令缓冲区中。 |
| `xla_gpu_all_reduce_combine_threshold_bytes` | Integer | 调优何时将多个小的 AllGather / ReduceScatter / AllReduce 合并为大的。默认为 256。 |
| `xla_gpu_all_gather_combine_threshold_bytes` | Integer | 同上，用于 AllGather。 |
| `xla_gpu_reduce_scatter_combine_threshold_bytes` | Integer | 同上，用于 ReduceScatter。 |
| `xla_gpu_enable_pipelined_all_gather` | Boolean | 启用 all-gather 指令的流水线化。 |
| `xla_gpu_enable_pipelined_reduce_scatter` | Boolean | 启用 reduce-scatter 指令的流水线化。 |
| `xla_gpu_enable_pipelined_all_reduce` | Boolean | 启用 all-reduce 指令的流水线化。 |
| `xla_gpu_enable_while_loop_double_buffering` | Boolean | 启用 while 循环的双缓冲。 |
| `xla_gpu_enable_all_gather_combine_by_dim` | Boolean | 按相同 gather 维度或不考虑维度合并 all-gather 操作。 |
| `xla_gpu_enable_reduce_scatter_combine_by_dim` | Boolean | 按相同维度或不考虑维度合并 reduce-scatter 操作。 |
