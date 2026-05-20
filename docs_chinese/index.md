# XLA 中文文档索引

本目录包含从 `docs/` 目录翻译的中文文档。以下是所有文档的完整索引，按功能分类组织。

---

## 项目概览与基础概念

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [项目概述.md](项目概述.md) | docs/index.md | XLA 项目介绍、关键优势 |
| [术语表.md](术语表.md) | docs/terminology.md | OpenXLA、XLA、PJRT、StableHLO、CHLO、VHLO、MHLO、HLO、MLIR、LLVM 定义 |
| [架构概述.md](架构概述.md) | docs/architecture.md | XLA 架构：目标（速度、内存、自定义操作、可移植性）及三阶段编译流水线 |
| [形状与布局.md](形状与布局.md) | docs/shapes.md | Shape/Layout 概念：维度编号、minor-to-major 排序、`{0,1}` vs `{1,0}` 示例、填充 |
| [广播机制.md](广播机制.md) | docs/broadcasting.md | 广播语义：标量、低维到高维、退化维度 |
| [architecture(架构).md](architecture(架构).md) | docs/architecture.md | XLA 架构（早期翻译版本） |
| [broadcasting(广播).md](broadcasting(广播).md) | docs/broadcasting.md | 广播机制（早期翻译版本） |

## HLO / IR 相关

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [操作语义.md](操作语义.md) | docs/operation_semantics.md | 所有 XLA 操作的完整语义参考：逐元素操作、张量操作、数据访问、归约、线性代数、控制流、集合通信等 |
| [HLO_Pass概述.md](HLO_Pass概述.md) | docs/hlo_passes.md | HLO Pass 框架、示例：Rematerialization、AlgebraicSimplifier、ConstantFolding、DCE 等，以及 TPU/GPU/CPU 特定 Pass |
| [HLO到Thunks转换.md](HLO到Thunks转换.md) | docs/hlo_to_thunks.md | 完整流水线：预优化 HLO → 优化 Pass → Layout 分配 → 融合 → 调度 → 缓冲区分配 |
| [HLO调试转储.md](HLO调试转储.md) | docs/hlo_dumps.md | XLA_FLAGS 环境变量，在编译各阶段转储 HLO；JAX 特定转储 API；重放和转换工具 |
| [aliasing(别名).md](aliasing(别名).md) | docs/aliasing.md | XLA 别名 API：在构建 XLA 程序时指定输入和输出缓冲区之间的别名关系 |
| [async_ops(异步HLO指令).md](async_ops(异步HLO指令).md) | docs/async_ops.md | 异步 HLO 指令详解 |

## GPU / 后端相关

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [GPU架构概述.md](GPU架构概述.md) | docs/gpu_architecture.md | XLA:GPU 流水线、SPMD 分区、Layout 分配、融合、Triton 代码生成、运行时 |
| [GPU优化级别.md](GPU优化级别.md) | docs/gpu_optimization_levels.md | XLA:GPU 优化级别 (-On) 及其启用的 Pass |
| [emitters(发射器).md](emitters(发射器).md) | docs/emitters.md | XLA:GPU 中生成 HLO 代码的三种发射器 |

## 工具与调优

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [工具链.md](工具链.md) | docs/tools.md | XLA 开发工具：run_hlo_module、multihost_hlo_runner、hlo-opt、Pass 开发流程、格式转换 |
| [多主机HLO运行器.md](多主机HLO运行器.md) | docs/tools_multihost_hlo_runner.md | 多主机 HLO 运行器：多 GPU 运行、单进程示例、MPI 多进程、SLURM |
| [LSP支持.md](LSP支持.md) | docs/lsp.md | 使用 bazel aquery + generate_compile_commands.py 生成 compile_commands.json 配置 clangd |
| [LHS代价模型.md](LHS代价模型.md) | docs/lhs_cost_model.md | 延迟隐藏调度器代价模型内部机制：性能表、ICI 集合通信、GEMM、S 曲线模型、调优 |
| [持久化自动调优.md](持久化自动调优.md) | docs/persisted_autotuning.md | Triton 自动调优缓存：缓存目录、转储/加载、在测试中使用 |
| [XLA标志指南.md](XLA标志指南.md) | docs/flags_guidance.md | XLA 关键标志：正确性、性能、内存、TPU/GPU 特定标志 |
| [索引分析.md](索引分析.md) | docs/indexing.md | HLO 索引分析：索引映射、常见操作映射、索引映射简化器 |

## TPU / SparseCore

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [SparseCore深度解析.md](SparseCore深度解析.md) | docs/sparsecore.md | SparseCore 架构：COO 转换、配置 API、流水线化、内存管理、性能分析、调试标志、量化 |
| [分块布局.md](分块布局.md) | docs/tiled_layout.md | 分块布局 (Tiled Layout)：线性索引公式、pad-reshape-transpose 表示、重复分块、维度组合 |

## 开发者指南

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [developer_guide(XLA开发者指南).md](developer_guide(XLA开发者指南).md) | docs/developer_guide.md | XLA 开发者指南 |
| [developing_new_backend(XLA开发新后端).md](developing_new_backend(XLA开发新后端).md) | docs/developing_new_backend.md | 开发新后端指南 |
| [build_from_source(从源码构建).md](build_from_source(从源码构建).md) | docs/build_from_source.md | 从源码构建 XLA |
| [测试HLO_Pass.md](测试HLO_Pass.md) | docs/test_hlo_passes.md | HLO Pass 测试方法：FileCheck、LIT 运行器、自动生成 CHECK 脚本 |
| [contributing(贡献-未翻译).md](contributing(贡献-未翻译).md) | docs/contributing.md | 贡献指南（未翻译） |
| [copybara(内部代码库特殊说明).md](copybara(内部代码库特殊说明).md) | docs/copybara.md | 内部代码库特殊说明 |

## 其他

| 中文文档 | 英文源文件 | 内容简介 |
| :--- | :--- | :--- |
| [custom_call(XLA自定义调用).md](custom_call(XLA自定义调用).md) | docs/custom_call.md | XLA 自定义调用 |
| [determinism(确定性).md](determinism(确定性).md) | docs/determinism.md | XLA 确定性：何时保证确定性结果 |
| [错误处理概述.md](错误处理概述.md) | docs/errors_overview.md | 错误处理：Status vs CHECK 失败、错误分类 |
| [错误代码.md](错误代码.md) | docs/error_codes.md | XLA 错误代码列表 |
| [error_codes.md](error_codes.md) | docs/error_codes.md | XLA 错误代码（早期翻译版本） |
| [errors_overview.md](errors_overview.md) | docs/errors_overview.md | 错误处理概述（早期翻译版本） |

---

## 文件命名说明

- 以中文命名的文件（如 `项目概述.md`、`GPU架构概述.md`）是较新的翻译，统一使用中文命名
- 以 `英文(中文)` 格式命名的文件（如 `aliasing(别名).md`）是早期翻译，保留了双语命名便于对照
- 每个文件第一行均标注了来源：`> 本文翻译自 docs/[原文件名].md`

## 相关资源

- [OpenXLA 官方文档](https://openxla.org/xla)
- [StableHLO 规范](https://openxla.org/stablehlo/spec)
- [XLA GitHub 仓库](https://github.com/openxla/xla)
