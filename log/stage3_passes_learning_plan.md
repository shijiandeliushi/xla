# Stage 3 HLO Passes 学习方案

## 背景

用户是大学生创新创业项目成员，正在学习 OpenXLA 编译器的 HLO 优化流程。需要深入理解 `CpuCompiler::RunHloPassesThroughLayoutAssn` 第三阶段（算子拆解与标准化）的 21 个 Pass 的具体工作原理——每个 Pass 如何一步步优化 HLO 代码。

**核心需求**：通过编写 HLO 测试代码，打印每个 Pass 优化前后的代码差异，进行对比，清晰显示变化过程。

## 推荐方案：双轨并行

### Part 1: Shell 脚本 + hlo-opt（快速探索，覆盖全部 21 个 Pass）

**思路**：利用已有的 `hlo-opt` 工具（`xla/hlo/tools/hlo_opt/`），为每个 Pass 编写触发该 Pass 的 `.hlo` 输入文件，然后用脚本批量运行并展示 diff。

**优点**：无需重新编译测试代码，编辑 `.hlo` 文件后即时运行，diff 带颜色高亮

**实现步骤**：

#### 步骤 1：将 7 个未注册的 Pass 注册到 hlo-opt

当前 `opt_lib.cc` 中只注册了 14 个，有 7 个在 `xla/service/` 下的 Pass 未注册。需要修改：

- **文件**: `xla/hlo/tools/hlo_opt/opt_lib.cc` — 添加 7 个 `#include` 和 `RegisterPass<>()`
- **文件**: `xla/hlo/tools/hlo_opt/BUILD` — 添加 7 个 BUILD 依赖

7 个缺失的 Pass:
| Pass 名 | 注册名 |
|---------|--------|
| BatchedGatherScatterNormalizer | `batched_gather_scatter_normalizer` |
| ConditionalToSelect | `conditional-to-select` |
| MapInliner | `map-inline` |
| TopkDecomposer | `topk-decomposer` |
| AllToAllDecomposer | `all_to_all_decomposer` |
| CallInliner | `call-inliner` |
| TriangularSolveExpander | `triangular_solve_expander` |

#### 步骤 2：创建 21 个 HLO 输入文件

目录：`xla/tools/data/stage3_demo/`

每个文件是一个最小化的 HLO 模块，精确触发对应 Pass 的优化逻辑。关键示例：

- `dot_decomposer.hlo` — 非规范 Dot（多非收缩维度）→ 规范 2D Dot + Reshape
- `zero_sized_hlo_elimination.hlo` — `f32[3,0] tanh` → `f32[3,0] constant`
- `map_inliner.hlo` — `map(maximum)` → 直接 `maximum`
- `conditional_to_select.hlo` — Map 内 `conditional(const, const)` → `select`
- `topk_decomposer.hlo` — `topk` → `iota + sort + slice + gte`
- `call_inliner.hlo` — `call(subcomputation)` → 内联展开
- `operand_upcaster.hlo` — bf16 dot → f32 convert + dot + convert
- `batch_dot_simplification.hlo` — size-1 batch dim 消除
- `dynamic_index_splitter.hlo` — 向量索引 → 标量索引
- `rng_expander.hlo` — RNG → 算术运算序列
- `comparison_expander.hlo` — TOTALORDER → sign + select + compare
- ... 其余 10 个

#### 步骤 3：编写演示脚本

**文件**: `xla/tools/demo_stage3_passes.sh`

```bash
#!/bin/bash
# 对每个 Pass 运行 hlo-opt 并展示 before/after diff
HLO_OPT="bazel-bin/xla/hlo/tools/hlo-opt"
DATA_DIR="xla/tools/data/stage3_demo"

for pass_name in "${STAGE3_ORDER[@]}"; do
    echo "============================================================"
    echo "  Pass: $pass_name"
    echo "============================================================"
    echo "=== BEFORE ===" && cat "$DATA_DIR/$pass_name.hlo"
    echo "=== AFTER ===" && "$HLO_OPT" --passes="$pass_name" "$DATA_DIR/$pass_name.hlo"
    echo "=== DIFF ===" && diff --color=auto <(cat "$DATA_DIR/$pass_name.hlo") <("$HLO_OPT" --passes="$pass_name" "$DATA_DIR/$pass_name.hlo")
done
```

