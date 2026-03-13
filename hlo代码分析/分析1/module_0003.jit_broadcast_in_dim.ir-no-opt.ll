; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: uwtable
define void @main.3(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #0 {
entry:
  %broadcast.2.invar_address.dim.0 = alloca i64, align 8
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %Arg_0.1 = load ptr, ptr %0, align 8, !invariant.load !0, !dereferenceable !1, !align !1
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 0
  %broadcast.2 = load ptr, ptr %1, align 8, !invariant.load !0, !dereferenceable !2, !align !3
  store i64 0, ptr %broadcast.2.invar_address.dim.0, align 8
  br label %broadcast.2.loop_header.dim.0

return:                                           ; preds = %broadcast.2.loop_exit.dim.0
  ret void

broadcast.2.loop_header.dim.0:                    ; preds = %broadcast.2.loop_body.dim.0, %entry
  %broadcast.2.indvar.dim.0 = load i64, ptr %broadcast.2.invar_address.dim.0, align 8
  %2 = icmp uge i64 %broadcast.2.indvar.dim.0, 64
  br i1 %2, label %broadcast.2.loop_exit.dim.0, label %broadcast.2.loop_body.dim.0

broadcast.2.loop_body.dim.0:                      ; preds = %broadcast.2.loop_header.dim.0
  %3 = load float, ptr %Arg_0.1, align 4, !invariant.load !0, !noalias !4
  %4 = getelementptr inbounds [64 x float], ptr %broadcast.2, i64 0, i64 %broadcast.2.indvar.dim.0
  store float %3, ptr %4, align 4, !alias.scope !4
  %invar.inc = add nuw nsw i64 %broadcast.2.indvar.dim.0, 1
  store i64 %invar.inc, ptr %broadcast.2.invar_address.dim.0, align 8
  br label %broadcast.2.loop_header.dim.0

broadcast.2.loop_exit.dim.0:                      ; preds = %broadcast.2.loop_header.dim.0
  br label %return
}

attributes #0 = { uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }

!0 = !{}
!1 = !{i64 4}
!2 = !{i64 256}
!3 = !{i64 16}
!4 = !{!5}
!5 = !{!"buffer: {index:0, offset:0, size:256}", !6}
!6 = !{!"XLA global AA domain"}
