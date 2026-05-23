; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"

!xla_cpu_memory_region_name = !{!0}

!0 = !{!"ir_emitter"}

; ModuleID = '__compute_module_broadcast_multiply_fusion_kernel_module'
source_filename = "__compute_module_broadcast_multiply_fusion_kernel_module"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_KernelArg = type { ptr, i64 }
%kernel_dim3 = type { i64, i64, i64 }

; Function Attrs: uwtable
define ptr @broadcast_multiply_fusion(ptr %0) #0 {
  %2 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %3 = load ptr, ptr %2, align 8, !invariant.load !2
  %4 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 0, i32 0
  %5 = load ptr, ptr %4, align 8, !invariant.load !2, !dereferenceable !3
  %6 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 1, i32 0
  %7 = load ptr, ptr %6, align 8, !invariant.load !2, !dereferenceable !3
  %8 = getelementptr inbounds %XLA_CPU_KernelArg, ptr %3, i32 2, i32 0
  %9 = load ptr, ptr %8, align 8, !invariant.load !2, !dereferenceable !3
  %10 = getelementptr inbounds %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr inbounds %kernel_dim3, ptr %11, i32 0, i32 0
  %13 = load i64, ptr %12, align 4, !invariant.load !2
  %14 = getelementptr inbounds %kernel_dim3, ptr %11, i32 0, i32 1
  %15 = load i64, ptr %14, align 4, !invariant.load !2
  %16 = getelementptr inbounds %kernel_dim3, ptr %11, i32 0, i32 2
  %17 = load i64, ptr %16, align 4, !invariant.load !2
  call void @broadcast_multiply_fusion_wrapped(ptr %5, ptr %7, ptr %9, i64 %13, i64 %15, i64 %17)
  ret ptr null
}

; Function Attrs: alwaysinline
define internal void @broadcast_multiply_fusion_wrapped(ptr noalias align 64 dereferenceable(64) %0, ptr noalias align 64 dereferenceable(64) %1, ptr noalias align 64 dereferenceable(64) %2, i64 %3, i64 %4, i64 %5) #1 {
  br label %7

7:                                                ; preds = %25, %6
  %8 = phi i64 [ %26, %25 ], [ 0, %6 ]
  %9 = icmp slt i64 %8, 4
  br i1 %9, label %10, label %27

10:                                               ; preds = %7
  %11 = mul nsw i64 %8, 4
  br label %12

12:                                               ; preds = %15, %10
  %13 = phi i64 [ %24, %15 ], [ 0, %10 ]
  %14 = icmp slt i64 %13, 4
  br i1 %14, label %15, label %25

15:                                               ; preds = %12
  %16 = add nsw i64 %11, %13
  %17 = getelementptr inbounds [16 x float], ptr %0, i32 0, i64 %16
  %18 = load float, ptr %17, align 4, !invariant.load !2
  %19 = getelementptr inbounds [16 x float], ptr %1, i32 0, i64 %16
  %20 = load float, ptr %19, align 4, !invariant.load !2
  %21 = fadd float %18, %20
  %22 = fmul float %21, 2.000000e+00
  %23 = getelementptr inbounds [16 x float], ptr %2, i32 0, i64 %16
  store float %22, ptr %23, align 4
  %24 = add i64 %13, 1
  br label %12

25:                                               ; preds = %12
  %26 = add i64 %8, 1
  br label %7, !llvm.loop !4

27:                                               ; preds = %7
  ret void
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { alwaysinline }

!llvm.module.flags = !{!0}
!xla_cpu_memory_region_name = !{!1}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!2 = !{}
!3 = !{i64 64}
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}


