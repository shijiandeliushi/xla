; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %2 = getelementptr inbounds nuw i8, ptr %arg1, i64 32
  %3 = getelementptr inbounds nuw i8, ptr %arg1, i64 64
  %4 = getelementptr inbounds nuw i8, ptr %arg1, i64 96
  %wide.load12 = load <8 x float>, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %wide.load13 = load <8 x float>, ptr %2, align 32, !invariant.load !1, !noalias !5
  %wide.load14 = load <8 x float>, ptr %3, align 64, !invariant.load !1, !noalias !5
  %wide.load15 = load <8 x float>, ptr %4, align 32, !invariant.load !1, !noalias !5
  %5 = getelementptr inbounds nuw i8, ptr %arg1, i64 128
  %6 = getelementptr inbounds nuw i8, ptr %arg1, i64 160
  %7 = getelementptr inbounds nuw i8, ptr %arg1, i64 192
  %8 = getelementptr inbounds nuw i8, ptr %arg1, i64 224
  %wide.load12.1 = load <8 x float>, ptr %5, align 64, !invariant.load !1, !noalias !5
  %wide.load13.1 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %wide.load14.1 = load <8 x float>, ptr %7, align 64, !invariant.load !1, !noalias !5
  %wide.load15.1 = load <8 x float>, ptr %8, align 32, !invariant.load !1, !noalias !5
  %9 = getelementptr inbounds nuw i8, ptr %arg1, i64 256
  %10 = getelementptr inbounds nuw i8, ptr %arg1, i64 288
  %11 = getelementptr inbounds nuw i8, ptr %arg1, i64 320
  %12 = getelementptr inbounds nuw i8, ptr %arg1, i64 352
  %wide.load12.2 = load <8 x float>, ptr %9, align 64, !invariant.load !1, !noalias !5
  %wide.load13.2 = load <8 x float>, ptr %10, align 32, !invariant.load !1, !noalias !5
  %wide.load14.2 = load <8 x float>, ptr %11, align 64, !invariant.load !1, !noalias !5
  %wide.load15.2 = load <8 x float>, ptr %12, align 32, !invariant.load !1, !noalias !5
  %13 = getelementptr inbounds nuw i8, ptr %arg1, i64 384
  %14 = getelementptr inbounds nuw i8, ptr %arg1, i64 416
  %15 = getelementptr inbounds nuw i8, ptr %arg1, i64 448
  %16 = getelementptr inbounds nuw i8, ptr %arg1, i64 480
  %wide.load12.3 = load <8 x float>, ptr %13, align 64, !invariant.load !1, !noalias !5
  %wide.load13.3 = load <8 x float>, ptr %14, align 32, !invariant.load !1, !noalias !5
  %wide.load14.3 = load <8 x float>, ptr %15, align 64, !invariant.load !1, !noalias !5
  %wide.load15.3 = load <8 x float>, ptr %16, align 32, !invariant.load !1, !noalias !5
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %1
  %broadcast_add_fusion.invar_address.dim.0.07 = phi i64 [ 0, %1 ], [ %invar.inc, %vector.ph ]
  %17 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 0
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 32
  %19 = getelementptr inbounds nuw i8, ptr %17, i64 64
  %20 = getelementptr inbounds nuw i8, ptr %17, i64 96
  %wide.load = load <8 x float>, ptr %17, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %18, align 32, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %19, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %20, align 32, !invariant.load !1, !noalias !5
  %21 = fadd <8 x float> %wide.load, %wide.load12
  %22 = fadd <8 x float> %wide.load9, %wide.load13
  %23 = fadd <8 x float> %wide.load10, %wide.load14
  %24 = fadd <8 x float> %wide.load11, %wide.load15
  %25 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 0
  %26 = getelementptr inbounds nuw i8, ptr %25, i64 32
  %27 = getelementptr inbounds nuw i8, ptr %25, i64 64
  %28 = getelementptr inbounds nuw i8, ptr %25, i64 96
  store <8 x float> %21, ptr %25, align 64, !alias.scope !5
  store <8 x float> %22, ptr %26, align 32, !alias.scope !5
  store <8 x float> %23, ptr %27, align 64, !alias.scope !5
  store <8 x float> %24, ptr %28, align 32, !alias.scope !5
  %29 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 32
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 32
  %31 = getelementptr inbounds nuw i8, ptr %29, i64 64
  %32 = getelementptr inbounds nuw i8, ptr %29, i64 96
  %wide.load.1 = load <8 x float>, ptr %29, align 64, !invariant.load !1, !noalias !5
  %wide.load9.1 = load <8 x float>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %wide.load10.1 = load <8 x float>, ptr %31, align 64, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %32, align 32, !invariant.load !1, !noalias !5
  %33 = fadd <8 x float> %wide.load.1, %wide.load12.1
  %34 = fadd <8 x float> %wide.load9.1, %wide.load13.1
  %35 = fadd <8 x float> %wide.load10.1, %wide.load14.1
  %36 = fadd <8 x float> %wide.load11.1, %wide.load15.1
  %37 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 32
  %38 = getelementptr inbounds nuw i8, ptr %37, i64 32
  %39 = getelementptr inbounds nuw i8, ptr %37, i64 64
  %40 = getelementptr inbounds nuw i8, ptr %37, i64 96
  store <8 x float> %33, ptr %37, align 64, !alias.scope !5
  store <8 x float> %34, ptr %38, align 32, !alias.scope !5
  store <8 x float> %35, ptr %39, align 64, !alias.scope !5
  store <8 x float> %36, ptr %40, align 32, !alias.scope !5
  %41 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %41, i64 32
  %43 = getelementptr inbounds nuw i8, ptr %41, i64 64
  %44 = getelementptr inbounds nuw i8, ptr %41, i64 96
  %wide.load.2 = load <8 x float>, ptr %41, align 64, !invariant.load !1, !noalias !5
  %wide.load9.2 = load <8 x float>, ptr %42, align 32, !invariant.load !1, !noalias !5
  %wide.load10.2 = load <8 x float>, ptr %43, align 64, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %44, align 32, !invariant.load !1, !noalias !5
  %45 = fadd <8 x float> %wide.load.2, %wide.load12.2
  %46 = fadd <8 x float> %wide.load9.2, %wide.load13.2
  %47 = fadd <8 x float> %wide.load10.2, %wide.load14.2
  %48 = fadd <8 x float> %wide.load11.2, %wide.load15.2
  %49 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 32
  %51 = getelementptr inbounds nuw i8, ptr %49, i64 64
  %52 = getelementptr inbounds nuw i8, ptr %49, i64 96
  store <8 x float> %45, ptr %49, align 64, !alias.scope !5
  store <8 x float> %46, ptr %50, align 32, !alias.scope !5
  store <8 x float> %47, ptr %51, align 64, !alias.scope !5
  store <8 x float> %48, ptr %52, align 32, !alias.scope !5
  %53 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 96
  %54 = getelementptr inbounds nuw i8, ptr %53, i64 32
  %55 = getelementptr inbounds nuw i8, ptr %53, i64 64
  %56 = getelementptr inbounds nuw i8, ptr %53, i64 96
  %wide.load.3 = load <8 x float>, ptr %53, align 64, !invariant.load !1, !noalias !5
  %wide.load9.3 = load <8 x float>, ptr %54, align 32, !invariant.load !1, !noalias !5
  %wide.load10.3 = load <8 x float>, ptr %55, align 64, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %56, align 32, !invariant.load !1, !noalias !5
  %57 = fadd <8 x float> %wide.load.3, %wide.load12.3
  %58 = fadd <8 x float> %wide.load9.3, %wide.load13.3
  %59 = fadd <8 x float> %wide.load10.3, %wide.load14.3
  %60 = fadd <8 x float> %wide.load11.3, %wide.load15.3
  %61 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 96
  %62 = getelementptr inbounds nuw i8, ptr %61, i64 32
  %63 = getelementptr inbounds nuw i8, ptr %61, i64 64
  %64 = getelementptr inbounds nuw i8, ptr %61, i64 96
  store <8 x float> %57, ptr %61, align 64, !alias.scope !5
  store <8 x float> %58, ptr %62, align 32, !alias.scope !5
  store <8 x float> %59, ptr %63, align 64, !alias.scope !5
  store <8 x float> %60, ptr %64, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.invar_address.dim.0.07, 1
  %exitcond8 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond8, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 32768}
!3 = !{i64 64}
!4 = !{i64 512}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:32768}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
