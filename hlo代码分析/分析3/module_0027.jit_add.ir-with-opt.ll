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
  br label %vector.ph

vector.ph:                                        ; preds = %broadcast_add_fusion.loop_exit.dim.1, %1
  %broadcast_add_fusion.invar_address.dim.0.07 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast_add_fusion.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %2 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !5
  %6 = getelementptr inbounds nuw [1 x [512 x float]], ptr %arg1, i64 0, i64 0, i64 %index
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  %wide.load12 = load <8 x float>, ptr %6, align 64, !invariant.load !1, !noalias !5
  %wide.load13 = load <8 x float>, ptr %7, align 32, !invariant.load !1, !noalias !5
  %wide.load14 = load <8 x float>, ptr %8, align 64, !invariant.load !1, !noalias !5
  %wide.load15 = load <8 x float>, ptr %9, align 32, !invariant.load !1, !noalias !5
  %10 = fadd <8 x float> %wide.load, %wide.load12
  %11 = fadd <8 x float> %wide.load9, %wide.load13
  %12 = fadd <8 x float> %wide.load10, %wide.load14
  %13 = fadd <8 x float> %wide.load11, %wide.load15
  %14 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  store <8 x float> %10, ptr %14, align 64, !alias.scope !5
  store <8 x float> %11, ptr %15, align 32, !alias.scope !5
  store <8 x float> %12, ptr %16, align 64, !alias.scope !5
  store <8 x float> %13, ptr %17, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 32
  %18 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index.next
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 64
  %21 = getelementptr inbounds nuw i8, ptr %18, i64 96
  %wide.load.1 = load <8 x float>, ptr %18, align 64, !invariant.load !1, !noalias !5
  %wide.load9.1 = load <8 x float>, ptr %19, align 32, !invariant.load !1, !noalias !5
  %wide.load10.1 = load <8 x float>, ptr %20, align 64, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %21, align 32, !invariant.load !1, !noalias !5
  %22 = getelementptr inbounds nuw [1 x [512 x float]], ptr %arg1, i64 0, i64 0, i64 %index.next
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  %wide.load12.1 = load <8 x float>, ptr %22, align 64, !invariant.load !1, !noalias !5
  %wide.load13.1 = load <8 x float>, ptr %23, align 32, !invariant.load !1, !noalias !5
  %wide.load14.1 = load <8 x float>, ptr %24, align 64, !invariant.load !1, !noalias !5
  %wide.load15.1 = load <8 x float>, ptr %25, align 32, !invariant.load !1, !noalias !5
  %26 = fadd <8 x float> %wide.load.1, %wide.load12.1
  %27 = fadd <8 x float> %wide.load9.1, %wide.load13.1
  %28 = fadd <8 x float> %wide.load10.1, %wide.load14.1
  %29 = fadd <8 x float> %wide.load11.1, %wide.load15.1
  %30 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index.next
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 64
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 96
  store <8 x float> %26, ptr %30, align 64, !alias.scope !5
  store <8 x float> %27, ptr %31, align 32, !alias.scope !5
  store <8 x float> %28, ptr %32, align 64, !alias.scope !5
  store <8 x float> %29, ptr %33, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 64
  %34 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index.next.1
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  %wide.load.2 = load <8 x float>, ptr %34, align 64, !invariant.load !1, !noalias !5
  %wide.load9.2 = load <8 x float>, ptr %35, align 32, !invariant.load !1, !noalias !5
  %wide.load10.2 = load <8 x float>, ptr %36, align 64, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %37, align 32, !invariant.load !1, !noalias !5
  %38 = getelementptr inbounds nuw [1 x [512 x float]], ptr %arg1, i64 0, i64 0, i64 %index.next.1
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 64
  %41 = getelementptr inbounds nuw i8, ptr %38, i64 96
  %wide.load12.2 = load <8 x float>, ptr %38, align 64, !invariant.load !1, !noalias !5
  %wide.load13.2 = load <8 x float>, ptr %39, align 32, !invariant.load !1, !noalias !5
  %wide.load14.2 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !5
  %wide.load15.2 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !5
  %42 = fadd <8 x float> %wide.load.2, %wide.load12.2
  %43 = fadd <8 x float> %wide.load9.2, %wide.load13.2
  %44 = fadd <8 x float> %wide.load10.2, %wide.load14.2
  %45 = fadd <8 x float> %wide.load11.2, %wide.load15.2
  %46 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index.next.1
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x float> %42, ptr %46, align 64, !alias.scope !5
  store <8 x float> %43, ptr %47, align 32, !alias.scope !5
  store <8 x float> %44, ptr %48, align 64, !alias.scope !5
  store <8 x float> %45, ptr %49, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 96
  %50 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index.next.2
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 64
  %53 = getelementptr inbounds nuw i8, ptr %50, i64 96
  %wide.load.3 = load <8 x float>, ptr %50, align 64, !invariant.load !1, !noalias !5
  %wide.load9.3 = load <8 x float>, ptr %51, align 32, !invariant.load !1, !noalias !5
  %wide.load10.3 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !5
  %54 = getelementptr inbounds nuw [1 x [512 x float]], ptr %arg1, i64 0, i64 0, i64 %index.next.2
  %55 = getelementptr inbounds nuw i8, ptr %54, i64 32
  %56 = getelementptr inbounds nuw i8, ptr %54, i64 64
  %57 = getelementptr inbounds nuw i8, ptr %54, i64 96
  %wide.load12.3 = load <8 x float>, ptr %54, align 64, !invariant.load !1, !noalias !5
  %wide.load13.3 = load <8 x float>, ptr %55, align 32, !invariant.load !1, !noalias !5
  %wide.load14.3 = load <8 x float>, ptr %56, align 64, !invariant.load !1, !noalias !5
  %wide.load15.3 = load <8 x float>, ptr %57, align 32, !invariant.load !1, !noalias !5
  %58 = fadd <8 x float> %wide.load.3, %wide.load12.3
  %59 = fadd <8 x float> %wide.load9.3, %wide.load13.3
  %60 = fadd <8 x float> %wide.load10.3, %wide.load14.3
  %61 = fadd <8 x float> %wide.load11.3, %wide.load15.3
  %62 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 %index.next.2
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 32
  %64 = getelementptr inbounds nuw i8, ptr %62, i64 64
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 96
  store <8 x float> %58, ptr %62, align 64, !alias.scope !5
  store <8 x float> %59, ptr %63, align 32, !alias.scope !5
  store <8 x float> %60, ptr %64, align 64, !alias.scope !5
  store <8 x float> %61, ptr %65, align 32, !alias.scope !5
  %index.next.3 = add nuw nsw i64 %index, 128
  %66 = icmp eq i64 %index.next.3, 512
  br i1 %66, label %broadcast_add_fusion.loop_exit.dim.1, label %vector.body, !llvm.loop !8

broadcast_add_fusion.loop_exit.dim.1:             ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.invar_address.dim.0.07, 1
  %exitcond8 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond8, label %return, label %vector.ph, !llvm.loop !11

return:                                           ; preds = %broadcast_add_fusion.loop_exit.dim.1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 131072}
!3 = !{i64 64}
!4 = !{i64 2048}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:131072}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
