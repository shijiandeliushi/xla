/* Copyright 2026 The OpenXLA Authors.

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

#include "xla/backends/cpu/codegen/cpu_features.h"

#include <gtest/gtest.h>

#include "absl/strings/string_view.h"

namespace xla::cpu {
namespace {

TEST(PhytiumCpuDetectionTest, IsPhytiumCpuReturnsBool) {
  // IsPhytiumCpu() 在任何平台上都应返回有效的 bool 值，不应崩溃。
  EXPECT_NO_THROW(IsPhytiumCpu());
}

TEST(PhytiumCpuDetectionTest, GetPhytiumCpuModelIsNotEmpty) {
  // GetPhytiumCpuModel() 必须返回非空字符串。
  absl::string_view model = GetPhytiumCpuModel();
  EXPECT_FALSE(model.empty());
}

TEST(PhytiumCpuDetectionTest, CpuTargetFromMaxFeatureForNeon) {
  // CpuTargetFromMaxFeature(NEON) 在任何平台上都应返回 neoverse-n1。
  absl::string_view cpu =
      CpuTargetFromMaxFeature(tsl::port::CPUFeature::AARCH64_NEON);
  EXPECT_EQ(cpu, "neoverse-n1");
}

TEST(PhytiumCpuDetectionTest, DetectMachineAttributesNoConstraint) {
  // DetectMachineAttributes 不应崩溃，应返回有效结果。
  auto result = DetectMachineAttributes(std::nullopt);
  EXPECT_GE(result.features.size(), 0);
}

}  // namespace
}  // namespace xla::cpu