---

### Part 2: C++ 测试（深度学习，精选 7 个最有教育意义的 Pass）

**思路**：编写 C++ 单元测试，使用 `HloHardwareIndependentTestBase` 框架，对最重要的 Pass 做深入分析，包含语义验证和详细注释。

**文件**: `xla/service/cpu/stage3_demo_test.cc`（新建）

**BUILD**: 修改 `xla/service/cpu/BUILD`，添加 `xla_cc_test` target

**精选的 7 个 Pass**（按教育价值排序）：

| Pass | 教育点 |
|------|--------|
| **TopkDecomposer** | 最显著：一个 `topk` → `iota + sort + slice + gte`，展示高层语义→底层原语的降级 |
| **DotDecomposer** | 结构规范化：非规范 Dot → 规范 2D Dot + Reshape，展现代码标准化模式 |
| **MapInliner** | 抽象消除：`map(fn)` → 直接调用 `fn`，类比函数内联 |
| **CallInliner** | 函数内联：`call(sub)` → 展开子计算体，传统编译器内联的 HLO 版本 |
| **ConditionalToSelect** | 控制流→数据流：`if/else` → `select`，经典编译优化 |
| **ZeroSizedHloElimination** | 死代码消除：零维度操作 → 常量，展示边界情况清理 |
| **OperandUpcaster** | 精度管理：自动插入 `convert(bf16→f32)` 和 `convert(f32→bf16)` |

**测试模式**：
```cpp
TEST_F(Stage3DemoTest, TopkDecomposerDemo) {
  // 构造 HLO 输入
  TF_ASSERT_OK_AND_ASSIGN(auto module, ParseAndReturnVerifiedModule(R"(
    HloModule demo
    ENTRY main {
      p0 = f32[100] parameter(0)
      ROOT topk = (f32[10], s32[10]) topk(p0), k=10, largest=true
    }
  )"));
  
  // 打印优化前
  LOG(INFO) << "=== BEFORE TopkDecomposer ===\n" << module->ToString();
  
  // 运行 Pass
  TF_ASSERT_OK_AND_ASSIGN(bool changed, RunHloPass(&TopkDecomposer(), module.get()));
  EXPECT_TRUE(changed);
  
  // 打印优化后
  LOG(INFO) << "=== AFTER TopkDecomposer ===\n" << module->ToString();
}
```

运行方式：`bazel test //xla/service/cpu:stage3_demo_test --test_output=all`

---

## 实施顺序

| 阶段 | 内容 | 预计产出 |
|------|------|---------|
| **A** | 修改 `opt_lib.cc` + `BUILD`，注册 7 个缺失 Pass | hlo-opt 支持全部 21 个 Pass |
| **B** | 创建 `xla/tools/data/stage3_demo/` 目录 + 21 个 `.hlo` 文件 | 完整的测试输入集 |
| **C** | 创建 `xla/tools/demo_stage3_passes.sh` 脚本 | 一键运行全部 Pass 的 before/after diff |
| **D** | 创建 `xla/service/cpu/stage3_demo_test.cc` + 修改 BUILD | 7 个深入分析的 C++ 测试用例 |

---

## 注意事项

1. **CPU Only**：所有 21 个 Pass 都是硬件无关的变换，不需要 GPU
2. **部分 Pass 有构造参数**：`OperandUpcaster` 接受 `HloPredicate` 过滤器，`CallInliner` 接受 `single_call_site` 参数——hlo-opt 注册时使用合理的默认值
3. **Pass 之间可能有依赖**：例如 `TopkDecomposer` 生成 TOTALORDER 比较，必须在 `ComparisonExpander` 之前运行——但在独立演示中每个 Pass 单独运行，不存在顺序问题
4. **大型展开**：Cholesky/Qr/Eigh 展开产生大量代码（数百行），在 shell 脚本中做 diff 可能不够直观，建议重点分析结构变化

## 验证方法

- Part 1: 手动运行脚本，确认每个 Pass 的 diff 输出正确且有意义
- Part 2: `bazel test //xla/service/cpu:stage3_demo_test --test_output=all` 确认全部 7 个测试通过，输出清晰的 before/after 对比
