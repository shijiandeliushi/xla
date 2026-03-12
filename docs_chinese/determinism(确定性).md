# 确定性 (GPU)

## 编译

如果使用[持久化自动调优](./persisted_autotuning)执行自动调优一次并在后续编译中避免它，则 XLA 编译是确定性的。否则，由于测量值的波动，在不同的编译运行中可能会选择不同的内核作为最快的内核。

可以使用`--xla_gpu_require_complete_aot_autotune_results` 来确保在重复编译时不会发生自动调优——它们要么重用先前运行的兼容结果，要么失败。

## 执行

由 XLA 编译的程序在诸如 scatter、select-and-scatter、GEMM、卷积、多头注意力等操作上可能是非确定性的。标志`--xla_gpu_exclude_nondeterministic_ops` 会将这些操作切换到确定性但可能较慢的实现，并使得在 select-and-scatter 操作上编译失败，因为该操作没有确定性实现。
