; ModuleID = '__compute_module_part_04'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@__llvmsplit_unnamed.3 = private unnamed_addr constant [4 x i8] c"\00\00\00>"
@subtract_exponential_fusion.5.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]
@__llvmsplit_unnamed.34 = private unnamed_addr constant [4 x i8] c"\00\00\00?"
@__llvmsplit_unnamed.35 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@__llvmsplit_unnamed.36 = private unnamed_addr constant [4 x i8] c"*BL?"
@__llvmsplit_unnamed.37 = private unnamed_addr constant [4 x i8] c"\13'7="
@multiply_bitcast_fusion.clone_parallel_bounds = private constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 1365]], [1 x [2 x i64]] [[2 x i64] [i64 1365, i64 2730]], [1 x [2 x i64]] [[2 x i64] [i64 2730, i64 4095]], [1 x [2 x i64]] [[2 x i64] [i64 4095, i64 5460]], [1 x [2 x i64]] [[2 x i64] [i64 5460, i64 6825]], [1 x [2 x i64]] [[2 x i64] [i64 6825, i64 8190]], [1 x [2 x i64]] [[2 x i64] [i64 8190, i64 9555]], [1 x [2 x i64]] [[2 x i64] [i64 9555, i64 10920]], [1 x [2 x i64]] [[2 x i64] [i64 10920, i64 12285]], [1 x [2 x i64]] [[2 x i64] [i64 12285, i64 13650]], [1 x [2 x i64]] [[2 x i64] [i64 13650, i64 15015]], [1 x [2 x i64]] [[2 x i64] [i64 15015, i64 16384]]]

; Function Attrs: uwtable
define ptr @subtract_exponential_fusion.5.clone(ptr %0) #0 {
  %subtract_exponential_fusion.5.clone.invar_address.dim.3 = alloca i64, align 8
  %subtract_exponential_fusion.5.clone.invar_address.dim.2 = alloca i64, align 8
  %subtract_exponential_fusion.5.clone.invar_address.dim.1 = alloca i64, align 8
  %subtract_exponential_fusion.5.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @subtract_exponential_fusion.5.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @subtract_exponential_fusion.5.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.0, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.0

subtract_exponential_fusion.5.clone.loop_header.dim.0: ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.1, %1
  %subtract_exponential_fusion.5.clone.indvar.dim.0 = load i64, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %subtract_exponential_fusion.5.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %subtract_exponential_fusion.5.clone.loop_exit.dim.0, label %subtract_exponential_fusion.5.clone.loop_body.dim.0

subtract_exponential_fusion.5.clone.loop_body.dim.0: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.0
  store i64 0, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.1, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.1

subtract_exponential_fusion.5.clone.loop_header.dim.1: ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.2, %subtract_exponential_fusion.5.clone.loop_body.dim.0
  %subtract_exponential_fusion.5.clone.indvar.dim.1 = load i64, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %subtract_exponential_fusion.5.clone.indvar.dim.1, 16
  br i1 %3, label %subtract_exponential_fusion.5.clone.loop_exit.dim.1, label %subtract_exponential_fusion.5.clone.loop_body.dim.1

subtract_exponential_fusion.5.clone.loop_body.dim.1: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.1
  store i64 0, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.2, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.2

subtract_exponential_fusion.5.clone.loop_header.dim.2: ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.3, %subtract_exponential_fusion.5.clone.loop_body.dim.1
  %subtract_exponential_fusion.5.clone.indvar.dim.2 = load i64, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.2, align 4
  %4 = icmp uge i64 %subtract_exponential_fusion.5.clone.indvar.dim.2, 512
  br i1 %4, label %subtract_exponential_fusion.5.clone.loop_exit.dim.2, label %subtract_exponential_fusion.5.clone.loop_body.dim.2

subtract_exponential_fusion.5.clone.loop_body.dim.2: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.2
  store i64 0, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.3, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.3

