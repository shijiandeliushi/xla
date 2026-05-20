; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_maximum_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %1
  %broadcast_maximum_fusion.invar_address.dim.0.05 = phi i64 [ 0, %1 ], [ %invar.inc, %vector.ph ]
  %2 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 0
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !4
  %wide.load7 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !4
  %wide.load8 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !4
  %wide.load9 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !4
  %6 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load, <8 x float> zeroinitializer)
  %7 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7, <8 x float> zeroinitializer)
  %8 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8, <8 x float> zeroinitializer)
  %9 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9, <8 x float> zeroinitializer)
  %10 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 0
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x float> %6, ptr %10, align 64, !alias.scope !4
  store <8 x float> %7, ptr %11, align 32, !alias.scope !4
  store <8 x float> %8, ptr %12, align 64, !alias.scope !4
  store <8 x float> %9, ptr %13, align 32, !alias.scope !4
  %14 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 32
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  %wide.load.1 = load <8 x float>, ptr %14, align 64, !invariant.load !1, !noalias !4
  %wide.load7.1 = load <8 x float>, ptr %15, align 32, !invariant.load !1, !noalias !4
  %wide.load8.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !4
  %wide.load9.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !4
  %18 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.1, <8 x float> zeroinitializer)
  %19 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.1, <8 x float> zeroinitializer)
  %20 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.1, <8 x float> zeroinitializer)
  %21 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.1, <8 x float> zeroinitializer)
  %22 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 32
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x float> %18, ptr %22, align 64, !alias.scope !4
  store <8 x float> %19, ptr %23, align 32, !alias.scope !4
  store <8 x float> %20, ptr %24, align 64, !alias.scope !4
  store <8 x float> %21, ptr %25, align 32, !alias.scope !4
  %26 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 64
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  %wide.load.2 = load <8 x float>, ptr %26, align 64, !invariant.load !1, !noalias !4
  %wide.load7.2 = load <8 x float>, ptr %27, align 32, !invariant.load !1, !noalias !4
  %wide.load8.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !4
  %wide.load9.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !4
  %30 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.2, <8 x float> zeroinitializer)
  %31 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.2, <8 x float> zeroinitializer)
  %32 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.2, <8 x float> zeroinitializer)
  %33 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.2, <8 x float> zeroinitializer)
  %34 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 64
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  store <8 x float> %30, ptr %34, align 64, !alias.scope !4
  store <8 x float> %31, ptr %35, align 32, !alias.scope !4
  store <8 x float> %32, ptr %36, align 64, !alias.scope !4
  store <8 x float> %33, ptr %37, align 32, !alias.scope !4
  %38 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 96
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 64
  %41 = getelementptr inbounds nuw i8, ptr %38, i64 96
  %wide.load.3 = load <8 x float>, ptr %38, align 64, !invariant.load !1, !noalias !4
  %wide.load7.3 = load <8 x float>, ptr %39, align 32, !invariant.load !1, !noalias !4
  %wide.load8.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !4
  %wide.load9.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !4
  %42 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.3, <8 x float> zeroinitializer)
  %43 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.3, <8 x float> zeroinitializer)
  %44 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.3, <8 x float> zeroinitializer)
  %45 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.3, <8 x float> zeroinitializer)
  %46 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 96
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x float> %42, ptr %46, align 64, !alias.scope !4
  store <8 x float> %43, ptr %47, align 32, !alias.scope !4
  store <8 x float> %44, ptr %48, align 64, !alias.scope !4
  store <8 x float> %45, ptr %49, align 32, !alias.scope !4
  %50 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 128
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 64
  %53 = getelementptr inbounds nuw i8, ptr %50, i64 96
  %wide.load.4 = load <8 x float>, ptr %50, align 64, !invariant.load !1, !noalias !4
  %wide.load7.4 = load <8 x float>, ptr %51, align 32, !invariant.load !1, !noalias !4
  %wide.load8.4 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !4
  %wide.load9.4 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !4
  %54 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.4, <8 x float> zeroinitializer)
  %55 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.4, <8 x float> zeroinitializer)
  %56 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.4, <8 x float> zeroinitializer)
  %57 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.4, <8 x float> zeroinitializer)
  %58 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 128
  %59 = getelementptr inbounds nuw i8, ptr %58, i64 32
  %60 = getelementptr inbounds nuw i8, ptr %58, i64 64
  %61 = getelementptr inbounds nuw i8, ptr %58, i64 96
  store <8 x float> %54, ptr %58, align 64, !alias.scope !4
  store <8 x float> %55, ptr %59, align 32, !alias.scope !4
  store <8 x float> %56, ptr %60, align 64, !alias.scope !4
  store <8 x float> %57, ptr %61, align 32, !alias.scope !4
  %62 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 160
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 32
  %64 = getelementptr inbounds nuw i8, ptr %62, i64 64
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 96
  %wide.load.5 = load <8 x float>, ptr %62, align 64, !invariant.load !1, !noalias !4
  %wide.load7.5 = load <8 x float>, ptr %63, align 32, !invariant.load !1, !noalias !4
  %wide.load8.5 = load <8 x float>, ptr %64, align 64, !invariant.load !1, !noalias !4
  %wide.load9.5 = load <8 x float>, ptr %65, align 32, !invariant.load !1, !noalias !4
  %66 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.5, <8 x float> zeroinitializer)
  %67 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.5, <8 x float> zeroinitializer)
  %68 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.5, <8 x float> zeroinitializer)
  %69 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.5, <8 x float> zeroinitializer)
  %70 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 160
  %71 = getelementptr inbounds nuw i8, ptr %70, i64 32
  %72 = getelementptr inbounds nuw i8, ptr %70, i64 64
  %73 = getelementptr inbounds nuw i8, ptr %70, i64 96
  store <8 x float> %66, ptr %70, align 64, !alias.scope !4
  store <8 x float> %67, ptr %71, align 32, !alias.scope !4
  store <8 x float> %68, ptr %72, align 64, !alias.scope !4
  store <8 x float> %69, ptr %73, align 32, !alias.scope !4
  %74 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 192
  %75 = getelementptr inbounds nuw i8, ptr %74, i64 32
  %76 = getelementptr inbounds nuw i8, ptr %74, i64 64
  %77 = getelementptr inbounds nuw i8, ptr %74, i64 96
  %wide.load.6 = load <8 x float>, ptr %74, align 64, !invariant.load !1, !noalias !4
  %wide.load7.6 = load <8 x float>, ptr %75, align 32, !invariant.load !1, !noalias !4
  %wide.load8.6 = load <8 x float>, ptr %76, align 64, !invariant.load !1, !noalias !4
  %wide.load9.6 = load <8 x float>, ptr %77, align 32, !invariant.load !1, !noalias !4
  %78 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.6, <8 x float> zeroinitializer)
  %79 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.6, <8 x float> zeroinitializer)
  %80 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.6, <8 x float> zeroinitializer)
  %81 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.6, <8 x float> zeroinitializer)
  %82 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 192
  %83 = getelementptr inbounds nuw i8, ptr %82, i64 32
  %84 = getelementptr inbounds nuw i8, ptr %82, i64 64
  %85 = getelementptr inbounds nuw i8, ptr %82, i64 96
  store <8 x float> %78, ptr %82, align 64, !alias.scope !4
  store <8 x float> %79, ptr %83, align 32, !alias.scope !4
  store <8 x float> %80, ptr %84, align 64, !alias.scope !4
  store <8 x float> %81, ptr %85, align 32, !alias.scope !4
  %86 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 224
  %87 = getelementptr inbounds nuw i8, ptr %86, i64 32
  %88 = getelementptr inbounds nuw i8, ptr %86, i64 64
  %89 = getelementptr inbounds nuw i8, ptr %86, i64 96
  %wide.load.7 = load <8 x float>, ptr %86, align 64, !invariant.load !1, !noalias !4
  %wide.load7.7 = load <8 x float>, ptr %87, align 32, !invariant.load !1, !noalias !4
  %wide.load8.7 = load <8 x float>, ptr %88, align 64, !invariant.load !1, !noalias !4
  %wide.load9.7 = load <8 x float>, ptr %89, align 32, !invariant.load !1, !noalias !4
  %90 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load.7, <8 x float> zeroinitializer)
  %91 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load7.7, <8 x float> zeroinitializer)
  %92 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load8.7, <8 x float> zeroinitializer)
  %93 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %wide.load9.7, <8 x float> zeroinitializer)
  %94 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 224
  %95 = getelementptr inbounds nuw i8, ptr %94, i64 32
  %96 = getelementptr inbounds nuw i8, ptr %94, i64 64
  %97 = getelementptr inbounds nuw i8, ptr %94, i64 96
  store <8 x float> %90, ptr %94, align 64, !alias.scope !4
  store <8 x float> %91, ptr %95, align 32, !alias.scope !4
  store <8 x float> %92, ptr %96, align 64, !alias.scope !4
  store <8 x float> %93, ptr %97, align 32, !alias.scope !4
  %invar.inc = add nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.0.05, 1
  %exitcond6 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond6, label %return, label %vector.ph, !llvm.loop !7

return:                                           ; preds = %vector.ph
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximum.v8f32(<8 x float>, <8 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 65536}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:65536}", !6}
!6 = !{!"XLA host kernel broadcast_maximum_fusion AA domain"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
