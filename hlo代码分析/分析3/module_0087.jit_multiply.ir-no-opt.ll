; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@broadcast_multiply_fusion.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 1024]], [1 x [2 x i64]] [[2 x i64] [i64 1024, i64 2048]], [1 x [2 x i64]] [[2 x i64] [i64 2048, i64 3072]], [1 x [2 x i64]] [[2 x i64] [i64 3072, i64 4096]]]

; Function Attrs: uwtable
define ptr @broadcast_multiply_fusion.clone(ptr %0) #0 {
  %broadcast_multiply_fusion.clone.invar_address.dim.1 = alloca i64, align 8
  %broadcast_multiply_fusion.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %broadcast_multiply_fusion.clone.invar_address.dim.0, align 4
  br label %broadcast_multiply_fusion.clone.loop_header.dim.0

broadcast_multiply_fusion.clone.loop_header.dim.0: ; preds = %broadcast_multiply_fusion.clone.loop_exit.dim.1, %1
  %broadcast_multiply_fusion.clone.indvar.dim.0 = load i64, ptr %broadcast_multiply_fusion.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %broadcast_multiply_fusion.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %broadcast_multiply_fusion.clone.loop_exit.dim.0, label %broadcast_multiply_fusion.clone.loop_body.dim.0

broadcast_multiply_fusion.clone.loop_body.dim.0:  ; preds = %broadcast_multiply_fusion.clone.loop_header.dim.0
  store i64 0, ptr %broadcast_multiply_fusion.clone.invar_address.dim.1, align 4
  br label %broadcast_multiply_fusion.clone.loop_header.dim.1

broadcast_multiply_fusion.clone.loop_header.dim.1: ; preds = %broadcast_multiply_fusion.clone.loop_body.dim.1, %broadcast_multiply_fusion.clone.loop_body.dim.0
  %broadcast_multiply_fusion.clone.indvar.dim.1 = load i64, ptr %broadcast_multiply_fusion.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %broadcast_multiply_fusion.clone.indvar.dim.1, 1024
  br i1 %3, label %broadcast_multiply_fusion.clone.loop_exit.dim.1, label %broadcast_multiply_fusion.clone.loop_body.dim.1

broadcast_multiply_fusion.clone.loop_body.dim.1:  ; preds = %broadcast_multiply_fusion.clone.loop_header.dim.1
  %4 = getelementptr inbounds [4096 x [1024 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.indvar.dim.0, i64 %broadcast_multiply_fusion.clone.indvar.dim.1
  %5 = load float, ptr %4, align 4, !invariant.load !1, !noalias !5
  %6 = load float, ptr %arg1, align 4, !invariant.load !1, !noalias !5
  %multiply.1 = fmul float %5, %6
  %7 = getelementptr inbounds [4096 x [1024 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.indvar.dim.0, i64 %broadcast_multiply_fusion.clone.indvar.dim.1
  store float %multiply.1, ptr %7, align 4, !alias.scope !5
  %invar.inc5 = add nuw nsw i64 %broadcast_multiply_fusion.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %broadcast_multiply_fusion.clone.invar_address.dim.1, align 4
  br label %broadcast_multiply_fusion.clone.loop_header.dim.1

broadcast_multiply_fusion.clone.loop_exit.dim.1:  ; preds = %broadcast_multiply_fusion.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %broadcast_multiply_fusion.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %broadcast_multiply_fusion.clone.invar_address.dim.0, align 4
  br label %broadcast_multiply_fusion.clone.loop_header.dim.0, !llvm.loop !8

broadcast_multiply_fusion.clone.loop_exit.dim.0:  ; preds = %broadcast_multiply_fusion.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %broadcast_multiply_fusion.clone.loop_exit.dim.0
  ret ptr null
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 16777216}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:16777216}", !7}
!7 = !{!"XLA host kernel broadcast_multiply_fusion.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
