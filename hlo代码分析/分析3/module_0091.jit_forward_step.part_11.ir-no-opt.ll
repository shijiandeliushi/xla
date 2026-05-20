; ModuleID = '__compute_module_part_11'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@transpose_copy_fusion.13.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]
@__llvmsplit_unnamed.22 = private unnamed_addr constant [4 x i8] c"\00\00\00?"
@__llvmsplit_unnamed.23 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@__llvmsplit_unnamed.24 = private unnamed_addr constant [4 x i8] c"*BL?"
@__llvmsplit_unnamed.25 = private unnamed_addr constant [4 x i8] c"\13'7="
@multiply_bitcast_fusion.2.clone_parallel_bounds = private constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 1365]], [1 x [2 x i64]] [[2 x i64] [i64 1365, i64 2730]], [1 x [2 x i64]] [[2 x i64] [i64 2730, i64 4095]], [1 x [2 x i64]] [[2 x i64] [i64 4095, i64 5460]], [1 x [2 x i64]] [[2 x i64] [i64 5460, i64 6825]], [1 x [2 x i64]] [[2 x i64] [i64 6825, i64 8190]], [1 x [2 x i64]] [[2 x i64] [i64 8190, i64 9555]], [1 x [2 x i64]] [[2 x i64] [i64 9555, i64 10920]], [1 x [2 x i64]] [[2 x i64] [i64 10920, i64 12285]], [1 x [2 x i64]] [[2 x i64] [i64 12285, i64 13650]], [1 x [2 x i64]] [[2 x i64] [i64 13650, i64 15015]], [1 x [2 x i64]] [[2 x i64] [i64 15015, i64 16384]]]

; Function Attrs: nounwind memory(none)
declare float @tanhf(float) #0

; Function Attrs: uwtable
define ptr @transpose_copy_fusion.13.clone(ptr %0) #1 {
  %transpose_copy_fusion.13.clone.invar_address.dim.3 = alloca i64, align 8
  %transpose_copy_fusion.13.clone.invar_address.dim.2 = alloca i64, align 8
  %transpose_copy_fusion.13.clone.invar_address.dim.1 = alloca i64, align 8
  %transpose_copy_fusion.13.clone.invar_address.dim.0 = alloca i64, align 8
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
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.13.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.13.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %transpose_copy_fusion.13.clone.invar_address.dim.0, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.0

transpose_copy_fusion.13.clone.loop_header.dim.0: ; preds = %transpose_copy_fusion.13.clone.loop_exit.dim.1, %1
  %transpose_copy_fusion.13.clone.indvar.dim.0 = load i64, ptr %transpose_copy_fusion.13.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %transpose_copy_fusion.13.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %transpose_copy_fusion.13.clone.loop_exit.dim.0, label %transpose_copy_fusion.13.clone.loop_body.dim.0

transpose_copy_fusion.13.clone.loop_body.dim.0:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.0
  store i64 0, ptr %transpose_copy_fusion.13.clone.invar_address.dim.1, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.1

transpose_copy_fusion.13.clone.loop_header.dim.1: ; preds = %transpose_copy_fusion.13.clone.loop_exit.dim.2, %transpose_copy_fusion.13.clone.loop_body.dim.0
  %transpose_copy_fusion.13.clone.indvar.dim.1 = load i64, ptr %transpose_copy_fusion.13.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %transpose_copy_fusion.13.clone.indvar.dim.1, 16
  br i1 %3, label %transpose_copy_fusion.13.clone.loop_exit.dim.1, label %transpose_copy_fusion.13.clone.loop_body.dim.1

transpose_copy_fusion.13.clone.loop_body.dim.1:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.1
  store i64 0, ptr %transpose_copy_fusion.13.clone.invar_address.dim.2, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.2

transpose_copy_fusion.13.clone.loop_header.dim.2: ; preds = %transpose_copy_fusion.13.clone.loop_exit.dim.3, %transpose_copy_fusion.13.clone.loop_body.dim.1
  %transpose_copy_fusion.13.clone.indvar.dim.2 = load i64, ptr %transpose_copy_fusion.13.clone.invar_address.dim.2, align 4
  %4 = icmp uge i64 %transpose_copy_fusion.13.clone.indvar.dim.2, 64
  br i1 %4, label %transpose_copy_fusion.13.clone.loop_exit.dim.2, label %transpose_copy_fusion.13.clone.loop_body.dim.2

transpose_copy_fusion.13.clone.loop_body.dim.2:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.2
  store i64 0, ptr %transpose_copy_fusion.13.clone.invar_address.dim.3, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.3

transpose_copy_fusion.13.clone.loop_header.dim.3: ; preds = %transpose_copy_fusion.13.clone.loop_body.dim.3, %transpose_copy_fusion.13.clone.loop_body.dim.2
  %transpose_copy_fusion.13.clone.indvar.dim.3 = load i64, ptr %transpose_copy_fusion.13.clone.invar_address.dim.3, align 4
  %5 = icmp uge i64 %transpose_copy_fusion.13.clone.indvar.dim.3, 512
  br i1 %5, label %transpose_copy_fusion.13.clone.loop_exit.dim.3, label %transpose_copy_fusion.13.clone.loop_body.dim.3