subtract_exponential_fusion.5.clone.loop_header.dim.3: ; preds = %subtract_exponential_fusion.5.clone.loop_body.dim.3, %subtract_exponential_fusion.5.clone.loop_body.dim.2
  %subtract_exponential_fusion.5.clone.indvar.dim.3 = load i64, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.3, align 4
  %5 = icmp uge i64 %subtract_exponential_fusion.5.clone.indvar.dim.3, 512
  br i1 %5, label %subtract_exponential_fusion.5.clone.loop_exit.dim.3, label %subtract_exponential_fusion.5.clone.loop_body.dim.3

subtract_exponential_fusion.5.clone.loop_body.dim.3: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.3
  %6 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %subtract_exponential_fusion.5.clone.indvar.dim.0, i64 %subtract_exponential_fusion.5.clone.indvar.dim.1, i64 %subtract_exponential_fusion.5.clone.indvar.dim.2, i64 %subtract_exponential_fusion.5.clone.indvar.dim.3
  %7 = load float, ptr %6, align 4, !invariant.load !1, !noalias !5
  %constant.79 = load float, ptr @__llvmsplit_unnamed.3, align 4
  %multiply.100 = fmul float %7, %constant.79
  %8 = getelementptr inbounds [32 x [16 x [512 x float]]], ptr %arg0, i64 0, i64 %subtract_exponential_fusion.5.clone.indvar.dim.0, i64 %subtract_exponential_fusion.5.clone.indvar.dim.1, i64 %subtract_exponential_fusion.5.clone.indvar.dim.2
  %9 = load float, ptr %8, align 4, !invariant.load !1, !noalias !5
  %subtract.11 = fsub float %multiply.100, %9
  %10 = call float @llvm.exp.f32(float %subtract.11)
  %11 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %subtract_exponential_fusion.5.clone.indvar.dim.0, i64 %subtract_exponential_fusion.5.clone.indvar.dim.1, i64 %subtract_exponential_fusion.5.clone.indvar.dim.2, i64 %subtract_exponential_fusion.5.clone.indvar.dim.3
  store float %10, ptr %11, align 4, !alias.scope !5
  %invar.inc7 = add nuw nsw i64 %subtract_exponential_fusion.5.clone.indvar.dim.3, 1
  store i64 %invar.inc7, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.3, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.3

subtract_exponential_fusion.5.clone.loop_exit.dim.3: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.3
  %invar.inc6 = add nuw nsw i64 %subtract_exponential_fusion.5.clone.indvar.dim.2, 1
  store i64 %invar.inc6, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.2, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.2, !llvm.loop !8

subtract_exponential_fusion.5.clone.loop_exit.dim.2: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.2
  %invar.inc5 = add nuw nsw i64 %subtract_exponential_fusion.5.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.1, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.1, !llvm.loop !10

subtract_exponential_fusion.5.clone.loop_exit.dim.1: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %subtract_exponential_fusion.5.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %subtract_exponential_fusion.5.clone.invar_address.dim.0, align 4
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.0, !llvm.loop !11

subtract_exponential_fusion.5.clone.loop_exit.dim.0: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp.f32(float) #1

; Function Attrs: nounwind memory(none)
declare float @tanhf(float) #2

; Function Attrs: uwtable
define ptr @multiply_bitcast_fusion.clone(ptr %0) #0 {
  %multiply_bitcast_fusion.clone.invar_address.dim.1 = alloca i64, align 8
  %multiply_bitcast_fusion.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %multiply_bitcast_fusion.clone.invar_address.dim.0, align 4
  br label %multiply_bitcast_fusion.clone.loop_header.dim.0

multiply_bitcast_fusion.clone.loop_header.dim.0:  ; preds = %multiply_bitcast_fusion.clone.loop_exit.dim.1, %1
  %multiply_bitcast_fusion.clone.indvar.dim.0 = load i64, ptr %multiply_bitcast_fusion.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %multiply_bitcast_fusion.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %multiply_bitcast_fusion.clone.loop_exit.dim.0, label %multiply_bitcast_fusion.clone.loop_body.dim.0

