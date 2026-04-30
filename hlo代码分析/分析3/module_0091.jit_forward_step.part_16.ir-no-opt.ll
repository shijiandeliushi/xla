; ModuleID = '__compute_module_part_16'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@copy_bitcast_fusion.4.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 4096]], [1 x [2 x i64]] [[2 x i64] [i64 4096, i64 8192]], [1 x [2 x i64]] [[2 x i64] [i64 8192, i64 12288]], [1 x [2 x i64]] [[2 x i64] [i64 12288, i64 16384]]]
@__llvmsplit_unnamed.28 = private unnamed_addr constant [4 x i8] c"\00\00\00?"
@__llvmsplit_unnamed.29 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@__llvmsplit_unnamed.30 = private unnamed_addr constant [4 x i8] c"*BL?"
@__llvmsplit_unnamed.31 = private unnamed_addr constant [4 x i8] c"\13'7="
@multiply_bitcast_fusion.1.clone_parallel_bounds = private constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 1365]], [1 x [2 x i64]] [[2 x i64] [i64 1365, i64 2730]], [1 x [2 x i64]] [[2 x i64] [i64 2730, i64 4095]], [1 x [2 x i64]] [[2 x i64] [i64 4095, i64 5460]], [1 x [2 x i64]] [[2 x i64] [i64 5460, i64 6825]], [1 x [2 x i64]] [[2 x i64] [i64 6825, i64 8190]], [1 x [2 x i64]] [[2 x i64] [i64 8190, i64 9555]], [1 x [2 x i64]] [[2 x i64] [i64 9555, i64 10920]], [1 x [2 x i64]] [[2 x i64] [i64 10920, i64 12285]], [1 x [2 x i64]] [[2 x i64] [i64 12285, i64 13650]], [1 x [2 x i64]] [[2 x i64] [i64 13650, i64 15015]], [1 x [2 x i64]] [[2 x i64] [i64 15015, i64 16384]]]

; Function Attrs: nounwind memory(none)
declare float @tanhf(float) #0

; Function Attrs: uwtable
define ptr @copy_bitcast_fusion.4.clone(ptr %0) #1 {
  %copy_bitcast_fusion.4.clone.invar_address.dim.1 = alloca i64, align 8
  %copy_bitcast_fusion.4.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @copy_bitcast_fusion.4.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @copy_bitcast_fusion.4.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %copy_bitcast_fusion.4.clone.invar_address.dim.0, align 4
  br label %copy_bitcast_fusion.4.clone.loop_header.dim.0

copy_bitcast_fusion.4.clone.loop_header.dim.0:    ; preds = %copy_bitcast_fusion.4.clone.loop_exit.dim.1, %1
  %copy_bitcast_fusion.4.clone.indvar.dim.0 = load i64, ptr %copy_bitcast_fusion.4.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %copy_bitcast_fusion.4.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %copy_bitcast_fusion.4.clone.loop_exit.dim.0, label %copy_bitcast_fusion.4.clone.loop_body.dim.0

copy_bitcast_fusion.4.clone.loop_body.dim.0:      ; preds = %copy_bitcast_fusion.4.clone.loop_header.dim.0
  store i64 0, ptr %copy_bitcast_fusion.4.clone.invar_address.dim.1, align 4
  br label %copy_bitcast_fusion.4.clone.loop_header.dim.1

copy_bitcast_fusion.4.clone.loop_header.dim.1:    ; preds = %copy_bitcast_fusion.4.clone.loop_body.dim.1, %copy_bitcast_fusion.4.clone.loop_body.dim.0
  %copy_bitcast_fusion.4.clone.indvar.dim.1 = load i64, ptr %copy_bitcast_fusion.4.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %copy_bitcast_fusion.4.clone.indvar.dim.1, 1024
  br i1 %3, label %copy_bitcast_fusion.4.clone.loop_exit.dim.1, label %copy_bitcast_fusion.4.clone.loop_body.dim.1

