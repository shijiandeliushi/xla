; ModuleID = '__compute_module_part_29'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@add_add_fusion.6.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]
@copy_bitcast_fusion.1.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 4096]], [1 x [2 x i64]] [[2 x i64] [i64 4096, i64 8192]], [1 x [2 x i64]] [[2 x i64] [i64 8192, i64 12288]], [1 x [2 x i64]] [[2 x i64] [i64 12288, i64 16384]]]

; Function Attrs: uwtable
define ptr @add_add_fusion.6.clone(ptr %0) #0 {
  %add_add_fusion.6.clone.invar_address.dim.2 = alloca i64, align 8
  %add_add_fusion.6.clone.invar_address.dim.1 = alloca i64, align 8
  %add_add_fusion.6.clone.invar_address.dim.0 = alloca i64, align 8
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
  %args_gep5 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args6 = load ptr, ptr %args_gep5, align 8
  %arg3_gep = getelementptr %XLA_CPU_KernelArg, ptr %args6, i32 3, i32 0
  %arg3 = load ptr, ptr %arg3_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @add_add_fusion.6.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @add_add_fusion.6.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %add_add_fusion.6.clone.invar_address.dim.0, align 4
  br label %add_add_fusion.6.clone.loop_header.dim.0

add_add_fusion.6.clone.loop_header.dim.0:         ; preds = %add_add_fusion.6.clone.loop_exit.dim.1, %1
  %add_add_fusion.6.clone.indvar.dim.0 = load i64, ptr %add_add_fusion.6.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %add_add_fusion.6.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %add_add_fusion.6.clone.loop_exit.dim.0, label %add_add_fusion.6.clone.loop_body.dim.0

add_add_fusion.6.clone.loop_body.dim.0:           ; preds = %add_add_fusion.6.clone.loop_header.dim.0
  store i64 0, ptr %add_add_fusion.6.clone.invar_address.dim.1, align 4
  br label %add_add_fusion.6.clone.loop_header.dim.1

add_add_fusion.6.clone.loop_header.dim.1:         ; preds = %add_add_fusion.6.clone.loop_exit.dim.2, %add_add_fusion.6.clone.loop_body.dim.0
  %add_add_fusion.6.clone.indvar.dim.1 = load i64, ptr %add_add_fusion.6.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %add_add_fusion.6.clone.indvar.dim.1, 512
  br i1 %3, label %add_add_fusion.6.clone.loop_exit.dim.1, label %add_add_fusion.6.clone.loop_body.dim.1

add_add_fusion.6.clone.loop_body.dim.1:           ; preds = %add_add_fusion.6.clone.loop_header.dim.1
  store i64 0, ptr %add_add_fusion.6.clone.invar_address.dim.2, align 4
  br label %add_add_fusion.6.clone.loop_header.dim.2

add_add_fusion.6.clone.loop_header.dim.2:         ; preds = %add_add_fusion.6.clone.loop_body.dim.2, %add_add_fusion.6.clone.loop_body.dim.1
  %add_add_fusion.6.clone.indvar.dim.2 = load i64, ptr %add_add_fusion.6.clone.invar_address.dim.2, align 4
  %4 = icmp uge i64 %add_add_fusion.6.clone.indvar.dim.2, 1024
  br i1 %4, label %add_add_fusion.6.clone.loop_exit.dim.2, label %add_add_fusion.6.clone.loop_body.dim.2

