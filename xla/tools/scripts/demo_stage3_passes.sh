#!/bin/bash
# ============================================================
# Stage 3 HLO Passes 演示脚本
#
# 用途: 对 CpuCompiler::RunHloPassesThroughLayoutAssn 第三阶段的
#       每个优化 Pass，运行 hlo-opt 并展示优化前后的 HLO 代码差异
#
# 用法:
#   1. 先构建 hlo-opt:  cd <xla_root> && bazel build //xla/hlo/tools:hlo-opt
#   2. 运行本脚本:       bash xla/tools/demo_stage3_passes.sh
#
# 学习建议:
#   - 从上到下依次观察每个 Pass 做了什么变换
#   - 关注 AFTER 中新增/删除/修改的指令
#   - 对比 TRANSFORM 理解每个 Pass 的优化目标
# ============================================================

set -euo pipefail

# 配置路径 (脚本位于 xla/tools/, 项目根目录是 ../..)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT_ROOT="$(cd "${SCRIPT_DIR}/../.." && pwd)"
HLO_OPT="${PROJECT_ROOT}/bazel-bin/xla/hlo/tools/hlo-opt"
DATA_DIR="${SCRIPT_DIR}/data/stage3_demo"

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m' # No Color

# Stage 3 的 21 个 Pass（按 pipeline 顺序）
# 格式: "pass_name|hlo_file|描述"
declare -a STAGE3_PASSES=(
    "batched_gather_scatter_normalizer|01_batched_gather_scatter_normalizer.hlo|批量Gather/Scatter标准化"
    "result_caster|02_result_caster.hlo|结果类型转换(插入Convert)"
    "dot_decomposer|03_dot_decomposer.hlo|Dot算子规范化(第1次)"
    "operand_upcaster|04_operand_upcaster.hlo|Dot操作数精度提升(bf16->f32)"
    "rng-expander|05_rng_expander.hlo|随机数生成展开"
    "rng-bit-generator-expander|06_rng_bit_generator_expander.hlo|随机位生成器展开(Philox)"
    "zero_sized_hlo_elimination|07_zero_sized_hlo_elimination.hlo|零尺寸HLO消除"
    "dynamic-index-splitter|08_dynamic_index_splitter.hlo|动态索引拆分(向量->标量)"
    "conditional-to-select|09_conditional_to_select.hlo|条件分支转Select(控制流->数据流)"
    "map-inline|10_map_inliner.hlo|Map内联展开"
    "topk-decomposer|11_topk_decomposer.hlo|TopK分解(iota+sort+slice)"
    "comparison-expander|12_comparison_expander.hlo|复杂比较展开(TOTALORDER)"
    "cholesky_expander|13_cholesky_expander.hlo|Cholesky分解展开"
    "qr_expander|14_qr_expander.hlo|QR分解展开"
    "eigh_expander|15_eigh_expander.hlo|特征值分解展开"
    "triangular_solve_expander|16_triangular_solve_expander.hlo|三角求解展开"
    "all_to_all_decomposer|17_all_to_all_decomposer.hlo|AllToAll通信分解"
    "stochastic_convert_decomposer|18_stochastic_convert_decomposer.hlo|随机舍入转换分解"
    "call-inliner|19_call_inliner.hlo|Call内联(函数内联)"
    "batch-dot-simplification|20_batch_dot_simplification.hlo|批Dot退化维度消除"
    "dot_decomposer|21_dot_decomposer.hlo|Dot算子规范化(第2次,修复新产生的非规范Dot)"
)

echo -e "${BOLD}============================================================${NC}"
echo -e "${BOLD}  OpenXLA Stage 3 HLO Passes 演示${NC}"
echo -e "${BOLD}  $(${HLO_OPT} --list-passes 2>/dev/null | head -1 || echo '')${NC}"
echo -e "${BOLD}============================================================${NC}"
echo ""
echo -e "输入文件目录: ${YELLOW}${DATA_DIR}${NC}"
echo ""

# 检查 hlo-opt 是否存在
if [ ! -f "${HLO_OPT}" ]; then
    echo -e "${RED}错误: hlo-opt 未找到，请先构建:${NC}"
    echo -e "  cd ${PROJECT_ROOT}"
    echo -e "  bazel build //xla/hlo/tools:hlo-opt"
    exit 1
fi

# 遍历所有 Pass
TOTAL=${#STAGE3_PASSES[@]}
for i in $(seq 0 $((TOTAL - 1))); do
    IFS='|' read -r PASS_NAME HLO_FILE DESCRIPTION <<< "${STAGE3_PASSES[$i]}"

    INPUT_FILE="${DATA_DIR}/${HLO_FILE}"
    NUM=$((i + 1))

    echo ""
    echo -e "${BOLD}${BLUE}============================================================${NC}"
    echo -e "${BOLD}${BLUE}  [${NUM}/${TOTAL}] ${DESCRIPTION}${NC}"
    echo -e "${BOLD}${BLUE}  Pass: ${PASS_NAME}${NC}"
    echo -e "${BOLD}${BLUE}============================================================${NC}"
    echo ""

    # 检查输入文件
    if [ ! -f "${INPUT_FILE}" ]; then
        echo -e "${RED}  输入文件不存在: ${INPUT_FILE}${NC}"
        continue
    fi

    # ====== BEFORE ======
    echo -e "${BOLD}${YELLOW}  --- BEFORE (优化前) ---${NC}"
    echo ""
    cat "${INPUT_FILE}"
    echo ""

    # 运行 Pass
    AFTER=$("${HLO_OPT}" --passes="${PASS_NAME}" "${INPUT_FILE}" 2>&1) || {
        echo -e "${RED}  Pass 执行失败:${NC}"
        echo "${AFTER}"
        continue
    }

    # 检查是否有变化
    BEFORE_CONTENT=$(cat "${INPUT_FILE}")
    if diff -q <(echo "${BEFORE_CONTENT}") <(echo "${AFTER}") > /dev/null 2>&1; then
        echo -e "${YELLOW}  === 该Pass对此外没有产生变化 (changed=false) ===${NC}"
        echo ""
        continue
    fi

    # ====== AFTER ======
    echo -e "${BOLD}${GREEN}  --- AFTER (优化后) ---${NC}"
    echo ""
    echo "${AFTER}"
    echo ""

    # ====== DIFF ======
    echo -e "${BOLD}${RED}  --- 变化对比 (DIFF) ---${NC}"
    echo ""
    diff --color=auto -u <(echo "${BEFORE_CONTENT}") <(echo "${AFTER}") || true
    echo ""

    # 简短说明
    echo -e "${BLUE}  >>> 说明: ${DESCRIPTION}${NC}"
    echo ""
done

echo ""
echo -e "${BOLD}============================================================${NC}"
echo -e "${BOLD}  演示完成! 共 ${TOTAL} 个 Pass${NC}"
echo -e "${BOLD}============================================================${NC}"
echo ""
echo -e "学习提示:"
echo -e "  1. 注意观察每个 Pass 如何通过 ${YELLOW}分解/替换/消除${NC} 来优化 HLO 代码"
echo -e "  2. 部分 Pass 的输出变化可能很大 (如 Cholesky/Qr/Eigh 展开)"
echo -e "  3. 对比原始代码 ${BLUE}xla/service/cpu/cpu_compiler.cc${NC} 中的 pipeline 顺序"
echo -e "  4. 可以单独运行某个 Pass: ${GREEN}./hlo-opt --passes=PASS_NAME file.hlo${NC}"
