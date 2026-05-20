; ModuleID = '__compute_module_reduce-window.9.clone_elemental_kernel_module'
source_filename = "__compute_module_reduce-window.9.clone_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@0 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF", align 4
@1 = private unnamed_addr constant [4 x i8] zeroinitializer, align 4
@reduce-window.9.clone_parallel_bounds = private constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: uwtable
define ptr @reduce-window.9.clone_kernel(ptr %0) #0 {
  %reducer_function_parameter_addresses = alloca ptr, i32 2, align 8
  %reducer_function_return_value_addr = alloca float, align 4
  %arg_addr12 = alloca float, align 4
  %arg_addr = alloca float, align 4
  %reduce-window.9.clone.invar_address.window.3 = alloca i64, align 8
  %reduce-window.9.clone.invar_address.window.2 = alloca i64, align 8
  %reduce-window.9.clone.invar_address.window.1 = alloca i64, align 8
  %reduce-window.9.clone.invar_address.window.0 = alloca i64, align 8
  %reduce_window_accum_ptr = alloca float, align 4
  %reduce-window.9.clone.invar_address.dim.3 = alloca i64, align 8
  %reduce-window.9.clone.invar_address.dim.2 = alloca i64, align 8
  %reduce-window.9.clone.invar_address.dim.1 = alloca i64, align 8
  %reduce-window.9.clone.invar_address.dim.0 = alloca i64, align 8
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
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !5, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @reduce-window.9.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @reduce-window.9.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %reduce-window.9.clone.invar_address.dim.0, align 4
  br label %reduce-window.9.clone.loop_header.dim.0

reduce-window.9.clone.loop_header.dim.0:          ; preds = %reduce-window.9.clone.loop_exit.dim.1, %1
  %reduce-window.9.clone.indvar.dim.0 = load i64, ptr %reduce-window.9.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %reduce-window.9.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %reduce-window.9.clone.loop_exit.dim.0, label %reduce-window.9.clone.loop_body.dim.0

reduce-window.9.clone.loop_body.dim.0:            ; preds = %reduce-window.9.clone.loop_header.dim.0
  store i64 0, ptr %reduce-window.9.clone.invar_address.dim.1, align 4
  br label %reduce-window.9.clone.loop_header.dim.1

reduce-window.9.clone.loop_header.dim.1:          ; preds = %reduce-window.9.clone.loop_exit.dim.2, %reduce-window.9.clone.loop_body.dim.0
  %reduce-window.9.clone.indvar.dim.1 = load i64, ptr %reduce-window.9.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %reduce-window.9.clone.indvar.dim.1, 16
  br i1 %3, label %reduce-window.9.clone.loop_exit.dim.1, label %reduce-window.9.clone.loop_body.dim.1

reduce-window.9.clone.loop_body.dim.1:            ; preds = %reduce-window.9.clone.loop_header.dim.1
  store i64 0, ptr %reduce-window.9.clone.invar_address.dim.2, align 4
  br label %reduce-window.9.clone.loop_header.dim.2

reduce-window.9.clone.loop_header.dim.2:          ; preds = %reduce-window.9.clone.loop_exit.dim.3, %reduce-window.9.clone.loop_body.dim.1
  %reduce-window.9.clone.indvar.dim.2 = load i64, ptr %reduce-window.9.clone.invar_address.dim.2, align 4
  %4 = icmp uge i64 %reduce-window.9.clone.indvar.dim.2, 512
  br i1 %4, label %reduce-window.9.clone.loop_exit.dim.2, label %reduce-window.9.clone.loop_body.dim.2

reduce-window.9.clone.loop_body.dim.2:            ; preds = %reduce-window.9.clone.loop_header.dim.2
  store i64 0, ptr %reduce-window.9.clone.invar_address.dim.3, align 4
  br label %reduce-window.9.clone.loop_header.dim.3

reduce-window.9.clone.loop_header.dim.3:          ; preds = %reduce-window.9.clone.loop_exit.window.0, %reduce-window.9.clone.loop_body.dim.2
  %reduce-window.9.clone.indvar.dim.3 = load i64, ptr %reduce-window.9.clone.invar_address.dim.3, align 4
  %5 = icmp uge i64 %reduce-window.9.clone.indvar.dim.3, 16
  br i1 %5, label %reduce-window.9.clone.loop_exit.dim.3, label %reduce-window.9.clone.loop_body.dim.3

