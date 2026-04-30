; ModuleID = '__compute_module_broadcast.2_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast.2_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
vector.ph:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %1 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !4
  %broadcast.splatinsert = insertelement <8 x float> poison, float %1, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !7, !align !3
  %2 = getelementptr inbounds nuw i8, ptr %arg1, i64 32
  %3 = getelementptr inbounds nuw i8, ptr %arg1, i64 64
  %4 = getelementptr inbounds nuw i8, ptr %arg1, i64 96
  store <8 x float> %broadcast.splat, ptr %arg1, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %2, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %3, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %4, align 32, !alias.scope !4
  %5 = getelementptr inbounds nuw i8, ptr %arg1, i64 128
  %6 = getelementptr inbounds nuw i8, ptr %arg1, i64 160
  %7 = getelementptr inbounds nuw i8, ptr %arg1, i64 192
  %8 = getelementptr inbounds nuw i8, ptr %arg1, i64 224
  store <8 x float> %broadcast.splat, ptr %5, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %6, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %7, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %8, align 32, !alias.scope !4
  %9 = getelementptr inbounds nuw i8, ptr %arg1, i64 256
  %10 = getelementptr inbounds nuw i8, ptr %arg1, i64 288
  %11 = getelementptr inbounds nuw i8, ptr %arg1, i64 320
  %12 = getelementptr inbounds nuw i8, ptr %arg1, i64 352
  store <8 x float> %broadcast.splat, ptr %9, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %10, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %11, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %12, align 32, !alias.scope !4
  %13 = getelementptr inbounds nuw i8, ptr %arg1, i64 384
  %14 = getelementptr inbounds nuw i8, ptr %arg1, i64 416
  %15 = getelementptr inbounds nuw i8, ptr %arg1, i64 448
  %16 = getelementptr inbounds nuw i8, ptr %arg1, i64 480
  store <8 x float> %broadcast.splat, ptr %13, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %14, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %15, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %16, align 32, !alias.scope !4
  %17 = getelementptr inbounds nuw i8, ptr %arg1, i64 512
  %18 = getelementptr inbounds nuw i8, ptr %arg1, i64 544
  %19 = getelementptr inbounds nuw i8, ptr %arg1, i64 576
  %20 = getelementptr inbounds nuw i8, ptr %arg1, i64 608
  store <8 x float> %broadcast.splat, ptr %17, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %18, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %19, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %20, align 32, !alias.scope !4
  %21 = getelementptr inbounds nuw i8, ptr %arg1, i64 640
  %22 = getelementptr inbounds nuw i8, ptr %arg1, i64 672
  %23 = getelementptr inbounds nuw i8, ptr %arg1, i64 704
  %24 = getelementptr inbounds nuw i8, ptr %arg1, i64 736
  store <8 x float> %broadcast.splat, ptr %21, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %22, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %23, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %24, align 32, !alias.scope !4
  %25 = getelementptr inbounds nuw i8, ptr %arg1, i64 768
  %26 = getelementptr inbounds nuw i8, ptr %arg1, i64 800
  %27 = getelementptr inbounds nuw i8, ptr %arg1, i64 832
  %28 = getelementptr inbounds nuw i8, ptr %arg1, i64 864
  store <8 x float> %broadcast.splat, ptr %25, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %26, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %27, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %28, align 32, !alias.scope !4
  %29 = getelementptr inbounds nuw i8, ptr %arg1, i64 896
  %30 = getelementptr inbounds nuw i8, ptr %arg1, i64 928
  %31 = getelementptr inbounds nuw i8, ptr %arg1, i64 960
  %32 = getelementptr inbounds nuw i8, ptr %arg1, i64 992
  store <8 x float> %broadcast.splat, ptr %29, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %30, align 32, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %31, align 64, !alias.scope !4
  store <8 x float> %broadcast.splat, ptr %32, align 32, !alias.scope !4
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:1024}", !6}
!6 = !{!"XLA host kernel broadcast.2_kernel AA domain"}
!7 = !{i64 1024}
