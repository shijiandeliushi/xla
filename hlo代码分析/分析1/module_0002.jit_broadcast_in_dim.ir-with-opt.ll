; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define void @main.3(ptr nocapture readnone %retval, ptr noalias nocapture readnone %run_options, ptr noalias nocapture readnone %params, ptr noalias nocapture readonly %buffer_table, ptr noalias nocapture readnone %status, ptr noalias nocapture readnone %prof_counters) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %Arg_0.1 = load ptr, ptr %0, align 8, !invariant.load !0, !dereferenceable !1, !align !1
  %broadcast.2 = load ptr, ptr %buffer_table, align 8, !invariant.load !0, !dereferenceable !2, !align !3
  %1 = load float, ptr %Arg_0.1, align 4, !invariant.load !0, !noalias !4
  %broadcast.splatinsert = insertelement <8 x float> poison, float %1, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %broadcast.2.loop_exit.dim.1, %entry
  %broadcast.2.invar_address.dim.0.03 = phi i64 [ 0, %entry ], [ %invar.inc, %broadcast.2.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds [32 x [64 x float]], ptr %broadcast.2, i64 0, i64 %broadcast.2.invar_address.dim.0.03, i64 %index
  store <8 x float> %broadcast.splat, ptr %2, align 16, !alias.scope !4
  %index.next = add nuw i64 %index, 8
  %3 = icmp eq i64 %index.next, 64
  br i1 %3, label %broadcast.2.loop_exit.dim.1, label %vector.body, !llvm.loop !7

broadcast.2.loop_exit.dim.1:                      ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %broadcast.2.invar_address.dim.0.03, 1
  %exitcond4 = icmp eq i64 %invar.inc, 32
  br i1 %exitcond4, label %broadcast.2.loop_exit.dim.0, label %vector.ph

broadcast.2.loop_exit.dim.0:                      ; preds = %broadcast.2.loop_exit.dim.1
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }

!0 = !{}
!1 = !{i64 4}
!2 = !{i64 8192}
!3 = !{i64 16}
!4 = !{!5}
!5 = !{!"buffer: {index:0, offset:0, size:8192}", !6}
!6 = !{!"XLA global AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
