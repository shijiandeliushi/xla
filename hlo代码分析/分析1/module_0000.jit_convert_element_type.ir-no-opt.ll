; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: uwtable
define void @main.2(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #0 {
entry:
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  %Arg_0.1 = load ptr, ptr %0, align 8, !invariant.load !0, !dereferenceable !1, !align !1
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 0
  %copy = load ptr, ptr %1, align 8, !invariant.load !0, !dereferenceable !1, !align !1
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy, ptr align 1 %Arg_0.1, i64 4, i1 false)
  br label %return

return:                                           ; preds = %entry
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }
attributes #1 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!0 = !{}
!1 = !{i64 4}
