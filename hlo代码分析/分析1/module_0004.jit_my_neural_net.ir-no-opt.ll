; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@0 = private unnamed_addr constant [4 x i8] zeroinitializer

; Function Attrs: uwtable
define void @main.13(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #0 {
entry:
  %fusion.invar_address.dim.1 = alloca i64, align 8
  %fusion.invar_address.dim.0 = alloca i64, align 8
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 2
  %Arg_0.1 = load ptr, ptr %0, align 8, !invariant.load !0, !dereferenceable !1, !align !2
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 0
  %Arg_1.2 = load ptr, ptr %1, align 8, !invariant.load !0, !dereferenceable !3, !align !2
  %2 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %dot.6 = load ptr, ptr %2, align 8, !invariant.load !0, !dereferenceable !4, !align !2
  call void @__xla_cpu_runtime_EigenMatMulF32(ptr %run_options, ptr %dot.6, ptr %Arg_1.2, ptr %Arg_0.1, i64 64, i64 10, i64 32, i32 0, i32 0)
  %3 = getelementptr inbounds ptr, ptr %buffer_table, i64 3
  %Arg_2.3 = load ptr, ptr %3, align 8, !invariant.load !0, !dereferenceable !5, !align !2
  %4 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %fusion = load ptr, ptr %4, align 8, !invariant.load !0, !dereferenceable !4, !align !2
  store i64 0, ptr %fusion.invar_address.dim.0, align 8
  br label %fusion.loop_header.dim.0

return:                                           ; preds = %fusion.loop_exit.dim.0
  ret void

fusion.loop_header.dim.0:                         ; preds = %fusion.loop_exit.dim.1, %entry
  %fusion.indvar.dim.0 = load i64, ptr %fusion.invar_address.dim.0, align 8
  %5 = icmp uge i64 %fusion.indvar.dim.0, 10
  br i1 %5, label %fusion.loop_exit.dim.0, label %fusion.loop_body.dim.0

fusion.loop_body.dim.0:                           ; preds = %fusion.loop_header.dim.0
  store i64 0, ptr %fusion.invar_address.dim.1, align 8
  br label %fusion.loop_header.dim.1

fusion.loop_header.dim.1:                         ; preds = %fusion.loop_body.dim.1, %fusion.loop_body.dim.0
  %fusion.indvar.dim.1 = load i64, ptr %fusion.invar_address.dim.1, align 8
  %6 = icmp uge i64 %fusion.indvar.dim.1, 64
  br i1 %6, label %fusion.loop_exit.dim.1, label %fusion.loop_body.dim.1

fusion.loop_body.dim.1:                           ; preds = %fusion.loop_header.dim.1
  %7 = getelementptr inbounds [10 x [64 x float]], ptr %dot.6, i64 0, i64 %fusion.indvar.dim.0, i64 %fusion.indvar.dim.1
  %8 = load float, ptr %7, align 4, !alias.scope !6
  %9 = getelementptr inbounds [64 x float], ptr %Arg_2.3, i64 0, i64 %fusion.indvar.dim.1
  %10 = load float, ptr %9, align 4, !invariant.load !0, !noalias !6
  %add.0 = fadd float %8, %10
  %constant.0 = load float, ptr @0, align 4
  %11 = fcmp une float %add.0, %add.0
  %12 = fcmp oeq float %constant.0, %constant.0
  %13 = fcmp oge float %add.0, %constant.0
  %14 = and i1 %12, %13
  %15 = or i1 %11, %14
  %maximum.0 = select i1 %15, float %add.0, float %constant.0
  %16 = getelementptr inbounds [10 x [64 x float]], ptr %fusion, i64 0, i64 %fusion.indvar.dim.0, i64 %fusion.indvar.dim.1
  store float %maximum.0, ptr %16, align 4, !alias.scope !6
  %invar.inc1 = add nuw nsw i64 %fusion.indvar.dim.1, 1
  store i64 %invar.inc1, ptr %fusion.invar_address.dim.1, align 8
  br label %fusion.loop_header.dim.1

fusion.loop_exit.dim.1:                           ; preds = %fusion.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %fusion.indvar.dim.0, 1
  store i64 %invar.inc, ptr %fusion.invar_address.dim.0, align 8
  br label %fusion.loop_header.dim.0

fusion.loop_exit.dim.0:                           ; preds = %fusion.loop_header.dim.0
  br label %return
}

; Function Attrs: nounwind memory(argmem: readwrite)
declare void @__xla_cpu_runtime_EigenMatMulF32(ptr, ptr, ptr, ptr, i64, i64, i64, i32, i32) #1

attributes #0 = { uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }
attributes #1 = { nounwind memory(argmem: readwrite) }

!0 = !{}
!1 = !{i64 1280}
!2 = !{i64 16}
!3 = !{i64 8192}
!4 = !{i64 2560}
!5 = !{i64 256}
!6 = !{!7}
!7 = !{!"buffer: {index:1, offset:0, size:2560}", !8}
!8 = !{!"XLA global AA domain"}
