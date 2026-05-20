; ModuleID = '__compute_module_exponential.2.clone_elemental_kernel_module'
source_filename = "__compute_module_exponential.2.clone_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@exponential.2.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: uwtable
define ptr @exponential.2.clone_kernel(ptr %0) #0 {
  %exponential.2.clone.invar_address.dim.3 = alloca i64, align 8
  %exponential.2.clone.invar_address.dim.2 = alloca i64, align 8
  %exponential.2.clone.invar_address.dim.1 = alloca i64, align 8
  %exponential.2.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @exponential.2.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @exponential.2.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %exponential.2.clone.invar_address.dim.0, align 4
  br label %exponential.2.clone.loop_header.dim.0

exponential.2.clone.loop_header.dim.0:            ; preds = %exponential.2.clone.loop_exit.dim.1, %1
  %exponential.2.clone.indvar.dim.0 = load i64, ptr %exponential.2.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %exponential.2.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %exponential.2.clone.loop_exit.dim.0, label %exponential.2.clone.loop_body.dim.0

exponential.2.clone.loop_body.dim.0:              ; preds = %exponential.2.clone.loop_header.dim.0
  store i64 0, ptr %exponential.2.clone.invar_address.dim.1, align 4
  br label %exponential.2.clone.loop_header.dim.1

exponential.2.clone.loop_header.dim.1:            ; preds = %exponential.2.clone.loop_exit.dim.2, %exponential.2.clone.loop_body.dim.0
  %exponential.2.clone.indvar.dim.1 = load i64, ptr %exponential.2.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %exponential.2.clone.indvar.dim.1, 16
  br i1 %3, label %exponential.2.clone.loop_exit.dim.1, label %exponential.2.clone.loop_body.dim.1

exponential.2.clone.loop_body.dim.1:              ; preds = %exponential.2.clone.loop_header.dim.1
  store i64 0, ptr %exponential.2.clone.invar_address.dim.2, align 4
  br label %exponential.2.clone.loop_header.dim.2

exponential.2.clone.loop_header.dim.2:            ; preds = %exponential.2.clone.loop_exit.dim.3, %exponential.2.clone.loop_body.dim.1
  %exponential.2.clone.indvar.dim.2 = load i64, ptr %exponential.2.clone.invar_address.dim.2, align 4
  %4 = icmp uge i64 %exponential.2.clone.indvar.dim.2, 512
  br i1 %4, label %exponential.2.clone.loop_exit.dim.2, label %exponential.2.clone.loop_body.dim.2

exponential.2.clone.loop_body.dim.2:              ; preds = %exponential.2.clone.loop_header.dim.2
  store i64 0, ptr %exponential.2.clone.invar_address.dim.3, align 4
  br label %exponential.2.clone.loop_header.dim.3

exponential.2.clone.loop_header.dim.3:            ; preds = %exponential.2.clone.loop_body.dim.3, %exponential.2.clone.loop_body.dim.2
  %exponential.2.clone.indvar.dim.3 = load i64, ptr %exponential.2.clone.invar_address.dim.3, align 4
  %5 = icmp uge i64 %exponential.2.clone.indvar.dim.3, 512
  br i1 %5, label %exponential.2.clone.loop_exit.dim.3, label %exponential.2.clone.loop_body.dim.3

exponential.2.clone.loop_body.dim.3:              ; preds = %exponential.2.clone.loop_header.dim.3
  %6 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %exponential.2.clone.indvar.dim.0, i64 %exponential.2.clone.indvar.dim.1, i64 %exponential.2.clone.indvar.dim.2, i64 %exponential.2.clone.indvar.dim.3
  %7 = load float, ptr %6, align 4, !invariant.load !1, !noalias !4
  %8 = call float @llvm.exp.f32(float %7)
  %9 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %exponential.2.clone.indvar.dim.0, i64 %exponential.2.clone.indvar.dim.1, i64 %exponential.2.clone.indvar.dim.2, i64 %exponential.2.clone.indvar.dim.3
  store float %8, ptr %9, align 4, !alias.scope !4
  %invar.inc5 = add nuw nsw i64 %exponential.2.clone.indvar.dim.3, 1
  store i64 %invar.inc5, ptr %exponential.2.clone.invar_address.dim.3, align 4
  br label %exponential.2.clone.loop_header.dim.3

exponential.2.clone.loop_exit.dim.3:              ; preds = %exponential.2.clone.loop_header.dim.3
  %invar.inc4 = add nuw nsw i64 %exponential.2.clone.indvar.dim.2, 1
  store i64 %invar.inc4, ptr %exponential.2.clone.invar_address.dim.2, align 4
  br label %exponential.2.clone.loop_header.dim.2, !llvm.loop !7

exponential.2.clone.loop_exit.dim.2:              ; preds = %exponential.2.clone.loop_header.dim.2
  %invar.inc3 = add nuw nsw i64 %exponential.2.clone.indvar.dim.1, 1
  store i64 %invar.inc3, ptr %exponential.2.clone.invar_address.dim.1, align 4
  br label %exponential.2.clone.loop_header.dim.1, !llvm.loop !9

exponential.2.clone.loop_exit.dim.1:              ; preds = %exponential.2.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %exponential.2.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %exponential.2.clone.invar_address.dim.0, align 4
  br label %exponential.2.clone.loop_header.dim.0, !llvm.loop !10

exponential.2.clone.loop_exit.dim.0:              ; preds = %exponential.2.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %exponential.2.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.exp.f32(float) #1

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 536870912}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:536870912}", !6}
!6 = !{!"XLA host kernel exponential.2.clone_kernel AA domain"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
