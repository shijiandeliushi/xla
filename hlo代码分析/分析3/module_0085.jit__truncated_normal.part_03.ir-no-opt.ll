; ModuleID = '__compute_module_part_03'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@__llvmsplit_unnamed.9 = private unnamed_addr constant [4 x i8] c"\F3\045?"

; Function Attrs: uwtable
define ptr @multiply_erf_fusion.1(ptr %0) #0 {
  %num_workgroups_gep = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 0
  %num_workgroups = load ptr, ptr %num_workgroups_gep, align 8
  %num_workgroups_x_gep = getelementptr inbounds nuw %XLA_CPU_NumWorkGroups, ptr %num_workgroups, i32 0, i32 0
  %num_workgroups_y_gep = getelementptr inbounds nuw %XLA_CPU_NumWorkGroups, ptr %num_workgroups, i32 0, i32 1
  %num_workgroups_z_gep = getelementptr inbounds nuw %XLA_CPU_NumWorkGroups, ptr %num_workgroups, i32 0, i32 2
  %num_workgroups_x = load i64, ptr %num_workgroups_x_gep, align 4
  %num_workgroups_y = load i64, ptr %num_workgroups_y_gep, align 4
  %num_workgroups_z = load i64, ptr %num_workgroups_z_gep, align 4
  %workgroup_id_gep = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x_gep = getelementptr inbounds nuw %XLA_CPU_WorkGroupId, ptr %workgroup_id, i32 0, i32 0
  %workgroup_id_y_gep = getelementptr inbounds nuw %XLA_CPU_WorkGroupId, ptr %workgroup_id, i32 0, i32 1
  %workgroup_id_z_gep = getelementptr inbounds nuw %XLA_CPU_WorkGroupId, ptr %workgroup_id, i32 0, i32 2
  %workgroup_id_x = load i64, ptr %workgroup_id_x_gep, align 4
  %workgroup_id_y = load i64, ptr %workgroup_id_y_gep, align 4
  %workgroup_id_z = load i64, ptr %workgroup_id_z_gep, align 4
  %args_gep = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args = load ptr, ptr %args_gep, align 8
  %arg0_gep = getelementptr %XLA_CPU_KernelArg, ptr %args, i32 0, i32 0
  %arg0 = load ptr, ptr %arg0_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep1 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args2 = load ptr, ptr %args_gep1, align 8
  %arg1_gep = getelementptr %XLA_CPU_KernelArg, ptr %args2, i32 1, i32 0
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %2 = load i32, ptr %arg0, align 4, !invariant.load !1, !noalias !4
  %3 = sitofp i32 %2 to float
  %constant.131 = load float, ptr @__llvmsplit_unnamed.9, align 4
  %multiply.25 = fmul float %3, %constant.131
  %4 = call float @llvm.fabs.f32(float %multiply.25)
  %5 = fcmp ole float 0x400EA8F960000000, %4
  %6 = fmul float %multiply.25, %multiply.25
  %7 = call float @llvm.fma.f32(float %6, float 0x3F2E05AA20000000, float 0x3F6BEBB440000000)
  %8 = call float @llvm.fma.f32(float %6, float %7, float 0x3FAA16DD60000000)
  %9 = call float @llvm.fma.f32(float %6, float %8, float 0x3FC7B4E800000000)
  %10 = call float @llvm.fma.f32(float %6, float %9, float 0x3FF20DD740000000)
  %11 = fmul float %multiply.25, %10
  %12 = call float @llvm.fma.f32(float %6, float 0xBE7FA720C0000000, float 0x3EF8B11BE0000000)
  %13 = call float @llvm.fma.f32(float %6, float %12, float 0x3F50ADA500000000)
  %14 = call float @llvm.fma.f32(float %6, float %13, float 0x3F8CD0FA80000000)
  %15 = call float @llvm.fma.f32(float %6, float %14, float 0x3FBC698420000000)
  %16 = call float @llvm.fma.f32(float %6, float %15, float 0x3FDFD68940000000)
  %17 = call float @llvm.fma.f32(float %6, float %16, float 1.000000e+00)
  %18 = call float @llvm.copysign.f32(float 1.000000e+00, float %multiply.25)
  %19 = fdiv float %11, %17
  %20 = select i1 %5, float %18, float %19
  store float %20, ptr %arg1, align 4, !alias.scope !4
  br label %return

return:                                           ; preds = %1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #1

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 3}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:9, offset:50332032, size:4}", !6}
!6 = !{!"XLA host kernel multiply_erf_fusion.1 AA domain"}