transpose_copy_fusion.13.clone.loop_body.dim.3:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.3
  %6 = mul nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.2, 1
  %7 = add nuw nsw i64 0, %6
  %8 = mul nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.1, 64
  %9 = add nuw nsw i64 %7, %8
  %10 = udiv i64 %9, 1024
  %11 = mul nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.3, 1
  %12 = add nuw nsw i64 0, %11
  %13 = udiv i64 %12, 512
  %14 = mul nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.0, 1
  %15 = add nuw nsw i64 0, %14
  %16 = udiv i64 %15, 32
  %17 = mul nuw nsw i64 %9, 1
  %18 = add nuw nsw i64 0, %17
  %19 = udiv i64 %18, 1024
  %20 = mul nuw nsw i64 %12, 1
  %21 = add nuw nsw i64 0, %20
  %22 = mul nuw nsw i64 %15, 512
  %23 = add nuw nsw i64 %21, %22
  %24 = udiv i64 %23, 16384
  %25 = getelementptr inbounds [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %23, i64 %18
  %26 = load float, ptr %25, align 4, !invariant.load !1, !noalias !5
  %27 = getelementptr inbounds [1024 x float], ptr %arg0, i64 0, i64 %9
  %28 = load float, ptr %27, align 4, !invariant.load !1, !noalias !5
  %add.117 = fadd float %26, %28
  %29 = getelementptr inbounds [32 x [16 x [64 x [512 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.13.clone.indvar.dim.0, i64 %transpose_copy_fusion.13.clone.indvar.dim.1, i64 %transpose_copy_fusion.13.clone.indvar.dim.2, i64 %transpose_copy_fusion.13.clone.indvar.dim.3
  store float %add.117, ptr %29, align 4, !alias.scope !5
  %invar.inc7 = add nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.3, 1
  store i64 %invar.inc7, ptr %transpose_copy_fusion.13.clone.invar_address.dim.3, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.3

transpose_copy_fusion.13.clone.loop_exit.dim.3:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.3
  %invar.inc6 = add nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.2, 1
  store i64 %invar.inc6, ptr %transpose_copy_fusion.13.clone.invar_address.dim.2, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.2, !llvm.loop !8

transpose_copy_fusion.13.clone.loop_exit.dim.2:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.2
  %invar.inc5 = add nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %transpose_copy_fusion.13.clone.invar_address.dim.1, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.1, !llvm.loop !10

transpose_copy_fusion.13.clone.loop_exit.dim.1:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %transpose_copy_fusion.13.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %transpose_copy_fusion.13.clone.invar_address.dim.0, align 4
  br label %transpose_copy_fusion.13.clone.loop_header.dim.0, !llvm.loop !11

transpose_copy_fusion.13.clone.loop_exit.dim.0:   ; preds = %transpose_copy_fusion.13.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %transpose_copy_fusion.13.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: uwtable
define ptr @multiply_bitcast_fusion.2.clone(ptr %0) #1 {
  %multiply_bitcast_fusion.2.clone.invar_address.dim.1 = alloca i64, align 8
  %multiply_bitcast_fusion.2.clone.invar_address.dim.0 = alloca i64, align 8
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
  %arg0 = load ptr, ptr %arg0_gep, align 8, !invariant.load !1, !dereferenceable !12, !align !3
  %args_gep1 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args2 = load ptr, ptr %args_gep1, align 8
  %arg1_gep = getelementptr %XLA_CPU_KernelArg, ptr %args2, i32 1, i32 0
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !13, !align !3
  %args_gep3 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args4 = load ptr, ptr %args_gep3, align 8
  %arg2_gep = getelementptr %XLA_CPU_KernelArg, ptr %args4, i32 2, i32 0
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !13, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.2.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.2.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %multiply_bitcast_fusion.2.clone.invar_address.dim.0, align 4
  br label %multiply_bitcast_fusion.2.clone.loop_header.dim.0

multiply_bitcast_fusion.2.clone.loop_header.dim.0: ; preds = %multiply_bitcast_fusion.2.clone.loop_exit.dim.1, %1
  %multiply_bitcast_fusion.2.clone.indvar.dim.0 = load i64, ptr %multiply_bitcast_fusion.2.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %multiply_bitcast_fusion.2.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %multiply_bitcast_fusion.2.clone.loop_exit.dim.0, label %multiply_bitcast_fusion.2.clone.loop_body.dim.0

multiply_bitcast_fusion.2.clone.loop_body.dim.0:  ; preds = %multiply_bitcast_fusion.2.clone.loop_header.dim.0
  store i64 0, ptr %multiply_bitcast_fusion.2.clone.invar_address.dim.1, align 4
  br label %multiply_bitcast_fusion.2.clone.loop_header.dim.1

multiply_bitcast_fusion.2.clone.loop_header.dim.1: ; preds = %multiply_bitcast_fusion.2.clone.loop_body.dim.1, %multiply_bitcast_fusion.2.clone.loop_body.dim.0
  %multiply_bitcast_fusion.2.clone.indvar.dim.1 = load i64, ptr %multiply_bitcast_fusion.2.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %multiply_bitcast_fusion.2.clone.indvar.dim.1, 4096
  br i1 %3, label %multiply_bitcast_fusion.2.clone.loop_exit.dim.1, label %multiply_bitcast_fusion.2.clone.loop_body.dim.1

multiply_bitcast_fusion.2.clone.loop_body.dim.1:  ; preds = %multiply_bitcast_fusion.2.clone.loop_header.dim.1
  %4 = mul nuw nsw i64 %multiply_bitcast_fusion.2.clone.indvar.dim.1, 1
  %5 = add nuw nsw i64 0, %4
  %6 = udiv i64 %5, 4096
  %7 = mul nuw nsw i64 %multiply_bitcast_fusion.2.clone.indvar.dim.0, 1
  %8 = add nuw nsw i64 0, %7
  %9 = urem i64 %8, 512
  %10 = udiv i64 %8, 512
  %11 = udiv i64 %10, 32
  %12 = mul nuw nsw i64 %5, 1
  %13 = add nuw nsw i64 0, %12
  %14 = udiv i64 %13, 4096
  %15 = mul nuw nsw i64 %9, 1
  %16 = add nuw nsw i64 0, %15
  %17 = mul nuw nsw i64 %10, 512
  %18 = add nuw nsw i64 %16, %17
  %19 = udiv i64 %18, 16384
  %20 = getelementptr inbounds [16384 x [4096 x float]], ptr %arg1, i64 0, i64 %18, i64 %13
  %21 = load float, ptr %20, align 4, !invariant.load !1, !noalias !14
  %22 = getelementptr inbounds [4096 x float], ptr %arg0, i64 0, i64 %5
  %23 = load float, ptr %22, align 4, !invariant.load !1, !noalias !14
  %add.90 = fadd float %21, %23
  %multiply.75 = fmul float %add.90, %add.90
  %multiply.74 = fmul float %multiply.75, %add.90
  %constant.57 = load float, ptr @__llvmsplit_unnamed.25, align 4
  %multiply.73 = fmul float %multiply.74, %constant.57
  %add.89 = fadd float %add.90, %multiply.73
  %constant.56 = load float, ptr @__llvmsplit_unnamed.24, align 4
  %multiply.72 = fmul float %add.89, %constant.56
  %24 = call float @tanhf(float %multiply.72)
  %constant.55 = load float, ptr @__llvmsplit_unnamed.23, align 4
  %add.88 = fadd float %24, %constant.55
  %constant.54 = load float, ptr @__llvmsplit_unnamed.22, align 4
  %multiply.71 = fmul float %add.88, %constant.54
  %multiply.70 = fmul float %add.90, %multiply.71
  %25 = getelementptr inbounds [16384 x [4096 x float]], ptr %arg2, i64 0, i64 %multiply_bitcast_fusion.2.clone.indvar.dim.0, i64 %multiply_bitcast_fusion.2.clone.indvar.dim.1
  store float %multiply.70, ptr %25, align 4, !alias.scope !14
  %invar.inc5 = add nuw nsw i64 %multiply_bitcast_fusion.2.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %multiply_bitcast_fusion.2.clone.invar_address.dim.1, align 4
  br label %multiply_bitcast_fusion.2.clone.loop_header.dim.1

multiply_bitcast_fusion.2.clone.loop_exit.dim.1:  ; preds = %multiply_bitcast_fusion.2.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %multiply_bitcast_fusion.2.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %multiply_bitcast_fusion.2.clone.invar_address.dim.0, align 4
  br label %multiply_bitcast_fusion.2.clone.loop_header.dim.0, !llvm.loop !17

multiply_bitcast_fusion.2.clone.loop_exit.dim.0:  ; preds = %multiply_bitcast_fusion.2.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %multiply_bitcast_fusion.2.clone.loop_exit.dim.0
  ret ptr null
}

attributes #0 = { nounwind memory(none) }
attributes #1 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 11}
!1 = !{}
!2 = !{i64 4096}
!3 = !{i64 64}
!4 = !{i64 67108864}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:67108864}", !7}
!7 = !{!"XLA host kernel transpose_copy_fusion.13.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = !{i64 16384}
!13 = !{i64 268435456}
!14 = !{!15}
!15 = !{!"result slice: {index:148, offset:0, size:268435456}", !16}
!16 = !{!"XLA host kernel multiply_bitcast_fusion.2.clone AA domain"}
!17 = distinct !{!17, !9}
