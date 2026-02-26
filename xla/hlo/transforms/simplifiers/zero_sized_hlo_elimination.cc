/* Copyright 2017 The OpenXLA Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
==============================================================================*/

#include "xla/hlo/transforms/simplifiers/zero_sized_hlo_elimination.h"

#include "absl/container/flat_hash_set.h"
#include "absl/status/statusor.h"
#include "absl/strings/string_view.h"
#include "xla/hlo/ir/hlo_computation.h"
#include "xla/hlo/ir/hlo_instruction.h"
#include "xla/hlo/ir/hlo_opcode.h"
#include "xla/layout_util.h"
#include "xla/literal.h"
#include "xla/service/spmd/shardy/constants.h"
#include "xla/service/spmd/shardy/utils.h"
#include "xla/shape.h"
#include "xla/shape_util.h"
#include "xla/util.h"
#include "tsl/platform/errors.h"

namespace xla {

namespace {

// Whether `instruction` has side effects and therefore should be skipped.
//
// An exception is the custom call with target name
// `kLocalToGlobalShapeCallTargetName`. We don't skip it since we want to
// replace its uses with a constant if it's a zero-sized array.
bool ShouldSkipForSideEffect(HloInstruction* instruction) {
  return instruction->HasSideEffect() &&
         !instruction->IsCustomCall(
             sdy::toStringView(sdy::kLocalToGlobalShapeCallTargetName));
}

}  // namespace

absl::StatusOr<bool> ZeroSizedHloElimination::RunImpl(
    HloModule* module,
    const absl::flat_hash_set<absl::string_view>& execution_threads) {
  bool changed = false;
  for (HloComputation* comp :  module->MakeNonfusionComputations(execution_threads)) 
  {
    for (HloInstruction* instruction : comp->MakeInstructionPostOrder()) 
    {
      // 筛选条件 1: 必须是零元素数组 (核心条件)
      // 比如 shape 是 [0], [10, 0], [0, 5, 5]
      if (!ShapeUtil::IsZeroElementArray(instruction->shape())) 
      {
        continue;// 里面有数据，不能删，跳过
      }

      if (ShouldSkipForSideEffect(instruction) ||
          !instruction->shape().IsArray()  || //判断是不是数组
         
          !instruction->shape().is_static() || // 动态形状太复杂，不敢换成常量
          instruction->opcode() == HloOpcode::kConstant  // 如果已经是常量了，就别折腾了
          ) 
          {
        continue;
      }

      // If the instruction doesn't have a layout, use a default layout for
      // the literal.
      Shape shape = instruction->shape();
      if (!LayoutUtil::HasLayout(shape)) {
        LayoutUtil::SetToDefaultLayout(&shape);
      }

      // 如果 instruction 是可安全删除的，那么就替换成常量
      if (comp->IsSafelyRemovable(instruction)) 
      {
        TF_RETURN_IF_ERROR(comp->ReplaceWithNewInstruction(
            instruction,
            HloInstruction::CreateConstant(Literal::CreateFromShape(shape))));
        changed = true;
      } 
      // 如果 instruction 是参数，并且没有控制依赖，并且没有死，那么就替换成常量
      else if (instruction->opcode() == HloOpcode::kParameter &&
                 !instruction->HasControlDependencies() &&
                 !instruction->IsDead()) 
      {
        HloInstruction* constant =
            comp->AddInstruction(HloInstruction::CreateConstant(
                Literal::CreateFromShape(instruction->shape())));
        TF_RETURN_IF_ERROR(instruction->ReplaceAllUsesWith(constant));
        changed = true;
      }
    }
  }
  return changed;
}

}  // namespace xla
