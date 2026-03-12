; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind memory(readwrite, inaccessiblemem: none) uwtable
define void @main.13(ptr nocapture readnone %retval, ptr noalias %run_options, ptr noalias nocapture readnone %params, ptr noalias nocapture readonly %buffer_table, ptr noalias nocapture readnone %status, ptr noalias nocapture readnone %prof_counters) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 2
  %Arg_0.1 = load ptr, ptr %0, align 8, !invariant.load !0, !dereferenceable !1, !align !2
  %Arg_1.2 = load ptr, ptr %buffer_table, align 8, !invariant.load !0, !dereferenceable !3, !align !2
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %dot.6 = load ptr, ptr %1, align 8, !invariant.load !0, !dereferenceable !4, !align !2
  tail call void @__xla_cpu_runtime_EigenMatMulF32(ptr %run_options, ptr nonnull %dot.6, ptr nonnull %Arg_1.2, ptr nonnull %Arg_0.1, i64 64, i64 10, i64 32, i32 0, i32 0)
  %2 = getelementptr inbounds ptr, ptr %buffer_table, i64 3
  %Arg_2.3 = load ptr, ptr %2, align 8, !invariant.load !0, !dereferenceable !5, !align !2
  br label %vector.ph

vector.ph:                                        ; preds = %fusion.loop_exit.dim.1, %entry
  %fusion.invar_address.dim.0.03 = phi i64 [ 0, %entry ], [ %invar.inc, %fusion.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %3 = getelementptr inbounds [10 x [64 x float]], ptr %dot.6, i64 0, i64 %fusion.invar_address.dim.0.03, i64 %index
  %wide.load = load <8 x float>, ptr %3, align 16, !alias.scope !6
  %4 = getelementptr inbounds [64 x float], ptr %Arg_2.3, i64 0, i64 %index
  %wide.load5 = load <8 x float>, ptr %4, align 16, !invariant.load !0, !noalias !6
  %5 = fadd <8 x float> %wide.load, %wide.load5
  %6 = fcmp olt <8 x float> %5, zeroinitializer
  %7 = select <8 x i1> %6, <8 x float> zeroinitializer, <8 x float> %5
  store <8 x float> %7, ptr %3, align 16, !alias.scope !6
  %index.next = add nuw i64 %index, 8
  %8 = icmp eq i64 %index.next, 64
  br i1 %8, label %fusion.loop_exit.dim.1, label %vector.body, !llvm.loop !9

fusion.loop_exit.dim.1:                           ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %fusion.invar_address.dim.0.03, 1
  %exitcond4 = icmp eq i64 %invar.inc, 10
  br i1 %exitcond4, label %fusion.loop_exit.dim.0, label %vector.ph

fusion.loop_exit.dim.0:                           ; preds = %fusion.loop_exit.dim.1
  ret void
}

; Function Attrs: nounwind memory(argmem: readwrite)
declare void @__xla_cpu_runtime_EigenMatMulF32(ptr, ptr, ptr, ptr, i64, i64, i64, i32, i32) local_unnamed_addr #1

attributes #0 = { nounwind memory(readwrite, inaccessiblemem: none) uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }
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
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.isvectorized", i32 1}
!11 = !{!"llvm.loop.unroll.runtime.disable"}
