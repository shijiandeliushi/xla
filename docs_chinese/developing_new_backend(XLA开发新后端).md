# 为 XLA 开发新后端

本指南面向希望 XLA 能够输出高效运行于其硬件上的程序的系统工程师。本指南并非逐步教程，并假设读者了解[LLVM](http://llvm.org), [Bazel](https://bazel.build/), and XLA.

XLA 提供了一个抽象接口，新的架构或加速器可以实现该接口，以创建一个后端来运行 XLA 输出的机器学习程序。与为新型硬件实现来自前端框架（如 PyTorch 或 TensorFlow）的每一个现有操作相比，重新定位 XLA 应该显著更简单且更具可扩展性。

大多数实现将属于以下场景之一：

  1. 现有的 CPU 架构，但 XLA 尚未官方支持，可能有也可能没有现有的[LLVM](http://llvm.org) 后端。
  2. 非 CPU 类硬件，但有现有的 LLVM 后端。
  3. 非 CPU 类硬件，且没有现有的 LLVM 后端。

> **注意:** LLVM 后端可以指官方发布的 LLVM 后端之一，也可以指内部开发的自定义 LLVM 后端。

## 场景 1：XLA 尚未官方支持的现有 CPU 架构

在这种情况下，首先查看现有的[XLA CPU 后端](https://github.com/openxla/xla/tree/main/xla/service/cpu)。XLA 通过使用 LLVM，使得针对不同 CPU 变得容易，因为 XLA 的 CPU 后端之间的主要区别在于 LLVM 生成的代码。

如果硬件供应商为其硬件提供了 LLVM 后端，那么将该后端与 XLA 构建的 LLVM 链接起来很简单。在 JIT 模式下，XLA CPU 后端为主机 CPU 生成代码。对于提前编译，[`xla::AotCompilationOptions`](https://github.com/openxla/xla/tree/main/xla/service/compiler.h)可以提供 LLVM triple 来配置目标架构。

如果没有现有的 LLVM 后端，但存在另一种代码生成器，那么应该可以重用现有 CPU 后端的大部分代码。

## 场景 2：具有现有 LLVM 后端的非 CPU 类硬件

可以基于现有的[`xla::CPUCompiler`](https://github.com/openxla/xla/tree/main/xla/service/cpu/cpu_compiler.cc)和[`xla::GPUCompiler`](https://github.com/openxla/xla/tree/main/xla/service/gpu/nvptx_compiler.cc)类来模拟新的[`xla::Compiler`](https://github.com/openxla/xla/tree/main/xla/service/compiler.h)实现，因为这些类已经生成了 LLVM IR。根据硬件的性质，LLVM IR 生成的许多方面可能需要更改，但大量代码可以与现有后端共享。

一个值得参考的好例子是 XLA 的[GPU backend](https://github.com/openxla/xla/tree/main/xla/service/gpu/)GPU 后端针对的是非 CPU 类的 ISA，因此其代码生成的某些方面是 GPU 领域独有的。其他类型的硬件，例如 DSP（如 Hexagon，它有一个上游的 LLVM 后端），可以重用部分 LLVM IR 生成逻辑，但其他部分将是独特的。

## 场景 3：没有现有 LLVM 后端的非 CPU 类硬件

如果无法利用 LLVM，那么最佳选择是为所需硬件实现一个新的 XLA 后端。此选项需要付出最多的努力。需要实现的类如下：

* [`StreamExecutor`](https://github.com/openxla/xla/tree/main/xla/stream_executor/stream_executor.h):
  对于许多设备，并不需要 `StreamExecutor` 的所有方法。详情请参阅现有的 `StreamExecutor` 实现。
* [`xla::Compiler`](https://github.com/openxla/xla/tree/main/xla/service/compiler.h):此类封装了将 HLO 计算编译为`xla::Executable`。
* [`xla::Executable`](https://github.com/openxla/xla/tree/main/xla/service/executable.h):此类用于在平台上启动已编译的计算。
* [`xla::TransferManager`](https://github.com/openxla/xla/tree/main/xla/service/transfer_manager.h):此类使后端能够提供特定于平台的机制，用于从给定的设备内存句柄构造 XLA 字面量数据。换句话说，它有助于封装数据从主机到设备以及从设备到主机的传输。
