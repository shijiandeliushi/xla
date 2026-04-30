; ModuleID = '__compute_module_broadcast.2_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

; Function Attrs: uwtable
define ptr @broadcast.2_kernel(ptr %0) #0 {
  %broadcast.2.invar_address.dim.1 = alloca i64, align 8
  %broadcast.2.invar_address.dim.0 = alloca i64, align 8
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
  store i64 0, ptr %broadcast.2.invar_address.dim.0, align 4
  br label %broadcast.2.loop_header.dim.0

broadcast.2.loop_header.dim.0:                    ; preds = %broadcast.2.loop_exit.dim.1, %1
  %broadcast.2.indvar.dim.0 = load i64, ptr %broadcast.2.invar_address.dim.0, align 4
  %2 = icmp uge i64 %broadcast.2.indvar.dim.0, 32
  br i1 %2, label %broadcast.2.loop_exit.dim.0, label %broadcast.2.loop_body.dim.0

broadcast.2.loop_body.dim.0:                      ; preds = %broadcast.2.loop_header.dim.0
  store i64 0, ptr %broadcast.2.invar_address.dim.1, align 4
  br label %broadcast.2.loop_header.dim.1

broadcast.2.loop_header.dim.1:                    ; preds = %broadcast.2.loop_body.dim.1, %broadcast.2.loop_body.dim.0
  %broadcast.2.indvar.dim.1 = load i64, ptr %broadcast.2.invar_address.dim.1, align 4
  %3 = icmp uge i64 %broadcast.2.indvar.dim.1, 64
  br i1 %3, label %broadcast.2.loop_exit.dim.1, label %broadcast.2.loop_body.dim.1

broadcast.2.loop_body.dim.1:                      ; preds = %broadcast.2.loop_header.dim.1
  %4 = load float, ptr %arg0, align 4, !invariant.load !1, !noalias !5
  %5 = getelementptr inbounds [32 x [64 x float]], ptr %arg1, i64 0, i64 %broadcast.2.indvar.dim.0, i64 %broadcast.2.indvar.dim.1
  store float %4, ptr %5, align 4, !alias.scope !5
  %invar.inc3 = add nuw nsw i64 %broadcast.2.indvar.dim.1, 1
  store i64 %invar.inc3, ptr %broadcast.2.invar_address.dim.1, align 4
  br label %broadcast.2.loop_header.dim.1

broadcast.2.loop_exit.dim.1:                      ; preds = %broadcast.2.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %broadcast.2.indvar.dim.0, 1
  store i64 %invar.inc, ptr %broadcast.2.invar_address.dim.0, align 4
  br label %broadcast.2.loop_header.dim.0, !llvm.loop !8

broadcast.2.loop_exit.dim.0:                      ; preds = %broadcast.2.loop_header.dim.0
  br label %return

return:                                           ; preds = %broadcast.2.loop_exit.dim.0
  ret ptr null
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 8192}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:8192}", !7}
!7 = !{!"XLA host kernel broadcast.2_kernel AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
