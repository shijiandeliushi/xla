; ModuleID = '__compute_module_part_01'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @slice_add_fusion.1(ptr readonly captures(none) %0) local_unnamed_addr #0 {
slice_add_fusion.1.loop_body.dim.0.critedge:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %1 = load i32, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  store i32 %1, ptr %arg2, align 64, !alias.scope !5
  ret ptr null
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 1}
!1 = !{}
!2 = !{i64 8}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:8, offset:704, size:4}", !7}
!7 = !{!"XLA host kernel slice_add_fusion.1 AA domain"}
