#!/bin/bash
# ============================================================
# Stage 3 每个 Pass 单独运行的命令
# 使用方法: 复制需要的命令行直接粘贴到终端运行
# 或者在项目根目录执行: bash xla/tools/stage3_passes_commands.sh
# ============================================================

HLO_OPT="bazel-bin/xla/hlo/tools/hlo-opt"
DATA="xla/tools/data/stage3_demo"

echo "========== Stage 3 全部 21 个 Pass 单独运行命令 =========="
echo ""

# 1. BatchedGatherScatterNormalizer
echo "# 1. 批量Gather/Scatter标准化"
echo "${HLO_OPT} --passes=batched_gather_scatter_normalizer ${DATA}/01_batched_gather_scatter_normalizer.hlo"
echo ""

# 2. ResultCaster
echo "# 2. 结果类型转换(插入Convert)"
echo "${HLO_OPT} --passes=result_caster ${DATA}/02_result_caster.hlo"
echo ""

# 3. DotDecomposer (第1次)
echo "# 3. Dot算子规范化(第1次)"
echo "${HLO_OPT} --passes=dot_decomposer ${DATA}/03_dot_decomposer.hlo"
echo ""

# 4. OperandUpcaster
echo "# 4. Dot操作数精度提升(bf16->f32)"
echo "${HLO_OPT} --passes=operand_upcaster ${DATA}/04_operand_upcaster.hlo"
echo ""

# 5. RngExpander
echo "# 5. 随机数生成展开"
echo "${HLO_OPT} --passes=rng-expander ${DATA}/05_rng_expander.hlo"
echo ""

# 6. RngBitGeneratorExpander
echo "# 6. 随机位生成器展开(Philox)"
echo "${HLO_OPT} --passes=rng-bit-generator-expander ${DATA}/06_rng_bit_generator_expander.hlo"
echo ""

# 7. ZeroSizedHloElimination
echo "# 7. 零尺寸HLO消除"
echo "${HLO_OPT} --passes=zero_sized_hlo_elimination ${DATA}/07_zero_sized_hlo_elimination.hlo"
echo ""

# 8. DynamicIndexSplitter
echo "# 8. 动态索引拆分(向量->标量)"
echo "${HLO_OPT} --passes=dynamic-index-splitter ${DATA}/08_dynamic_index_splitter.hlo"
echo ""

# 9. ConditionalToSelect
echo "# 9. 条件分支转Select(控制流->数据流)"
echo "${HLO_OPT} --passes=conditional-to-select ${DATA}/09_conditional_to_select.hlo"
echo ""

# 10. MapInliner
echo "# 10. Map内联展开"
echo "${HLO_OPT} --passes=map-inline ${DATA}/10_map_inliner.hlo"
echo ""

# 11. TopkDecomposer
echo "# 11. TopK分解(iota+sort+slice) -- 变化最显著"
echo "${HLO_OPT} --passes=topk-decomposer ${DATA}/11_topk_decomposer.hlo"
echo ""

# 12. ComparisonExpander
echo "# 12. 复杂比较展开(TOTALORDER)"
echo "${HLO_OPT} --passes=comparison-expander ${DATA}/12_comparison_expander.hlo"
echo ""

# 13. CholeskyExpander
echo "# 13. Cholesky分解展开"
echo "${HLO_OPT} --passes=cholesky_expander ${DATA}/13_cholesky_expander.hlo"
echo ""

# 14. QrExpander
echo "# 14. QR分解展开"
echo "${HLO_OPT} --passes=qr_expander ${DATA}/14_qr_expander.hlo"
echo ""

# 15. EighExpander
echo "# 15. 特征值分解展开"
echo "${HLO_OPT} --passes=eigh_expander ${DATA}/15_eigh_expander.hlo"
echo ""

# 16. TriangularSolveExpander
echo "# 16. 三角求解展开"
echo "${HLO_OPT} --passes=triangular_solve_expander ${DATA}/16_triangular_solve_expander.hlo"
echo ""

# 17. AllToAllDecomposer
echo "# 17. AllToAll通信分解"
echo "${HLO_OPT} --passes=all_to_all_decomposer ${DATA}/17_all_to_all_decomposer.hlo"
echo ""

# 18. StochasticConvertDecomposer
echo "# 18. 随机舍入转换分解"
echo "${HLO_OPT} --passes=stochastic_convert_decomposer ${DATA}/18_stochastic_convert_decomposer.hlo"
echo ""

# 19. CallInliner
echo "# 19. Call内联(函数内联)"
echo "${HLO_OPT} --passes=call-inliner ${DATA}/19_call_inliner.hlo"
echo ""

# 20. BatchDotSimplification
echo "# 20. 批Dot退化维度消除"
echo "${HLO_OPT} --passes=batch-dot-simplification ${DATA}/20_batch_dot_simplification.hlo"
echo ""

# 21. DotDecomposer (第2次)
echo "# 21. Dot算子规范化(第2次,修复BatchDotSimplification产生的新非规范Dot)"
echo "${HLO_OPT} --passes=dot_decomposer ${DATA}/21_dot_decomposer.hlo"

echo ""
echo "========== 共 21 条命令，复制需要的行到终端运行 =========="
