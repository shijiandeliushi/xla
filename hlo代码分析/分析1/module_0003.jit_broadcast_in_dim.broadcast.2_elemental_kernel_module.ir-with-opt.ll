; ModuleID = '__compute_module_broadcast.2_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast.2_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  br label %broadcast.2.loop_header.dim.1.preheader

broadcast.2.loop_header.dim.1.preheader:          ; preds = %1, %broadcast.2.loop_header.dim.1.preheader
  %broadcast.2.invar_address.dim.0.05 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast.2.loop_header.dim.1.preheader ]
  %3 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 0
  store float %2, ptr %3, align 64, !alias.scope !5
  %4 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 1
  store float %2, ptr %4, align 4, !alias.scope !5
  %5 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 2
  store float %2, ptr %5, align 8, !alias.scope !5
  %6 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 3
  store float %2, ptr %6, align 4, !alias.scope !5
  %7 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 4
  store float %2, ptr %7, align 16, !alias.scope !5
  %8 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 5
  store float %2, ptr %8, align 4, !alias.scope !5
  %9 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 6
  store float %2, ptr %9, align 8, !alias.scope !5
  %10 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 7
  store float %2, ptr %10, align 4, !alias.scope !5
  %11 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 8
  store float %2, ptr %11, align 32, !alias.scope !5
  %12 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 9
  store float %2, ptr %12, align 4, !alias.scope !5
  %13 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 10
  store float %2, ptr %13, align 8, !alias.scope !5
  %14 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 11
  store float %2, ptr %14, align 4, !alias.scope !5
  %15 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 12
  store float %2, ptr %15, align 16, !alias.scope !5
  %16 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 13
  store float %2, ptr %16, align 4, !alias.scope !5
  %17 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 14
  store float %2, ptr %17, align 8, !alias.scope !5
  %18 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 15
  store float %2, ptr %18, align 4, !alias.scope !5
  %19 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 16
  store float %2, ptr %19, align 64, !alias.scope !5
  %20 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 17
  store float %2, ptr %20, align 4, !alias.scope !5
  %21 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 18
  store float %2, ptr %21, align 8, !alias.scope !5
  %22 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 19
  store float %2, ptr %22, align 4, !alias.scope !5
  %23 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 20
  store float %2, ptr %23, align 16, !alias.scope !5
  %24 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 21
  store float %2, ptr %24, align 4, !alias.scope !5
  %25 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 22
  store float %2, ptr %25, align 8, !alias.scope !5
  %26 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 23
  store float %2, ptr %26, align 4, !alias.scope !5
  %27 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 24
  store float %2, ptr %27, align 32, !alias.scope !5
  %28 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 25
  store float %2, ptr %28, align 4, !alias.scope !5
  %29 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 26
  store float %2, ptr %29, align 8, !alias.scope !5
  %30 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 27
  store float %2, ptr %30, align 4, !alias.scope !5
  %31 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 28
  store float %2, ptr %31, align 16, !alias.scope !5
  %32 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 29
  store float %2, ptr %32, align 4, !alias.scope !5
  %33 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 30
  store float %2, ptr %33, align 8, !alias.scope !5
  %34 = getelementptr inbounds nuw [10 x [32 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 31
  store float %2, ptr %34, align 4, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast.2.invar_address.dim.0.05, 1
  %exitcond = icmp eq i64 %invar.inc, 10
  br i1 %exitcond, label %return, label %broadcast.2.loop_header.dim.1.preheader, !llvm.loop !8

return:                                           ; preds = %broadcast.2.loop_header.dim.1.preheader
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 1280}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:1280}", !7}
!7 = !{!"XLA host kernel broadcast.2_kernel AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