multiply_bitcast_fusion.clone.loop_body.dim.0:    ; preds = %multiply_bitcast_fusion.clone.loop_header.dim.0
  store i64 0, ptr %multiply_bitcast_fusion.clone.invar_address.dim.1, align 4
  br label %multiply_bitcast_fusion.clone.loop_header.dim.1

multiply_bitcast_fusion.clone.loop_header.dim.1:  ; preds = %multiply_bitcast_fusion.clone.loop_body.dim.1, %multiply_bitcast_fusion.clone.loop_body.dim.0
  %multiply_bitcast_fusion.clone.indvar.dim.1 = load i64, ptr %multiply_bitcast_fusion.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %multiply_bitcast_fusion.clone.indvar.dim.1, 4096
  br i1 %3, label %multiply_bitcast_fusion.clone.loop_exit.dim.1, label %multiply_bitcast_fusion.clone.loop_body.dim.1

multiply_bitcast_fusion.clone.loop_body.dim.1:    ; preds = %multiply_bitcast_fusion.clone.loop_header.dim.1
  %4 = mul nuw nsw i64 %multiply_bitcast_fusion.clone.indvar.dim.1, 1
  %5 = add nuw nsw i64 0, %4
  %6 = udiv i64 %5, 4096
  %7 = mul nuw nsw i64 %multiply_bitcast_fusion.clone.indvar.dim.0, 1
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
  %add.70 = fadd float %21, %23
  %multiply.59 = fmul float %add.70, %add.70
  %multiply.58 = fmul float %multiply.59, %add.70
  %constant.45 = load float, ptr @__llvmsplit_unnamed.37, align 4
  %multiply.57 = fmul float %multiply.58, %constant.45
  %add.69 = fadd float %add.70, %multiply.57
  %constant.44 = load float, ptr @__llvmsplit_unnamed.36, align 4
  %multiply.56 = fmul float %add.69, %constant.44
  %24 = call float @tanhf(float %multiply.56)
  %constant.43 = load float, ptr @__llvmsplit_unnamed.35, align 4
  %add.68 = fadd float %24, %constant.43
  %constant.42 = load float, ptr @__llvmsplit_unnamed.34, align 4
  %multiply.55 = fmul float %add.68, %constant.42
  %multiply.54 = fmul float %add.70, %multiply.55
  %25 = getelementptr inbounds [16384 x [4096 x float]], ptr %arg2, i64 0, i64 %multiply_bitcast_fusion.clone.indvar.dim.0, i64 %multiply_bitcast_fusion.clone.indvar.dim.1
  store float %multiply.54, ptr %25, align 4, !alias.scope !14
  %invar.inc5 = add nuw nsw i64 %multiply_bitcast_fusion.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %multiply_bitcast_fusion.clone.invar_address.dim.1, align 4
  br label %multiply_bitcast_fusion.clone.loop_header.dim.1

multiply_bitcast_fusion.clone.loop_exit.dim.1:    ; preds = %multiply_bitcast_fusion.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %multiply_bitcast_fusion.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %multiply_bitcast_fusion.clone.invar_address.dim.0, align 4
  br label %multiply_bitcast_fusion.clone.loop_header.dim.0, !llvm.loop !17

multiply_bitcast_fusion.clone.loop_exit.dim.0:    ; preds = %multiply_bitcast_fusion.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %multiply_bitcast_fusion.clone.loop_exit.dim.0
  ret ptr null
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nounwind memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 4}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 536870912}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:536870912, size:536870912}", !7}
!7 = !{!"XLA host kernel subtract_exponential_fusion.5.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = !{i64 16384}
!13 = !{i64 268435456}
!14 = !{!15}
!15 = !{!"result slice: {index:148, offset:0, size:268435456}", !16}
!16 = !{!"XLA host kernel multiply_bitcast_fusion.clone AA domain"}
!17 = distinct !{!17, !9}
