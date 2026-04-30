#!/bin/bash
# =============================================================================
# Stage 3 HLO Passes - 21 个 Pass 单独运行命令
# 每个命令可以独立复制粘贴运行
#
# 使用方法:
#   1. 先编译 hlo-opt: bazel build //xla/hlo/tools:hlo-opt
#   2. 复制下面任意一行命令运行，查看单个 Pass 的效果
#   3. 或者运行: bash xla/tools/demo_stage3_passes.sh (一次性运行全部)
# =============================================================================

HLO_OPT="./bazel-bin/xla/hlo/tools/hlo-opt"
DATA="xla/tools/data/stage3_demo"

# ---- 使用说明 ----
# 以下每个命令格式:
#   $HLO_OPT --passes=<pass_name> $DATA/<file.hlo>
#
# 执行后会打印:
#   - 如果 Pass 匹配了指令: 优化后的 HLO 模块 (AFTER)
#   - 如果 Pass 未匹配: 输出为空或 ORIGINAL BEFORE
#
# 建议配合 diff 使用:
#   diff <(cat $DATA/FILE.hlo) <($HLO_OPT --passes=NAME $DATA/FILE.hlo) --color=auto

echo "============================================"
echo " Stage 3 HLO Passes - 单独运行命令"
echo " 共计 21 个 Pass"
echo "============================================"
echo ""

echo "# 01 - BatchedGatherScatterNormalizer"
echo "# 将带批量维度的 gather/scatter 拆分为非批量形式"
echo "$HLO_OPT --passes=batched_gather_scatter_normalizer $DATA/01_batched_gather_scatter_normalizer.hlo"
echo ""

echo "# 02 - ResultCaster"
echo "# 当 Dot 累加精度 > 输出精度时，在结果后插入 Convert"
echo "$HLO_OPT --passes=result_caster $DATA/02_result_caster.hlo"
echo ""

echo "# 03 - DotDecomposer (第一次)"
echo "# 将非规范 Dot 拆解为 规范2D Dot + Reshape"
echo "$HLO_OPT --passes=dot_decomposer $DATA/03_dot_decomposer.hlo"
echo ""

echo "# 04 - OperandUpcaster"
echo "# 将 Dot 的 bf16 操作数提升为 f32 精度"
echo "$HLO_OPT --passes=operand_upcaster $DATA/04_operand_upcaster.hlo"
echo ""

echo "# 05 - RngExpander"
echo "# 将 kRng 展开为算术运算序列"
echo "$HLO_OPT --passes=rng-expander $DATA/05_rng_expander.hlo"
echo ""

echo "# 06 - RngBitGeneratorExpander"
echo "# 将 kRngBitGenerator 展开为 Philox 算法"
echo "$HLO_OPT --passes=rng-bit-generator-expander $DATA/06_rng_bit_generator_expander.hlo"
echo ""

echo "# 07 - ZeroSizedHloElimination"
echo "# 消除零维度张量的 HLO 指令"
echo "$HLO_OPT --passes=zero_sized_hlo_elimination $DATA/07_zero_sized_hlo_elimination.hlo"
echo ""

echo "# 08 - DynamicIndexSplitter"
echo "# 将 dynamic-slice 的向量索引拆分为标量索引"
echo "$HLO_OPT --passes=dynamic-index-splitter $DATA/08_dynamic_index_splitter.hlo"
echo ""

echo "# 09 - ConditionalToSelect"
echo "# 将 Map 内的 kConditional 转换为 kSelect"
echo "$HLO_OPT --passes=conditional-to-select $DATA/09_conditional_to_select.hlo"
echo ""

echo "# 10 - MapInliner"
echo "# 将 map(fn) 内联展开为直接调用 fn"
echo "$HLO_OPT --passes=map-inline $DATA/10_map_inliner.hlo"
echo ""

echo "# 11 - TopkDecomposer"
echo "# 将 topk 分解为 iota + sort + slice + gte (变化最显著)"
echo "$HLO_OPT --passes=topk-decomposer $DATA/11_topk_decomposer.hlo"
echo ""

echo "# 12 - ComparisonExpander"
echo "# 将 TOTALORDER 比较展开为基础比较 + sign + select"
echo "$HLO_OPT --passes=comparison-expander $DATA/12_comparison_expander.hlo"
echo ""

echo "# 13 - CholeskyExpander"
echo "# 将 Cholesky 分解展开为分块迭代算法"
echo "$HLO_OPT --passes=cholesky_expander $DATA/13_cholesky_expander.hlo"
echo ""

echo "# 14 - QrExpander"
echo "# 将 QR 分解展开为 Householder 反射算法"
echo "$HLO_OPT --passes=qr_expander $DATA/14_qr_expander.hlo"
echo ""

echo "# 15 - EighExpander"
echo "# 将对称矩阵特征值分解展开为 QR 迭代算法"
echo "$HLO_OPT --passes=eigh_expander $DATA/15_eigh_expander.hlo"
echo ""

echo "# 16 - TriangularSolveExpander"
echo "# 将三角方程组求解展开为回代算法"
echo "$HLO_OPT --passes=triangular_solve_expander $DATA/16_triangular_solve_expander.hlo"
echo ""

echo "# 17 - AllToAllDecomposer"
echo "# 将数组形式的 AllToAll 分解为 tuple 形式"
echo "$HLO_OPT --passes=all_to_all_decomposer $DATA/17_all_to_all_decomposer.hlo"
echo ""

echo "# 18 - StochasticConvertDecomposer"
echo "# 将随机舍入类型转换展开为算术运算序列"
echo "$HLO_OPT --passes=stochastic_convert_decomposer $DATA/18_stochastic_convert_decomposer.hlo"
echo ""

echo "# 19 - CallInliner"
echo "# 将 call(sub) 内联展开"
echo "$HLO_OPT --passes=call-inliner $DATA/19_call_inliner.hlo"
echo ""

echo "# 20 - BatchDotSimplification"
echo "# 消除批量 Dot 中 size=1 的退化 batch 维度"
echo "$HLO_OPT --passes=batch-dot-simplification $DATA/20_batch_dot_simplification.hlo"
echo ""

echo "# 21 - DotDecomposer (第二次)"
echo "# BatchDotSimplification 后产生新的非规范 Dot，再次规范化"
echo "$HLO_OPT --passes=dot_decomposer $DATA/21_dot_decomposer.hlo"
echo ""

echo ""
echo "============================================"
echo " 使用示例:"
echo "  # 查看单个 Pass 的优化效果 (before/after diff)"
echo "  diff <(cat $DATA/11_topk_decomposer.hlo) \\"
echo "       <($HLO_OPT --passes=topk-decomposer $DATA/11_topk_decomposer.hlo) \\"
echo "       --color=auto"
echo ""
echo "  # 或者直接运行查看优化后结果"
echo "  $HLO_OPT --passes=topk-decomposer $DATA/11_topk_decomposer.hlo"
echo "============================================"