reduce-window.9.clone.loop_body.dim.3:            ; preds = %reduce-window.9.clone.loop_header.dim.3
  %6 = load float, ptr %arg1, align 4, !invariant.load !1, !noalias !6
  store float %6, ptr %reduce_window_accum_ptr, align 4
  store i64 0, ptr %reduce-window.9.clone.invar_address.window.0, align 4
  br label %reduce-window.9.clone.loop_header.window.0

reduce-window.9.clone.loop_header.window.0:       ; preds = %reduce-window.9.clone.loop_exit.window.1, %reduce-window.9.clone.loop_body.dim.3
  %reduce-window.9.clone.indvar.window.0 = load i64, ptr %reduce-window.9.clone.invar_address.window.0, align 4
  %7 = icmp uge i64 %reduce-window.9.clone.indvar.window.0, 1
  br i1 %7, label %reduce-window.9.clone.loop_exit.window.0, label %reduce-window.9.clone.loop_body.window.0

reduce-window.9.clone.loop_body.window.0:         ; preds = %reduce-window.9.clone.loop_header.window.0
  store i64 0, ptr %reduce-window.9.clone.invar_address.window.1, align 4
  br label %reduce-window.9.clone.loop_header.window.1

reduce-window.9.clone.loop_header.window.1:       ; preds = %reduce-window.9.clone.loop_exit.window.2, %reduce-window.9.clone.loop_body.window.0
  %reduce-window.9.clone.indvar.window.1 = load i64, ptr %reduce-window.9.clone.invar_address.window.1, align 4
  %8 = icmp uge i64 %reduce-window.9.clone.indvar.window.1, 1
  br i1 %8, label %reduce-window.9.clone.loop_exit.window.1, label %reduce-window.9.clone.loop_body.window.1

reduce-window.9.clone.loop_body.window.1:         ; preds = %reduce-window.9.clone.loop_header.window.1
  store i64 0, ptr %reduce-window.9.clone.invar_address.window.2, align 4
  br label %reduce-window.9.clone.loop_header.window.2

reduce-window.9.clone.loop_header.window.2:       ; preds = %reduce-window.9.clone.loop_exit.window.3, %reduce-window.9.clone.loop_body.window.1
  %reduce-window.9.clone.indvar.window.2 = load i64, ptr %reduce-window.9.clone.invar_address.window.2, align 4
  %9 = icmp uge i64 %reduce-window.9.clone.indvar.window.2, 1
  br i1 %9, label %reduce-window.9.clone.loop_exit.window.2, label %reduce-window.9.clone.loop_body.window.2

reduce-window.9.clone.loop_body.window.2:         ; preds = %reduce-window.9.clone.loop_header.window.2
  store i64 0, ptr %reduce-window.9.clone.invar_address.window.3, align 4
  br label %reduce-window.9.clone.loop_header.window.3

reduce-window.9.clone.loop_header.window.3:       ; preds = %in_bounds-after, %reduce-window.9.clone.loop_body.window.2
  %reduce-window.9.clone.indvar.window.3 = load i64, ptr %reduce-window.9.clone.invar_address.window.3, align 4
  %10 = icmp uge i64 %reduce-window.9.clone.indvar.window.3, 32
  br i1 %10, label %reduce-window.9.clone.loop_exit.window.3, label %reduce-window.9.clone.loop_body.window.3