add_add_fusion.6.clone.loop_body.dim.2:           ; preds = %add_add_fusion.6.clone.loop_header.dim.2
  %5 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.6.clone.indvar.dim.0, i64 %add_add_fusion.6.clone.indvar.dim.1, i64 %add_add_fusion.6.clone.indvar.dim.2
  %6 = load float, ptr %5, align 4, !invariant.load !1, !noalias !5
  %7 = mul nuw nsw i64 %add_add_fusion.6.clone.indvar.dim.2, 1
  %8 = add nuw nsw i64 0, %7
  %9 = udiv i64 %8, 1024
  %10 = mul nuw nsw i64 %add_add_fusion.6.clone.indvar.dim.1, 1
  %11 = add nuw nsw i64 0, %10
  %12 = mul nuw nsw i64 %add_add_fusion.6.clone.indvar.dim.0, 512
  %13 = add nuw nsw i64 %11, %12
  %14 = udiv i64 %13, 16384
  %15 = getelementptr inbounds [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %13, i64 %8
  %16 = load float, ptr %15, align 4, !invariant.load !1, !noalias !5
  %17 = getelementptr inbounds [1024 x float], ptr %arg1, i64 0, i64 %add_add_fusion.6.clone.indvar.dim.2
  %18 = load float, ptr %17, align 4, !invariant.load !1, !noalias !5
  %add.98 = fadd float %16, %18
  %add.97 = fadd float %6, %add.98
  %19 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.6.clone.indvar.dim.0, i64 %add_add_fusion.6.clone.indvar.dim.1, i64 %add_add_fusion.6.clone.indvar.dim.2
  store float %add.97, ptr %19, align 4, !alias.scope !5
  %invar.inc8 = add nuw nsw i64 %add_add_fusion.6.clone.indvar.dim.2, 1
  store i64 %invar.inc8, ptr %add_add_fusion.6.clone.invar_address.dim.2, align 4
  br label %add_add_fusion.6.clone.loop_header.dim.2

add_add_fusion.6.clone.loop_exit.dim.2:           ; preds = %add_add_fusion.6.clone.loop_header.dim.2
  %invar.inc7 = add nuw nsw i64 %add_add_fusion.6.clone.indvar.dim.1, 1
  store i64 %invar.inc7, ptr %add_add_fusion.6.clone.invar_address.dim.1, align 4
  br label %add_add_fusion.6.clone.loop_header.dim.1, !llvm.loop !8

add_add_fusion.6.clone.loop_exit.dim.1:           ; preds = %add_add_fusion.6.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %add_add_fusion.6.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %add_add_fusion.6.clone.invar_address.dim.0, align 4
  br label %add_add_fusion.6.clone.loop_header.dim.0, !llvm.loop !10

add_add_fusion.6.clone.loop_exit.dim.0:           ; preds = %add_add_fusion.6.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %add_add_fusion.6.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: uwtable
define ptr @copy_bitcast_fusion.1.clone(ptr %0) #0 {
  %copy_bitcast_fusion.1.clone.invar_address.dim.1 = alloca i64, align 8
  %copy_bitcast_fusion.1.clone.invar_address.dim.0 = alloca i64, align 8
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @copy_bitcast_fusion.1.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @copy_bitcast_fusion.1.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %copy_bitcast_fusion.1.clone.invar_address.dim.0, align 4
  br label %copy_bitcast_fusion.1.clone.loop_header.dim.0

copy_bitcast_fusion.1.clone.loop_header.dim.0:    ; preds = %copy_bitcast_fusion.1.clone.loop_exit.dim.1, %1
  %copy_bitcast_fusion.1.clone.indvar.dim.0 = load i64, ptr %copy_bitcast_fusion.1.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %copy_bitcast_fusion.1.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %copy_bitcast_fusion.1.clone.loop_exit.dim.0, label %copy_bitcast_fusion.1.clone.loop_body.dim.0

copy_bitcast_fusion.1.clone.loop_body.dim.0:      ; preds = %copy_bitcast_fusion.1.clone.loop_header.dim.0
  store i64 0, ptr %copy_bitcast_fusion.1.clone.invar_address.dim.1, align 4
  br label %copy_bitcast_fusion.1.clone.loop_header.dim.1

copy_bitcast_fusion.1.clone.loop_header.dim.1:    ; preds = %copy_bitcast_fusion.1.clone.loop_body.dim.1, %copy_bitcast_fusion.1.clone.loop_body.dim.0
  %copy_bitcast_fusion.1.clone.indvar.dim.1 = load i64, ptr %copy_bitcast_fusion.1.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %copy_bitcast_fusion.1.clone.indvar.dim.1, 1024
  br i1 %3, label %copy_bitcast_fusion.1.clone.loop_exit.dim.1, label %copy_bitcast_fusion.1.clone.loop_body.dim.1

copy_bitcast_fusion.1.clone.loop_body.dim.1:      ; preds = %copy_bitcast_fusion.1.clone.loop_header.dim.1
  %4 = mul nuw nsw i64 %copy_bitcast_fusion.1.clone.indvar.dim.1, 1
  %5 = add nuw nsw i64 0, %4
  %6 = urem i64 %5, 64
  %7 = udiv i64 %5, 64
  %8 = udiv i64 %7, 16
  %9 = mul nuw nsw i64 %copy_bitcast_fusion.1.clone.indvar.dim.0, 1
  %10 = add nuw nsw i64 0, %9
  %11 = urem i64 %10, 512
  %12 = udiv i64 %10, 512
  %13 = udiv i64 %12, 32
  %14 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %12, i64 %7, i64 %11, i64 %6
  %15 = load float, ptr %14, align 4, !invariant.load !1, !noalias !11
  %16 = getelementptr inbounds [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %copy_bitcast_fusion.1.clone.indvar.dim.0, i64 %copy_bitcast_fusion.1.clone.indvar.dim.1
  store float %15, ptr %16, align 4, !alias.scope !11
  %invar.inc3 = add nuw nsw i64 %copy_bitcast_fusion.1.clone.indvar.dim.1, 1
  store i64 %invar.inc3, ptr %copy_bitcast_fusion.1.clone.invar_address.dim.1, align 4
  br label %copy_bitcast_fusion.1.clone.loop_header.dim.1

copy_bitcast_fusion.1.clone.loop_exit.dim.1:      ; preds = %copy_bitcast_fusion.1.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %copy_bitcast_fusion.1.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %copy_bitcast_fusion.1.clone.invar_address.dim.0, align 4
  br label %copy_bitcast_fusion.1.clone.loop_header.dim.0, !llvm.loop !14

copy_bitcast_fusion.1.clone.loop_exit.dim.0:      ; preds = %copy_bitcast_fusion.1.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %copy_bitcast_fusion.1.clone.loop_exit.dim.0
  ret ptr null
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 29}
!1 = !{}
!2 = !{i64 67108864}
!3 = !{i64 64}
!4 = !{i64 4096}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:1073741824, size:67108864}", !7}
!7 = !{!"XLA host kernel add_add_fusion.6.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = !{!12}
!12 = !{!"result slice: {index:148, offset:0, size:67108864}", !13}
!13 = !{!"XLA host kernel copy_bitcast_fusion.1.clone AA domain"}
!14 = distinct !{!14, !9}
