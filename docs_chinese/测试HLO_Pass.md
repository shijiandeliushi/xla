> 本文翻译自 docs/test_hlo_passes.md

# 为 HLO Pass 编写单元测试

有多种方式可以为 HLO Pass 编写单元测试。本页面描述了确保一致性和可读性的**首选方法**。

## 使用内嵌 `CHECK` 行的 `FileCheck` 测试

大多数 HLO Pass 可以使用 [`FileCheck`](https://llvm.org/docs/CommandGuide/FileCheck.html) 测试来测试。将 `CHECK` 行交错插入输入 HLO 模块文本中，确保统一使用 `// CHECK` 作为 `FileCheck` 分隔符（而非 `; CHECK`）。

示例：

```
TEST_F(PriorityFusionTest, FuseBroadcastIntoBitcastConsumers) {
  absl::string_view kHlo = R"(
    HloModule test_module

    // CHECK: ENTRY main
    ENTRY main {
      // CHECK-NEXT: %[[PARAM:.*]] = f32[96]{0} parameter(0)
      param_0 = f32[96]{0} parameter(0)
      broadcast = f32[8,96,128,7]{3,2,1,0} broadcast(param_0), dimensions={1}
      bitcast.6079.2 = f32[8,24,4,128,7]{4,3,2,1,0} bitcast(broadcast)
      // CHECK-NEXT: ROOT %{{.*}} fusion(%[[PARAM]]) {{.*}}
      ROOT transpose.1990.2 = f32[8,24,128,7,4]{4,3,2,1,0} transpose(bitcast.6079.2), dimensions={0,1,3,4,2}
    }
  )";
  RunAndFilecheckHloRewrite(kHlo, std::move(priority_fusion_));
}
```

> 注意：目前代码库中有些测试将输入 HLO 模块和预期模块分开编写。对于未来的测试，**推荐**的方法是内联 `CHECK` 行，这与 MLIR 测试的风格类似。

## 使用 `LIT` 运行器和 `hlo-opt`

在可行的情况下，使用 [`LIT`](https://llvm.org/docs/CommandGuide/lit.html) 运行器和 `hlo-opt`，并将 `CHECK` 行放在对应输入 IR 旁边。

示例：
```
// RUN: hlo-opt %s --platform=gpu --stage=llvm-before-optimizations ...
//   --xla_gpu_target_config_filename=%S/../../../tools/hlo_opt/gpu_specs/%{GPU}.txtpb
//   | FileCheck --check-prefixes=CHECK-%{PTX} %s

HloModule Test, is_scheduled=true
ENTRY main {
  a = f32[100, 200]{1,0} parameter(0)
  // CHECK-PTX:         call void @llvm.nvvm.barrier0
  // CHECK-GCN:         call void @llvm.amdgcn.s.barrier
  ROOT wrapped_b = f32[200,100]{1,0} fusion(...)
}
```

## 自动生成 `CHECK` 的脚本

手动编写测试检查可能工作量很大。可以先运行优化器，查看结果以确保符合预期，然后将优化后的 HLO 转换为 `CHECK` 指令。使用 [`generate_hlo_test_checks.py`](https://github.com/openxla/xla/tree/main/xla/hlo/tools/generate_hlo_test_checks.py) 可以自动在每个测试用例上方插入生成的 `CHECK` 指令。

> **重要提示：** 该工具本质上假定 Pass 的当前行为是正确的，所以务必亲自检查生成的 `CHECK` 行，确认它们与您期望的输出一致。

## （不要）使用图遍历方式

不推荐编写遍历结果图中子节点并与预期操作匹配的测试。这些测试编写繁琐、难以快速阅读、更难调试和修复。请使用上述推荐的方法。
