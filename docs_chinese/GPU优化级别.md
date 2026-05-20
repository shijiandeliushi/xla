> 本文翻译自 docs/gpu_optimization_levels.md

# XLA:GPU 优化级别 (-On)

有一些 Pass 我们发现运行是有益的（尤其是在大规模情况下），但它们会增加 HLO 大小，从而增加编译时间。这就是为什么它们默认不启用。为方便起见，我们将它们合并到一个选项下。

将 [optimization_level](https://github.com/openxla/xla/blob/5b54d0e9cf34f4e5ab05b3752ecb390145ca5716/xla/pjrt/proto/compile_options.proto#L66-L71) 设置为 [O1 或以上](https://github.com/openxla/xla/blob/5b54d0e9cf34f4e5ab05b3752ecb390145ca5716/xla/xla.proto#L1481) 会导致以下行为：

- **数据并行集合通信的流水线化**：常用于数据并行通信的集体操作将被流水线化。此行为也可以通过启用单独的标志更细粒度地控制：
  - `xla_gpu_enable_pipelined_all_gather`
  - `xla_gpu_enable_pipelined_all_reduce`
  - `xla_gpu_enable_pipelined_reduce_scatter`

- **While 循环展开**：按因子 2 展开 while 循环。打破循环屏障，可能带来更好的计算-通信重叠和更少的拷贝：
  - `xla_gpu_enable_while_loop_double_buffering`

- **延迟隐藏调度器**：延迟隐藏调度器将尽力隐藏通信延迟：
  - `xla_gpu_enable_latency_hiding_scheduler`

- **合并器 Pass**：为最大化网络带宽，合并器 Pass 会将流水线化的集体操作合并到最大可用内存。如果输入 HLO 中循环已经展开，此优化不会启动：
  - [all_gather_combiner](https://github.com/openxla/xla/blob/main/xla/service/gpu/transforms/collectives/all_gather_combiner.cc)
  - [all_reduce_combiner](https://github.com/openxla/xla/blob/main/xla/service/gpu/transforms/collectives/all_reduce_combiner.cc)
  - [reduce_scatter_combiner](https://github.com/openxla/xla/blob/main/xla/service/gpu/transforms/collectives/reduce_scatter_combiner.cc)
