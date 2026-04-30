; ModuleID = '__compute_module_part_00'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@__llvmsplit_unnamed.1 = private unnamed_addr constant [4 x i8] zeroinitializer
@bitcast_copy_fusion.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: uwtable
define ptr @bitcast_copy_fusion.clone(ptr %0) #0 {
  %reduce_function_parameter_addresses = alloca ptr, i32 2, align 8
  %reduce_function_return_value_addr = alloca float, align 4
  %arg_addr7 = alloca float, align 4
  %arg_addr = alloca float, align 4
  %reduce.2.inner.invar_address.reduction_dim.3 = alloca i64, align 8
  %accumulator_0 = alloca float, align 4
  %bitcast_copy_fusion.clone.invar_address.dim.3 = alloca i64, align 8
  %bitcast_copy_fusion.clone.invar_address.dim.2 = alloca i64, align 8
  %bitcast_copy_fusion.clone.invar_address.dim.1 = alloca i64, align 8
  %bitcast_copy_fusion.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @bitcast_copy_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @bitcast_copy_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %bitcast_copy_fusion.clone.invar_address.dim.0, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.0

bitcast_copy_fusion.clone.loop_header.dim.0:      ; preds = %bitcast_copy_fusion.clone.loop_exit.dim.1, %1
  %bitcast_copy_fusion.clone.indvar.dim.0 = load i64, ptr %bitcast_copy_fusion.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %bitcast_copy_fusion.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %bitcast_copy_fusion.clone.loop_exit.dim.0, label %bitcast_copy_fusion.clone.loop_body.dim.0

bitcast_copy_fusion.clone.loop_body.dim.0:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.0
  store i64 0, ptr %bitcast_copy_fusion.clone.invar_address.dim.1, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.1

bitcast_copy_fusion.clone.loop_header.dim.1:      ; preds = %bitcast_copy_fusion.clone.loop_exit.dim.2, %bitcast_copy_fusion.clone.loop_body.dim.0
  %bitcast_copy_fusion.clone.indvar.dim.1 = load i64, ptr %bitcast_copy_fusion.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %bitcast_copy_fusion.clone.indvar.dim.1, 16
  br i1 %3, label %bitcast_copy_fusion.clone.loop_exit.dim.1, label %bitcast_copy_fusion.clone.loop_body.dim.1

bitcast_copy_fusion.clone.loop_body.dim.1:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.1
  store i64 0, ptr %bitcast_copy_fusion.clone.invar_address.dim.2, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.2

bitcast_copy_fusion.clone.loop_header.dim.2:      ; preds = %bitcast_copy_fusion.clone.loop_exit.dim.3, %bitcast_copy_fusion.clone.loop_body.dim.1
  %bitcast_copy_fusion.clone.indvar.dim.2 = load i64, ptr %bitcast_copy_fusion.clone.invar_address.dim.2, align 4
  %4 = icmp uge i64 %bitcast_copy_fusion.clone.indvar.dim.2, 512
  br i1 %4, label %bitcast_copy_fusion.clone.loop_exit.dim.2, label %bitcast_copy_fusion.clone.loop_body.dim.2

bitcast_copy_fusion.clone.loop_body.dim.2:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.2
  store i64 0, ptr %bitcast_copy_fusion.clone.invar_address.dim.3, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.3

bitcast_copy_fusion.clone.loop_header.dim.3:      ; preds = %reduce.2.inner.loop_exit.reduction_dim.3, %bitcast_copy_fusion.clone.loop_body.dim.2
  %bitcast_copy_fusion.clone.indvar.dim.3 = load i64, ptr %bitcast_copy_fusion.clone.invar_address.dim.3, align 4
  %5 = icmp uge i64 %bitcast_copy_fusion.clone.indvar.dim.3, 1
  br i1 %5, label %bitcast_copy_fusion.clone.loop_exit.dim.3, label %bitcast_copy_fusion.clone.loop_body.dim.3

bitcast_copy_fusion.clone.loop_body.dim.3:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.3
  %constant.1 = load float, ptr @__llvmsplit_unnamed.1, align 4
  store float %constant.1, ptr %accumulator_0, align 4
  store i64 0, ptr %reduce.2.inner.invar_address.reduction_dim.3, align 4
  br label %reduce.2.inner.loop_header.reduction_dim.3

reduce.2.inner.loop_header.reduction_dim.3:       ; preds = %reduce.2.inner.loop_body.reduction_dim.3, %bitcast_copy_fusion.clone.loop_body.dim.3
  %reduce.2.inner.indvar.reduction_dim.3 = load i64, ptr %reduce.2.inner.invar_address.reduction_dim.3, align 4
  %6 = icmp uge i64 %reduce.2.inner.indvar.reduction_dim.3, 16
  br i1 %6, label %reduce.2.inner.loop_exit.reduction_dim.3, label %reduce.2.inner.loop_body.reduction_dim.3

