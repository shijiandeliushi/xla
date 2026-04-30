; ModuleID = '__compute_module_part_00'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@__llvmsplit_unnamed = private unnamed_addr constant [4 x i8] c"\00\00\00?"
@__llvmsplit_unnamed.1 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@__llvmsplit_unnamed.2 = private unnamed_addr constant [4 x i8] c"*BL?"
@__llvmsplit_unnamed.3 = private unnamed_addr constant [4 x i8] c"\13'7="
@multiply_multiply_fusion.3.clone_parallel_bounds = private constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 10]], [1 x [2 x i64]] [[2 x i64] [i64 10, i64 20]], [1 x [2 x i64]] [[2 x i64] [i64 20, i64 30]], [1 x [2 x i64]] [[2 x i64] [i64 30, i64 40]], [1 x [2 x i64]] [[2 x i64] [i64 40, i64 50]], [1 x [2 x i64]] [[2 x i64] [i64 50, i64 60]], [1 x [2 x i64]] [[2 x i64] [i64 60, i64 70]], [1 x [2 x i64]] [[2 x i64] [i64 70, i64 80]], [1 x [2 x i64]] [[2 x i64] [i64 80, i64 90]], [1 x [2 x i64]] [[2 x i64] [i64 90, i64 100]], [1 x [2 x i64]] [[2 x i64] [i64 100, i64 110]], [1 x [2 x i64]] [[2 x i64] [i64 110, i64 128]]]

; Function Attrs: uwtable
define ptr @multiply_multiply_fusion.3.clone(ptr %0) #0 {
  %multiply_multiply_fusion.3.clone.invar_address.dim.1 = alloca i64, align 8
  %multiply_multiply_fusion.3.clone.invar_address.dim.0 = alloca i64, align 8
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
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep3 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args4 = load ptr, ptr %args_gep3, align 8
  %arg2_gep = getelementptr %XLA_CPU_KernelArg, ptr %args4, i32 2, i32 0
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.3.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.3.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %multiply_multiply_fusion.3.clone.invar_address.dim.0, align 4
  br label %multiply_multiply_fusion.3.clone.loop_header.dim.0

multiply_multiply_fusion.3.clone.loop_header.dim.0: ; preds = %multiply_multiply_fusion.3.clone.loop_exit.dim.1, %1
  %multiply_multiply_fusion.3.clone.indvar.dim.0 = load i64, ptr %multiply_multiply_fusion.3.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %multiply_multiply_fusion.3.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %multiply_multiply_fusion.3.clone.loop_exit.dim.0, label %multiply_multiply_fusion.3.clone.loop_body.dim.0

multiply_multiply_fusion.3.clone.loop_body.dim.0: ; preds = %multiply_multiply_fusion.3.clone.loop_header.dim.0
  store i64 0, ptr %multiply_multiply_fusion.3.clone.invar_address.dim.1, align 4
  br label %multiply_multiply_fusion.3.clone.loop_header.dim.1

multiply_multiply_fusion.3.clone.loop_header.dim.1: ; preds = %multiply_multiply_fusion.3.clone.loop_body.dim.1, %multiply_multiply_fusion.3.clone.loop_body.dim.0
  %multiply_multiply_fusion.3.clone.indvar.dim.1 = load i64, ptr %multiply_multiply_fusion.3.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %multiply_multiply_fusion.3.clone.indvar.dim.1, 2048
  br i1 %3, label %multiply_multiply_fusion.3.clone.loop_exit.dim.1, label %multiply_multiply_fusion.3.clone.loop_body.dim.1

multiply_multiply_fusion.3.clone.loop_body.dim.1: ; preds = %multiply_multiply_fusion.3.clone.loop_header.dim.1
  %4 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.3.clone.indvar.dim.0, i64 %multiply_multiply_fusion.3.clone.indvar.dim.1
  %5 = load float, ptr %4, align 4, !invariant.load !1, !noalias !5
  %6 = getelementptr inbounds [2048 x float], ptr %arg1, i64 0, i64 %multiply_multiply_fusion.3.clone.indvar.dim.1
  %7 = load float, ptr %6, align 4, !invariant.load !1, !noalias !5
  %add.24 = fadd float %5, %7
  %multiply.65 = fmul float %add.24, %add.24
  %multiply.64 = fmul float %multiply.65, %add.24
  %constant.35 = load float, ptr @__llvmsplit_unnamed.3, align 4
  %multiply.63 = fmul float %multiply.64, %constant.35
  %add.22 = fadd float %add.24, %multiply.63
  %constant.34 = load float, ptr @__llvmsplit_unnamed.2, align 4
  %multiply.60 = fmul float %add.22, %constant.34
  %8 = call float @tanhf(float %multiply.60)
  %constant.33 = load float, ptr @__llvmsplit_unnamed.1, align 4
  %add.21 = fadd float %8, %constant.33
  %constant.32 = load float, ptr @__llvmsplit_unnamed, align 4
  %multiply.59 = fmul float %add.21, %constant.32
  %multiply.57 = fmul float %add.24, %multiply.59
  %9 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.3.clone.indvar.dim.0, i64 %multiply_multiply_fusion.3.clone.indvar.dim.1
  store float %multiply.57, ptr %9, align 4, !alias.scope !5
  %invar.inc5 = add nuw nsw i64 %multiply_multiply_fusion.3.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %multiply_multiply_fusion.3.clone.invar_address.dim.1, align 4
  br label %multiply_multiply_fusion.3.clone.loop_header.dim.1

multiply_multiply_fusion.3.clone.loop_exit.dim.1: ; preds = %multiply_multiply_fusion.3.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %multiply_multiply_fusion.3.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %multiply_multiply_fusion.3.clone.invar_address.dim.0, align 4
  br label %multiply_multiply_fusion.3.clone.loop_header.dim.0, !llvm.loop !8

multiply_multiply_fusion.3.clone.loop_exit.dim.0: ; preds = %multiply_multiply_fusion.3.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %multiply_multiply_fusion.3.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: nounwind memory(none)
declare float @tanhf(float) #1

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nounwind memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 8192}
!5 = !{!6}
!6 = !{!"result slice: {index:10, offset:0, size:1048576}", !7}
!7 = !{!"XLA host kernel multiply_multiply_fusion.3.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
