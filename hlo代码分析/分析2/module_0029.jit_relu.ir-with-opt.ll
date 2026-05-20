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

vector.ph:                                        ; preds = %broadcast_maximum_fusion.loop_exit.dim.1, %1
  %broadcast_maximum_fusion.invar_address.dim.0.05 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast_maximum_fusion.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %2 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index
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
  %10 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x float> %6, ptr %10, align 64, !alias.scope !4
  store <8 x float> %7, ptr %11, align 32, !alias.scope !4
  store <8 x float> %8, ptr %12, align 64, !alias.scope !4
  store <8 x float> %9, ptr %13, align 32, !alias.scope !4
  %index.next = or disjoint i64 %index, 32
  %14 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index.next
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
  %22 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index.next
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x float> %18, ptr %22, align 64, !alias.scope !4
  store <8 x float> %19, ptr %23, align 32, !alias.scope !4
  store <8 x float> %20, ptr %24, align 64, !alias.scope !4
  store <8 x float> %21, ptr %25, align 32, !alias.scope !4
  %index.next.1 = or disjoint i64 %index, 64
  %26 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index.next.1
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
  %34 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index.next.1
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  store <8 x float> %30, ptr %34, align 64, !alias.scope !4
  store <8 x float> %31, ptr %35, align 32, !alias.scope !4
  store <8 x float> %32, ptr %36, align 64, !alias.scope !4
  store <8 x float> %33, ptr %37, align 32, !alias.scope !4
  %index.next.2 = or disjoint i64 %index, 96
  %38 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index.next.2
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
  %46 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.05, i64 %index.next.2
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x float> %42, ptr %46, align 64, !alias.scope !4
  store <8 x float> %43, ptr %47, align 32, !alias.scope !4
  store <8 x float> %44, ptr %48, align 64, !alias.scope !4
  store <8 x float> %45, ptr %49, align 32, !alias.scope !4
  %index.next.3 = add nuw nsw i64 %index, 128
  %50 = icmp eq i64 %index.next.3, 512
  br i1 %50, label %broadcast_maximum_fusion.loop_exit.dim.1, label %vector.body, !llvm.loop !7

broadcast_maximum_fusion.loop_exit.dim.1:         ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.0.05, 1
  %exitcond6 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond6, label %return, label %vector.ph, !llvm.loop !10

return:                                           ; preds = %broadcast_maximum_fusion.loop_exit.dim.1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximum.v8f32(<8 x float>, <8 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 131072}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:131072}", !6}
!6 = !{!"XLA host kernel broadcast_maximum_fusion AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
