; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable
define void @main.2(ptr nocapture readnone %retval, ptr noalias nocapture readnone %run_options, ptr noalias nocapture readnone %params, ptr noalias nocapture readonly %buffer_table, ptr noalias nocapture readnone %status, ptr noalias nocapture readnone %prof_counters) local_unnamed_addr #0 {
entry:
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %Arg_0.1 = load ptr, ptr %0, align 8, !invariant.load !0, !dereferenceable !1, !align !1
  %copy = load ptr, ptr %buffer_table, align 8, !invariant.load !0, !dereferenceable !1, !align !1
  %1 = load i32, ptr %Arg_0.1, align 4
  store i32 %1, ptr %copy, align 4
  ret void
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }

!0 = !{}
!1 = !{i64 4}
