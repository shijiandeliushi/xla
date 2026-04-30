; ModuleID = '__compute_module_broadcast.2_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast.2_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
vector.ph:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %1 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %1, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.7, %vector.body ]
  %2 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  store <8 x float> %broadcast.splat, ptr %2, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %3, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %4, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %5, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 32
  %6 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  store <8 x float> %broadcast.splat, ptr %6, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %7, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %8, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %9, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 64
  %10 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next.1
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x float> %broadcast.splat, ptr %10, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %11, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %12, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %13, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 96
  %14 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next.2
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  store <8 x float> %broadcast.splat, ptr %14, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %15, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %16, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %17, align 32, !alias.scope !5
  %index.next.3 = or disjoint i64 %index, 128
  %18 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next.3
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 64
  %21 = getelementptr inbounds nuw i8, ptr %18, i64 96
  store <8 x float> %broadcast.splat, ptr %18, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %19, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %20, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %21, align 32, !alias.scope !5
  %index.next.4 = or disjoint i64 %index, 160
  %22 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next.4
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x float> %broadcast.splat, ptr %22, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %23, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %24, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %25, align 32, !alias.scope !5
  %index.next.5 = or disjoint i64 %index, 192
  %26 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next.5
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  store <8 x float> %broadcast.splat, ptr %26, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %27, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %28, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %29, align 32, !alias.scope !5
  %index.next.6 = or disjoint i64 %index, 224
  %30 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index.next.6
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 64
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 96
  store <8 x float> %broadcast.splat, ptr %30, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %31, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %32, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %33, align 32, !alias.scope !5
  %index.next.7 = add nuw nsw i64 %index, 256
  %34 = icmp eq i64 %index.next.7, 2048
  br i1 %34, label %return, label %vector.body, !llvm.loop !8

return:                                           ; preds = %vector.body
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 8192}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:8192}", !7}
!7 = !{!"XLA host kernel broadcast.2_kernel AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