reduce-window.9.clone.loop_body.window.3:         ; preds = %reduce-window.9.clone.loop_header.window.3
  %11 = mul nsw i64 %reduce-window.9.clone.indvar.dim.0, 1
  %12 = mul nsw i64 %reduce-window.9.clone.indvar.window.0, 1
  %13 = add nsw i64 %11, %12
  %14 = sub nsw i64 %13, 0
  %15 = srem i64 %14, 1
  %16 = icmp eq i64 %15, 0
  %17 = and i1 true, %16
  %18 = sdiv i64 %14, 1
  %19 = icmp ult i64 %18, 32
  %20 = and i1 %17, %19
  %21 = mul nsw i64 %reduce-window.9.clone.indvar.dim.1, 1
  %22 = mul nsw i64 %reduce-window.9.clone.indvar.window.1, 1
  %23 = add nsw i64 %21, %22
  %24 = sub nsw i64 %23, 0
  %25 = srem i64 %24, 1
  %26 = icmp eq i64 %25, 0
  %27 = and i1 %20, %26
  %28 = sdiv i64 %24, 1
  %29 = icmp ult i64 %28, 16
  %30 = and i1 %27, %29
  %31 = mul nsw i64 %reduce-window.9.clone.indvar.dim.2, 1
  %32 = mul nsw i64 %reduce-window.9.clone.indvar.window.2, 1
  %33 = add nsw i64 %31, %32
  %34 = sub nsw i64 %33, 0
  %35 = srem i64 %34, 1
  %36 = icmp eq i64 %35, 0
  %37 = and i1 %30, %36
  %38 = sdiv i64 %34, 1
  %39 = icmp ult i64 %38, 512
  %40 = and i1 %37, %39
  %41 = mul nsw i64 %reduce-window.9.clone.indvar.dim.3, 32
  %42 = mul nsw i64 %reduce-window.9.clone.indvar.window.3, 1
  %43 = add nsw i64 %41, %42
  %44 = sub nsw i64 %43, 0
  %45 = srem i64 %44, 1
  %46 = icmp eq i64 %45, 0
  %47 = and i1 %40, %46
  %48 = sdiv i64 %44, 1
  %49 = icmp ult i64 %48, 512
  %50 = and i1 %47, %49
  br i1 %50, label %in_bounds-true, label %in_bounds-false

in_bounds-after:                                  ; preds = %in_bounds-false, %in_bounds-true
  %invar.inc11 = add nuw nsw i64 %reduce-window.9.clone.indvar.window.3, 1
  store i64 %invar.inc11, ptr %reduce-window.9.clone.invar_address.window.3, align 4
  br label %reduce-window.9.clone.loop_header.window.3

reduce-window.9.clone.loop_exit.window.3:         ; preds = %reduce-window.9.clone.loop_header.window.3
  %invar.inc10 = add nuw nsw i64 %reduce-window.9.clone.indvar.window.2, 1
  store i64 %invar.inc10, ptr %reduce-window.9.clone.invar_address.window.2, align 4
  br label %reduce-window.9.clone.loop_header.window.2

reduce-window.9.clone.loop_exit.window.2:         ; preds = %reduce-window.9.clone.loop_header.window.2
  %invar.inc9 = add nuw nsw i64 %reduce-window.9.clone.indvar.window.1, 1
  store i64 %invar.inc9, ptr %reduce-window.9.clone.invar_address.window.1, align 4
  br label %reduce-window.9.clone.loop_header.window.1

reduce-window.9.clone.loop_exit.window.1:         ; preds = %reduce-window.9.clone.loop_header.window.1
  %invar.inc8 = add nuw nsw i64 %reduce-window.9.clone.indvar.window.0, 1
  store i64 %invar.inc8, ptr %reduce-window.9.clone.invar_address.window.0, align 4
  br label %reduce-window.9.clone.loop_header.window.0

reduce-window.9.clone.loop_exit.window.0:         ; preds = %reduce-window.9.clone.loop_header.window.0
  %51 = load float, ptr %reduce_window_accum_ptr, align 4
  %52 = getelementptr inbounds [32 x [16 x [512 x [16 x float]]]], ptr %arg2, i64 0, i64 %reduce-window.9.clone.indvar.dim.0, i64 %reduce-window.9.clone.indvar.dim.1, i64 %reduce-window.9.clone.indvar.dim.2, i64 %reduce-window.9.clone.indvar.dim.3
  store float %51, ptr %52, align 4, !alias.scope !6
  %invar.inc7 = add nuw nsw i64 %reduce-window.9.clone.indvar.dim.3, 1
  store i64 %invar.inc7, ptr %reduce-window.9.clone.invar_address.dim.3, align 4
  br label %reduce-window.9.clone.loop_header.dim.3