reduce.2.inner.loop_body.reduction_dim.3:         ; preds = %reduce.2.inner.loop_header.reduction_dim.3
  %7 = load float, ptr %accumulator_0, align 4
  %8 = getelementptr inbounds [32 x [16 x [512 x [16 x float]]]], ptr %arg0, i64 0, i64 %bitcast_copy_fusion.clone.indvar.dim.0, i64 %bitcast_copy_fusion.clone.indvar.dim.1, i64 %bitcast_copy_fusion.clone.indvar.dim.2, i64 %reduce.2.inner.indvar.reduction_dim.3
  %9 = load float, ptr %8, align 4, !invariant.load !1, !noalias !5
  store float %7, ptr %arg_addr, align 4
  store float %9, ptr %arg_addr7, align 4
  %10 = getelementptr inbounds ptr, ptr %reduce_function_parameter_addresses, i64 0
  store ptr %arg_addr, ptr %10, align 8
  %11 = getelementptr inbounds ptr, ptr %reduce_function_parameter_addresses, i64 1
  store ptr %arg_addr7, ptr %11, align 8
  call void @reduce.2(ptr %reduce_function_return_value_addr, ptr null, ptr %reduce_function_parameter_addresses, ptr null, ptr null, ptr null)
  %12 = load float, ptr %reduce_function_return_value_addr, align 4
  store float %12, ptr %accumulator_0, align 4
  %invar.inc6 = add nuw nsw i64 %reduce.2.inner.indvar.reduction_dim.3, 1
  store i64 %invar.inc6, ptr %reduce.2.inner.invar_address.reduction_dim.3, align 4
  br label %reduce.2.inner.loop_header.reduction_dim.3

reduce.2.inner.loop_exit.reduction_dim.3:         ; preds = %reduce.2.inner.loop_header.reduction_dim.3
  %13 = load float, ptr %accumulator_0, align 4
  %14 = getelementptr inbounds [32 x [16 x [512 x [1 x float]]]], ptr %arg1, i64 0, i64 %bitcast_copy_fusion.clone.indvar.dim.0, i64 %bitcast_copy_fusion.clone.indvar.dim.1, i64 %bitcast_copy_fusion.clone.indvar.dim.2, i64 0
  store float %13, ptr %14, align 4, !alias.scope !5
  %invar.inc5 = add nuw nsw i64 %bitcast_copy_fusion.clone.indvar.dim.3, 1
  store i64 %invar.inc5, ptr %bitcast_copy_fusion.clone.invar_address.dim.3, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.3

bitcast_copy_fusion.clone.loop_exit.dim.3:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.3
  %invar.inc4 = add nuw nsw i64 %bitcast_copy_fusion.clone.indvar.dim.2, 1
  store i64 %invar.inc4, ptr %bitcast_copy_fusion.clone.invar_address.dim.2, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.2, !llvm.loop !8

bitcast_copy_fusion.clone.loop_exit.dim.2:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.2
  %invar.inc3 = add nuw nsw i64 %bitcast_copy_fusion.clone.indvar.dim.1, 1
  store i64 %invar.inc3, ptr %bitcast_copy_fusion.clone.invar_address.dim.1, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.1, !llvm.loop !10

bitcast_copy_fusion.clone.loop_exit.dim.1:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %bitcast_copy_fusion.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %bitcast_copy_fusion.clone.invar_address.dim.0, align 4
  br label %bitcast_copy_fusion.clone.loop_header.dim.0, !llvm.loop !11

bitcast_copy_fusion.clone.loop_exit.dim.0:        ; preds = %bitcast_copy_fusion.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %bitcast_copy_fusion.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: alwaysinline uwtable
define internal void @reduce.2(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #1 {
entry:
  %add.0 = alloca float, align 4
  %0 = getelementptr inbounds ptr, ptr %params, i64 0
  %Arg_0.0 = load ptr, ptr %0, align 8, !dereferenceable !12, !align !12
  %1 = getelementptr inbounds ptr, ptr %params, i64 1
  %Arg_1.0 = load ptr, ptr %1, align 8, !dereferenceable !12, !align !12
  %2 = load float, ptr %Arg_0.0, align 4, !alias.scope !13, !noalias !16
  %3 = load float, ptr %Arg_1.0, align 4, !alias.scope !18, !noalias !16
  %add.01 = fadd reassoc float %2, %3
  store float %add.01, ptr %add.0, align 4, !alias.scope !16
  %load_ret_value = load float, ptr %add.0, align 4
  store float %load_ret_value, ptr %retval, align 4
  br label %return

return:                                           ; preds = %entry
  ret void
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { alwaysinline uwtable "denormal-fp-math"="preserve-sign" "frame-pointer"="none" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 16777216}
!3 = !{i64 64}
!4 = !{i64 1048576}
!5 = !{!6}
!6 = !{!"result slice: {index:1, offset:0, size:1048576}", !7}
!7 = !{!"XLA host kernel bitcast_copy_fusion.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = !{i64 4}
!13 = !{!14}
!14 = !{!"buffer: {index:4, offset:0, size:4}", !15}
!15 = !{!"XLA global AA domain"}
!16 = !{!17}
!17 = !{!"buffer: {index:6, offset:0, size:4}", !15}
!18 = !{!19}
!19 = !{!"buffer: {index:5, offset:0, size:4}", !15}
