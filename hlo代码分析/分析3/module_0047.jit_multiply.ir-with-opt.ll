; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_multiply_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %2 = load float, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %1
  %broadcast_multiply_fusion.invar_address.dim.0.07 = phi i64 [ 0, %1 ], [ %invar.inc, %vector.ph ]
  %3 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 0
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 96
  %wide.load = load <8 x float>, ptr %3, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %4, align 32, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %5, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %7 = fmul <8 x float> %wide.load, %broadcast.splat
  %8 = fmul <8 x float> %wide.load9, %broadcast.splat
  %9 = fmul <8 x float> %wide.load10, %broadcast.splat
  %10 = fmul <8 x float> %wide.load11, %broadcast.splat
  %11 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 0
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 96
  store <8 x float> %7, ptr %11, align 64, !alias.scope !5
  store <8 x float> %8, ptr %12, align 32, !alias.scope !5
  store <8 x float> %9, ptr %13, align 64, !alias.scope !5
  store <8 x float> %10, ptr %14, align 32, !alias.scope !5
  %15 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 96
  %wide.load.1 = load <8 x float>, ptr %15, align 64, !invariant.load !1, !noalias !5
  %wide.load9.1 = load <8 x float>, ptr %16, align 32, !invariant.load !1, !noalias !5
  %wide.load10.1 = load <8 x float>, ptr %17, align 64, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %18, align 32, !invariant.load !1, !noalias !5
  %19 = fmul <8 x float> %wide.load.1, %broadcast.splat
  %20 = fmul <8 x float> %wide.load9.1, %broadcast.splat
  %21 = fmul <8 x float> %wide.load10.1, %broadcast.splat
  %22 = fmul <8 x float> %wide.load11.1, %broadcast.splat
  %23 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %26 = getelementptr inbounds nuw i8, ptr %23, i64 96
  store <8 x float> %19, ptr %23, align 64, !alias.scope !5
  store <8 x float> %20, ptr %24, align 32, !alias.scope !5
  store <8 x float> %21, ptr %25, align 64, !alias.scope !5
  store <8 x float> %22, ptr %26, align 32, !alias.scope !5
  %27 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 64
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 64
  %30 = getelementptr inbounds nuw i8, ptr %27, i64 96
  %wide.load.2 = load <8 x float>, ptr %27, align 64, !invariant.load !1, !noalias !5
  %wide.load9.2 = load <8 x float>, ptr %28, align 32, !invariant.load !1, !noalias !5
  %wide.load10.2 = load <8 x float>, ptr %29, align 64, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %31 = fmul <8 x float> %wide.load.2, %broadcast.splat
  %32 = fmul <8 x float> %wide.load9.2, %broadcast.splat
  %33 = fmul <8 x float> %wide.load10.2, %broadcast.splat
  %34 = fmul <8 x float> %wide.load11.2, %broadcast.splat
  %35 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 32
  %37 = getelementptr inbounds nuw i8, ptr %35, i64 64
  %38 = getelementptr inbounds nuw i8, ptr %35, i64 96
  store <8 x float> %31, ptr %35, align 64, !alias.scope !5
  store <8 x float> %32, ptr %36, align 32, !alias.scope !5
  store <8 x float> %33, ptr %37, align 64, !alias.scope !5
  store <8 x float> %34, ptr %38, align 32, !alias.scope !5
  %39 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 96
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %39, i64 96
  %wide.load.3 = load <8 x float>, ptr %39, align 64, !invariant.load !1, !noalias !5
  %wide.load9.3 = load <8 x float>, ptr %40, align 32, !invariant.load !1, !noalias !5
  %wide.load10.3 = load <8 x float>, ptr %41, align 64, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %42, align 32, !invariant.load !1, !noalias !5
  %43 = fmul <8 x float> %wide.load.3, %broadcast.splat
  %44 = fmul <8 x float> %wide.load9.3, %broadcast.splat
  %45 = fmul <8 x float> %wide.load10.3, %broadcast.splat
  %46 = fmul <8 x float> %wide.load11.3, %broadcast.splat
  %47 = getelementptr inbounds nuw [256 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.invar_address.dim.0.07, i64 96
  %48 = getelementptr inbounds nuw i8, ptr %47, i64 32
  %49 = getelementptr inbounds nuw i8, ptr %47, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %47, i64 96
  store <8 x float> %43, ptr %47, align 64, !alias.scope !5
  store <8 x float> %44, ptr %48, align 32, !alias.scope !5
  store <8 x float> %45, ptr %49, align 64, !alias.scope !5
  store <8 x float> %46, ptr %50, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_multiply_fusion.invar_address.dim.0.07, 1
  %exitcond8 = icmp eq i64 %invar.inc, 256
  br i1 %exitcond8, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 131072}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:131072}", !7}
!7 = !{!"XLA host kernel broadcast_multiply_fusion AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