copy_bitcast_fusion.4.clone.loop_body.dim.1:      ; preds = %copy_bitcast_fusion.4.clone.loop_header.dim.1
  %4 = mul nuw nsw i64 %copy_bitcast_fusion.4.clone.indvar.dim.1, 1
  %5 = add nuw nsw i64 0, %4
  %6 = urem i64 %5, 64
  %7 = udiv i64 %5, 64
  %8 = udiv i64 %7, 16
  %9 = mul nuw nsw i64 %copy_bitcast_fusion.4.clone.indvar.dim.0, 1
  %10 = add nuw nsw i64 0, %9
  %11 = urem i64 %10, 512
  %12 = udiv i64 %10, 512
  %13 = udiv i64 %12, 32
  %14 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %12, i64 %7, i64 %11, i64 %6
  %15 = load float, ptr %14, align 4, !invariant.load !1, !noalias !4
  %16 = getelementptr inbounds [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %copy_bitcast_fusion.4.clone.indvar.dim.0, i64 %copy_bitcast_fusion.4.clone.indvar.dim.1
  store float %15, ptr %16, align 4, !alias.scope !4
  %invar.inc3 = add nuw nsw i64 %copy_bitcast_fusion.4.clone.indvar.dim.1, 1
  store i64 %invar.inc3, ptr %copy_bitcast_fusion.4.clone.invar_address.dim.1, align 4
  br label %copy_bitcast_fusion.4.clone.loop_header.dim.1

copy_bitcast_fusion.4.clone.loop_exit.dim.1:      ; preds = %copy_bitcast_fusion.4.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %copy_bitcast_fusion.4.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %copy_bitcast_fusion.4.clone.invar_address.dim.0, align 4
  br label %copy_bitcast_fusion.4.clone.loop_header.dim.0, !llvm.loop !7

copy_bitcast_fusion.4.clone.loop_exit.dim.0:      ; preds = %copy_bitcast_fusion.4.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %copy_bitcast_fusion.4.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: uwtable
define ptr @multiply_bitcast_fusion.1.clone(ptr %0) #1 {
  %multiply_bitcast_fusion.1.clone.invar_address.dim.1 = alloca i64, align 8
  %multiply_bitcast_fusion.1.clone.invar_address.dim.0 = alloca i64, align 8
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
  %arg0 = load ptr, ptr %arg0_gep, align 8, !invariant.load !1, !dereferenceable !9, !align !3
  %args_gep1 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args2 = load ptr, ptr %args_gep1, align 8
  %arg1_gep = getelementptr %XLA_CPU_KernelArg, ptr %args2, i32 1, i32 0
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !10, !align !3
  %args_gep3 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args4 = load ptr, ptr %args_gep3, align 8
  %arg2_gep = getelementptr %XLA_CPU_KernelArg, ptr %args4, i32 2, i32 0
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !10, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.1.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.1.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %multiply_bitcast_fusion.1.clone.invar_address.dim.0, align 4
  br label %multiply_bitcast_fusion.1.clone.loop_header.dim.0

multiply_bitcast_fusion.1.clone.loop_header.dim.0: ; preds = %multiply_bitcast_fusion.1.clone.loop_exit.dim.1, %1
  %multiply_bitcast_fusion.1.clone.indvar.dim.0 = load i64, ptr %multiply_bitcast_fusion.1.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %multiply_bitcast_fusion.1.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %multiply_bitcast_fusion.1.clone.loop_exit.dim.0, label %multiply_bitcast_fusion.1.clone.loop_body.dim.0

multiply_bitcast_fusion.1.clone.loop_body.dim.0:  ; preds = %multiply_bitcast_fusion.1.clone.loop_header.dim.0
  store i64 0, ptr %multiply_bitcast_fusion.1.clone.invar_address.dim.1, align 4
  br label %multiply_bitcast_fusion.1.clone.loop_header.dim.1

multiply_bitcast_fusion.1.clone.loop_header.dim.1: ; preds = %multiply_bitcast_fusion.1.clone.loop_body.dim.1, %multiply_bitcast_fusion.1.clone.loop_body.dim.0
  %multiply_bitcast_fusion.1.clone.indvar.dim.1 = load i64, ptr %multiply_bitcast_fusion.1.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %multiply_bitcast_fusion.1.clone.indvar.dim.1, 4096
  br i1 %3, label %multiply_bitcast_fusion.1.clone.loop_exit.dim.1, label %multiply_bitcast_fusion.1.clone.loop_body.dim.1

multiply_bitcast_fusion.1.clone.loop_body.dim.1:  ; preds = %multiply_bitcast_fusion.1.clone.loop_header.dim.1
  %4 = mul nuw nsw i64 %multiply_bitcast_fusion.1.clone.indvar.dim.1, 1
  %5 = add nuw nsw i64 0, %4
  %6 = udiv i64 %5, 4096
  %7 = mul nuw nsw i64 %multiply_bitcast_fusion.1.clone.indvar.dim.0, 1
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
  %21 = load float, ptr %20, align 4, !invariant.load !1, !noalias !11
  %22 = getelementptr inbounds [4096 x float], ptr %arg0, i64 0, i64 %5
  %23 = load float, ptr %22, align 4, !invariant.load !1, !noalias !11
  %add.80 = fadd float %21, %23
  %multiply.67 = fmul float %add.80, %add.80
  %multiply.66 = fmul float %multiply.67, %add.80
  %constant.51 = load float, ptr @__llvmsplit_unnamed.31, align 4
  %multiply.65 = fmul float %multiply.66, %constant.51
  %add.79 = fadd float %add.80, %multiply.65
  %constant.50 = load float, ptr @__llvmsplit_unnamed.30, align 4
  %multiply.64 = fmul float %add.79, %constant.50
  %24 = call float @tanhf(float %multiply.64)
  %constant.49 = load float, ptr @__llvmsplit_unnamed.29, align 4
  %add.78 = fadd float %24, %constant.49
  %constant.48 = load float, ptr @__llvmsplit_unnamed.28, align 4
  %multiply.63 = fmul float %add.78, %constant.48
  %multiply.62 = fmul float %add.80, %multiply.63
  %25 = getelementptr inbounds [16384 x [4096 x float]], ptr %arg2, i64 0, i64 %multiply_bitcast_fusion.1.clone.indvar.dim.0, i64 %multiply_bitcast_fusion.1.clone.indvar.dim.1
  store float %multiply.62, ptr %25, align 4, !alias.scope !11
  %invar.inc5 = add nuw nsw i64 %multiply_bitcast_fusion.1.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %multiply_bitcast_fusion.1.clone.invar_address.dim.1, align 4
  br label %multiply_bitcast_fusion.1.clone.loop_header.dim.1

multiply_bitcast_fusion.1.clone.loop_exit.dim.1:  ; preds = %multiply_bitcast_fusion.1.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %multiply_bitcast_fusion.1.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %multiply_bitcast_fusion.1.clone.invar_address.dim.0, align 4
  br label %multiply_bitcast_fusion.1.clone.loop_header.dim.0, !llvm.loop !14

multiply_bitcast_fusion.1.clone.loop_exit.dim.0:  ; preds = %multiply_bitcast_fusion.1.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %multiply_bitcast_fusion.1.clone.loop_exit.dim.0
  ret ptr null
}

attributes #0 = { nounwind memory(none) }
attributes #1 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 16}
!1 = !{}
!2 = !{i64 67108864}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:148, offset:0, size:67108864}", !6}
!6 = !{!"XLA host kernel copy_bitcast_fusion.4.clone AA domain"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = !{i64 16384}
!10 = !{i64 268435456}
!11 = !{!12}
!12 = !{!"result slice: {index:148, offset:0, size:268435456}", !13}
!13 = !{!"XLA host kernel multiply_bitcast_fusion.1.clone AA domain"}
!14 = distinct !{!14, !8}
