# 飞腾派 XLA HLO->LLVM IR 优化设计方案

日期: 2026-05-23
目标硬件: 飞腾派 (ARMv8, NEON only)
目标场景: 大语言模型推理性能优化
优化范围: HLO -> LLVM IR 代码生成阶段

## 背景

XLA CPU 后端有两条 HLO -> LLVM IR 的代码生成路径：

1. **传统路径**: `IrEmitter` / `IrEmitter2` 直接生成 LLVM IR
2. **MLIR 路径**: `FusionCompiler` 将 HLO 降到 MLIR dialect，再经 MLIR pass pipeline 转为 LLVM IR

两条路径最终都汇聚到 `IrCompiler::RunIrPasses()` 运行 LLVM 优化 pass，然后进入 `EmitMachineCode()` 生成机器码。

当前 XLA 对 AArch64 的默认处理是将 NEON-only 处理器映射为 `neoverse-n1`，但飞腾派（FTC66x/FTC86x 系列核心）的微架构与 Neoverse N1 在缓存层次、流水线宽度、NEON 单元吞吐量等方面存在差异。

## 优化分为三个阶段

### 阶段 1：目标识别与 CPU Model 映射

**涉及文件**：`xla/backends/cpu/codegen/cpu_features.{h,cc}`

**当前状态**：AArch64 NEON-only 处理器被映射为 `neoverse-n1`

**改动内容**：
1. 在 `CpuTargetFromMaxFeature()` 中添加飞腾派专用的 CPU model 名称
2. 通过 LLVM `-mcpu` 参数传递正确的 CPU model，让 LLVM 后端生成适配飞腾派微架构的指令调度
3. 在 `DetectMachineAttributes()` 中添加飞腾派 host CPU 检测逻辑

### 阶段 2：LLVM Pass Pipeline 配置调优

**涉及文件**：`xla/backends/cpu/codegen/ir_compiler.{h,cc}`

**当前状态**：
- SLP 向量化被禁用（TODO(b/411125413)）
- 循环展开和循环向量化使用默认参数

**改动内容**：
1. 重新评估开启 SLP 向量化（对 LLM 中 LayerNorm、GELU 等 element-wise 操作有帮助）
2. 调整循环展开策略：LLM 推理 batch=1 时减少过度展开，避免 I-cache 压力和代码膨胀
3. 在 `build_target_machine()` 中优化飞腾派 NEON feature string

### 阶段 3：LLVM IR 生成层优化

**涉及文件**：
- `xla/backends/cpu/codegen/vector_ir_builder.{h,cc}`
- `xla/backends/cpu/codegen/elemental/elemental_kernel_emitter.{h,cc}`
- `xla/backends/cpu/codegen/dot/dot_kernel_emitter.{h,cc}`

**3a) vector_ir_builder — 向量 IR 生成**
- 确认 `vector_register_byte_size()` 对飞腾派正确返回 16 字节（128-bit）
- 调整水平归约、shuffle 等操作的生成策略，匹配 NEON 指令特征

**3b) elemental_kernel_emitter — 元素级计算发射**
- 循环展开因子适配飞腾派 32 个 128-bit NEON 寄存器
- 调整 load/store 对齐策略（对齐到 128-bit）

**3c) dot_kernel_emitter — 矩阵乘法内核（LLM 推理最核心）**
- 调整分块大小 tl_parameter，适配飞腾派 L1/L2 缓存
- 确保 LLVM 后端将分块 IR 有效映射到 NEON load/store 指令

## 关键指标

- 目标：LLM 推理延迟降低，吞吐提升
- 验证方式：对比飞腾派上优化前后的 token generation 延迟和 throughput
- 对比基线：当前 `neoverse-n1` 映射下的性能
