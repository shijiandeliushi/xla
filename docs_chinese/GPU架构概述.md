> 本文翻译自 docs/gpu_architecture.md

# XLA:GPU 架构概述

## 引言

XLA 是一个硬件和框架无关的线性代数领域特定编译器，提供一流的性能。JAX、TF、PyTorch 等框架通过将用户输入转换为 [StableHLO](https://github.com/openxla/stablehlo/tree/main)（"高级操作"：约 100 个静态形状指令，如加法、减法、matmul 等）操作集，XLA 从中为各种后端生成优化代码。

在执行期间，框架调用 [PJRT 运行时](https://opensource.googleblog.com/2023/05/pjrt-simplifying-ml-hardware-and-framework-integration.html) API，允许框架执行"使用给定的 StableHLO 程序在特定设备上填充指定缓冲区"的操作。

## XLA:GPU 流水线

XLA:GPU 使用"原生"（PTX，通过 LLVM）发射器和 TritonIR 发射器的组合来生成高性能 GPU 内核（蓝色表示第三方组件）。

## 运行示例：JAX

以下 JAX 示例计算 matmul 结合乘以常量和取反：

```python
def f(a, b):
    return -((a @ b) * 0.125)
```

检查生成的 HLO：

```
HloModule xla_computation_f, entry_computation_layout={(s8[1024,512]{1,0}, bf16[512,2048]{1,0})->(bf16[1024,2048]{1,0})}

ENTRY main.10 {
  Arg_0.1 = s8[1024,512]{1,0} parameter(0)
  convert.5 = bf16[1024,512]{1,0} convert(Arg_0.1)
  Arg_1.2 = bf16[512,2048]{1,0} parameter(1)
  dot.6 = bf16[1024,2048]{1,0} dot(convert.5, Arg_1.2), lhs_contracting_dims={1}, rhs_contracting_dims={0}
  constant.3 = bf16[] constant(0.125)
  broadcast.4 = bf16[1024,2048]{1,0} broadcast(constant.3), dimensions={}
  multiply.7 = bf16[1024,2048]{1,0} multiply(dot.6, broadcast.4)
  ROOT negate.8 = bf16[1024,2048]{1,0} negate(multiply.7)
}
```

## HLO 上的优化：关键组件

### SPMD 分区器

XLA SPMD 分区器，如 [GSPMD](https://arxiv.org/pdf/2105.04663.pdf) 论文所述，消费带有分片标注的 HLO（例如由 `jax.pjit` 产生），并生成可在多个主机和设备上运行的分片 HLO。除了分区，SPMD 还尝试优化 HLO 以实现最优执行调度，重叠计算和节点间通信。

### Layout 分配

HLO 将逻辑形状和物理布局（张量在内存中的排列方式）解耦。例如，矩阵 `f32[32, 64]` 可以表示为行优先或列优先，分别表示为 `{1,0}` 或 `{0,1}`。布局被编码为形状的一部分，显示物理内存布局的排列。

对于 HLO 中的每个操作，Layout Assignment Pass 选择最优布局（例如，在 Ampere 上对卷积使用 NHWC）。布局随后在图中传播，布局之间的冲突或图端点处会通过插入 `copy` 操作来具体化物理转置。

### 融合 (Fusion)

融合是 XLA 最重要的优化，将多个操作（如加法→指数→matmul）组合到单个内核中。由于许多 GPU 工作负载往往是内存受限的，融合通过避免将中间张量写入 HBM 然后再读回，而是通过寄存器或共享内存传递它们来大幅加速执行。

融合的 HLO 指令在一个融合计算体中组合在一起，建立了以下不变性：
- 融合内部没有中间存储在 HBM 中具体化（全部通过寄存器或共享内存传递）
- 融合始终编译为恰好一个 GPU 内核

## 运行示例上的 HLO 优化

检查优化后的 HLO，验证生成了单个融合：

```
HloModule jit_f, is_scheduled=true, entry_computation_layout={(s8[3,2]{1,0}, bf16[2,3]{1,0})->bf16[3,3]{1,0}}

%triton_gemm_dot.6_computation (parameter_0: s8[3,2], parameter_1: bf16[2,3]) -> bf16[3,3] {
  %parameter_0 = s8[3,2]{1,0} parameter(0)
  %convert.0 = bf16[3,2]{1,0} convert(s8[3,2]{1,0} %parameter_0)
  %parameter_1 = bf16[2,3]{1,0} parameter(1)
  %dot.0 = bf16[3,3]{1,0} dot(bf16[3,2]{1,0} %convert.0, bf16[2,3]{1,0} %parameter_1), lhs_contracting_dims={1}, rhs_contracting_dims={0}
  %convert.1 = f32[3,3]{1,0} convert(bf16[3,3]{1,0} %dot.0)
  %constant_0 = bf16[] constant(0.125)
  %broadcast.0 = bf16[3,3]{1,0} broadcast(bf16[] %constant_0), dimensions={}
  %convert.2 = f32[3,3]{1,0} convert(bf16[3,3]{1,0} %broadcast.0)
  %multiply.0 = f32[3,3]{1,0} multiply(f32[3,3]{1,0} %convert.1, f32[3,3]{1,0} %convert.2)
  %negate.0 = f32[3,3]{1,0} negate(f32[3,3]{1,0} %multiply.0)
  ROOT %convert.6 = bf16[3,3]{1,0} convert(f32[3,3]{1,0} %negate.0)
}

ENTRY %main.9 (Arg_0.1: s8[3,2], Arg_1.2: bf16[2,3]) -> bf16[3,3] {
  %Arg_1.2 = bf16[2,3]{1,0} parameter(1), sharding={replicated}
  %Arg_0.1 = s8[3,2]{1,0} parameter(0), sharding={replicated}
  ROOT %triton_gemm_dot.6 = bf16[3,3]{1,0} fusion(s8[3,2]{1,0} %Arg_0.1, bf16[2,3]{1,0} %Arg_1.2), kind=kCustom, calls=%triton_gemm_dot.6_computation, backend_config={"kind":"__triton_gemm","triton_gemm_config":{"block_m":"64","block_n":"64","block_k":"64","split_k":"1","num_stages":"2","num_warps":"4"}}
}
```

注意融合的 `backend_config` 告诉我们 Triton 将被用作代码生成策略，并指定了所选的分块大小。

## 缓冲区分配与调度

Buffer Assignment Pass 考虑形状信息，旨在为程序生成最优的缓冲区分配，最小化消耗的中间内存量。与 TF 或 PyTorch 的立即模式（非编译）执行不同（其中内存分配器事先不知道图结构），XLA 调度器可以"预知未来"并生成最优的计算调度。

## 编译器后端：代码生成和库选择

对于计算中的每个 HLO 指令，XLA 选择是使用链接到运行时的库运行它，还是将其代码生成到 PTX。

### 库选择

对于许多常见操作，XLA:GPU 使用 NVIDIA 的高性能库，如 cuBLAS、cuDNN 和 NCCL。这些库具有经过验证的快速性能优势，但通常排除了复杂的融合机会。

### 直接代码生成

XLA:GPU 后端直接为许多操作（reduction、transpose 等）生成高性能 LLVM IR。

### Triton 代码生成

对于包含矩阵乘法或 softmax 的更高级融合，XLA:GPU 使用 [Triton](https://github.com/openai/triton) 作为代码生成层。HLO 融合被转换为 TritonIR（作为 Triton 输入的 MLIR 方言），选择分块参数并调用 Triton 生成 PTX。

在 Ampere 上，通过适当调优的分块大小，生成的代码可以达到接近理论峰值的性能。

## 运行时

XLA Runtime 将生成的 CUDA 内核调用序列和库调用转换为 RuntimeIR（XLA 中的 MLIR 方言），在此之上执行 CUDA graph 提取。CUDA graph 仍在开发中，目前仅支持部分节点。一旦提取了 CUDA graph 边界，RuntimeIR 通过 LLVM 编译为 CPU 可执行文件，可存储或传输用于 AOT 编译。