reduce-window.9.clone.loop_exit.dim.3:            ; preds = %reduce-window.9.clone.loop_header.dim.3
  %invar.inc6 = add nuw nsw i64 %reduce-window.9.clone.indvar.dim.2, 1
  store i64 %invar.inc6, ptr %reduce-window.9.clone.invar_address.dim.2, align 4
  br label %reduce-window.9.clone.loop_header.dim.2, !llvm.loop !9

reduce-window.9.clone.loop_exit.dim.2:            ; preds = %reduce-window.9.clone.loop_header.dim.2
  %invar.inc5 = add nuw nsw i64 %reduce-window.9.clone.indvar.dim.1, 1
  store i64 %invar.inc5, ptr %reduce-window.9.clone.invar_address.dim.1, align 4
  br label %reduce-window.9.clone.loop_header.dim.1, !llvm.loop !11

reduce-window.9.clone.loop_exit.dim.1:            ; preds = %reduce-window.9.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %reduce-window.9.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %reduce-window.9.clone.invar_address.dim.0, align 4
  br label %reduce-window.9.clone.loop_header.dim.0, !llvm.loop !12

reduce-window.9.clone.loop_exit.dim.0:            ; preds = %reduce-window.9.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %reduce-window.9.clone.loop_exit.dim.0
  ret ptr null

in_bounds-true:                                   ; preds = %reduce-window.9.clone.loop_body.window.3
  %53 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %18, i64 %28, i64 %38, i64 %48
  %54 = load float, ptr %53, align 4, !invariant.load !1, !noalias !6
  %55 = load float, ptr %reduce_window_accum_ptr, align 4
  store float %55, ptr %arg_addr, align 4
  store float %54, ptr %arg_addr12, align 4
  %56 = getelementptr inbounds ptr, ptr %reducer_function_parameter_addresses, i64 0
  store ptr %arg_addr, ptr %56, align 8
  %57 = getelementptr inbounds ptr, ptr %reducer_function_parameter_addresses, i64 1
  store ptr %arg_addr12, ptr %57, align 8
  call void @region_9.449(ptr %reducer_function_return_value_addr, ptr null, ptr %reducer_function_parameter_addresses, ptr null, ptr null, ptr null)
  %58 = load float, ptr %reducer_function_return_value_addr, align 4
  store float %58, ptr %reduce_window_accum_ptr, align 4
  br label %in_bounds-after

in_bounds-false:                                  ; preds = %reduce-window.9.clone.loop_body.window.3
  br label %in_bounds-after
}

; Function Attrs: alwaysinline uwtable
define internal void @region_9.449(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #1 {
entry:
  %add.448 = alloca float, align 4
  %0 = getelementptr inbounds ptr, ptr %params, i64 0
  %Arg_0.446 = load ptr, ptr %0, align 8, !dereferenceable !4, !align !4
  %1 = getelementptr inbounds ptr, ptr %params, i64 1
  %Arg_1.447 = load ptr, ptr %1, align 8, !dereferenceable !4, !align !4
  %2 = load float, ptr %Arg_0.446, align 4, !alias.scope !13, !noalias !16
  %3 = load float, ptr %Arg_1.447, align 4, !alias.scope !18, !noalias !16
  %add.4481 = fadd reassoc float %2, %3
  store float %add.4481, ptr %add.448, align 4, !alias.scope !16
  %load_ret_value = load float, ptr %add.448, align 4
  store float %load_ret_value, ptr %retval, align 4
  br label %return

return:                                           ; preds = %entry
  ret void
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { alwaysinline uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 18}
!1 = !{}
!2 = !{i64 536870912}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{i64 16777216}
!6 = !{!7}
!7 = !{!"result slice: {index:0, offset:0, size:16777216}", !8}
!8 = !{!"XLA host kernel reduce-window.9.clone_kernel AA domain"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = !{!"buffer: {index:92, offset:0, size:4}", !15}
!15 = !{!"XLA global AA domain"}
!16 = !{!17}
!17 = !{!"buffer: {index:94, offset:0, size:4}", !15}
!18 = !{!19}
!19 = !{!"buffer: {index:93, offset:0, size:4}", !15}
