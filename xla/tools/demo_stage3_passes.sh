#!/bin/bash
# =============================================================================
# Stage 3 HLO Passes 学习演示脚本
# 对 21 个 Pass 逐一展示 BEFORE / AFTER / DIFF
# =============================================================================
set -euo pipefail

HLO_OPT="${HLO_OPT:-bazel-bin/xla/hlo/tools/hlo-opt}"
DATA_DIR="${DATA_DIR:-xla/tools/data/stage3_demo}"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# Stage 3 Pass 列表 (按 cpu_compiler.cc 顺序)
declare -A STAGE3_PASSES=(
  [01]="batched_gather_scatter_normalizer|01_batched_gather_scatter_normalizer.hlo"
  [02]="result_caster|02_result_caster.hlo"
  [03]="dot_decomposer|03_dot_decomposer.hlo"
  [04]="operand_upcaster|04_operand_upcaster.hlo"
  [05]="rng-expander|05_rng_expander.hlo"
  [06]="rng-bit-generator-expander|06_rng_bit_generator_expander.hlo"
  [07]="zero_sized_hlo_elimination|07_zero_sized_hlo_elimination.hlo"
  [08]="dynamic-index-splitter|08_dynamic_index_splitter.hlo"
  [09]="conditional-to-select|09_conditional_to_select.hlo"
  [10]="map-inline|10_map_inliner.hlo"
  [11]="topk-decomposer|11_topk_decomposer.hlo"
  [12]="comparison-expander|12_comparison_expander.hlo"
  [13]="cholesky_expander|13_cholesky_expander.hlo"
  [14]="qr_expander|14_qr_expander.hlo"
  [15]="eigh_expander|15_eigh_expander.hlo"
  [16]="triangular_solve_expander|16_triangular_solve_expander.hlo"
  [17]="all_to_all_decomposer|17_all_to_all_decomposer.hlo"
  [18]="stochastic_convert_decomposer|18_stochastic_convert_decomposer.hlo"
  [19]="call-inliner|19_call_inliner.hlo"
  [20]="batch-dot-simplification|20_batch_dot_simplification.hlo"
  [21]="dot_decomposer|21_dot_decomposer.hlo"
)

echo -e "${BOLD}=============================================================================${NC}"
echo -e "${BOLD}  Stage 3 HLO Passes 学习演示 (共 ${#STAGE3_PASSES[@]} 个 Pass)${NC}"
echo -e "${BOLD}=============================================================================${NC}"
echo ""

for idx in $(printf "%02d\n" $(seq 1 21)); do
  IFS='|' read -r pass_name hlo_file <<< "${STAGE3_PASSES[$idx]}"
  hlo_path="$DATA_DIR/$hlo_file"

  if [ ! -f "$hlo_path" ]; then
    echo -e "${RED}[SKIP] $hlo_path not found${NC}"
    continue
  fi

  echo -e "${BOLD}${CYAN}============================================================${NC}"
  echo -e "${BOLD}${CYAN}  [$idx/21] Pass: ${YELLOW}${pass_name}${NC}"
  echo -e "${BOLD}${CYAN}  文件: ${hlo_file}${NC}"
  echo -e "${BOLD}${CYAN}============================================================${NC}"
  echo ""

  # === BEFORE ===
  echo -e "${BOLD}${GREEN}--- BEFORE (输入 HLO) ---${NC}"
  cat "$hlo_path"
  echo ""

  # === AFTER ===
  echo -e "${BOLD}${GREEN}--- AFTER (Pass 优化后) ---${NC}"
  if ! "$HLO_OPT" --passes="$pass_name" "$hlo_path" 2>&1; then
    echo ""
    echo -e "${RED}[ERROR] Pass '${pass_name}' 执行失败${NC}"
  fi
  echo ""

  # === DIFF ===
  echo -e "${BOLD}${GREEN}--- DIFF (红色=删除/原代码, 绿色=新增/优化后) ---${NC}"
  # 使用 git diff 实现颜色高亮
  BEFORE_TMP=$(mktemp)
  AFTER_TMP=$(mktemp)
  cat "$hlo_path" > "$BEFORE_TMP"
  "$HLO_OPT" --passes="$pass_name" "$hlo_path" 2>/dev/null > "$AFTER_TMP" || true
  diff --color=always -u "$BEFORE_TMP" "$AFTER_TMP" || true
  rm -f "$BEFORE_TMP" "$AFTER_TMP"

  echo ""
  echo ""

  # 等待用户按键继续 (可选，交互式模式下使用)
  if [ "${INTERACTIVE:-0}" = "1" ]; then
    read -rp "按 Enter 继续下一个 Pass..."
  fi
done

echo -e "${BOLD}${CYAN}=============================================================================${NC}"
echo -e "${BOLD}${CYAN}  全部 21 个 Pass 演示完成!${NC}"
echo -e "${BOLD}${CYAN}=============================================================================${NC}"
