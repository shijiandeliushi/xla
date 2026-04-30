; ModuleID = '__compute_module_part_01'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion.2(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = getelementptr inbounds nuw i8, ptr %arg0, i64 4
  %3 = load i32, ptr %2, align 4, !invariant.load !1, !noalias !5
  %broadcast.splatinsert4 = insertelement <8 x i32> poison, i32 %3, i64 0
  %broadcast.splat5 = shufflevector <8 x i32> %broadcast.splatinsert4, <8 x i32> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %1
  %broadcast_add_fusion.2.invar_address.dim.0.02 = phi i64 [ 0, %1 ], [ %invar.inc, %vector.ph ]
  %4 = shl nuw nsw i64 %broadcast_add_fusion.2.invar_address.dim.0.02, 7
  %broadcast.splatinsert = insertelement <8 x i64> poison, i64 %4, i64 0
  %broadcast.splat = shufflevector <8 x i64> %broadcast.splatinsert, <8 x i64> poison, <8 x i32> zeroinitializer
  %5 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %6 = or disjoint <8 x i32> %5, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %7 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %8 = or disjoint <8 x i32> %7, <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %9 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %10 = or disjoint <8 x i32> %9, <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %11 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %12 = or disjoint <8 x i32> %11, <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %13 = add <8 x i32> %broadcast.splat5, %6
  %14 = add <8 x i32> %broadcast.splat5, %8
  %15 = add <8 x i32> %broadcast.splat5, %10
  %16 = add <8 x i32> %broadcast.splat5, %12
  %17 = getelementptr inbounds nuw [256 x [128 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.invar_address.dim.0.02, i64 0
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 32
  %19 = getelementptr inbounds nuw i8, ptr %17, i64 64
  %20 = getelementptr inbounds nuw i8, ptr %17, i64 96
  store <8 x i32> %13, ptr %17, align 64, !alias.scope !5
  store <8 x i32> %14, ptr %18, align 32, !alias.scope !5
  store <8 x i32> %15, ptr %19, align 64, !alias.scope !5
  store <8 x i32> %16, ptr %20, align 32, !alias.scope !5
  %21 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %22 = or disjoint <8 x i32> %21, <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39>
  %23 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %24 = or disjoint <8 x i32> %23, <i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %25 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %26 = or disjoint <8 x i32> %25, <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55>
  %27 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %28 = or disjoint <8 x i32> %27, <i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %29 = add <8 x i32> %broadcast.splat5, %22
  %30 = add <8 x i32> %broadcast.splat5, %24
  %31 = add <8 x i32> %broadcast.splat5, %26
  %32 = add <8 x i32> %broadcast.splat5, %28
  %33 = getelementptr inbounds nuw [256 x [128 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.invar_address.dim.0.02, i64 32
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %33, i64 96
  store <8 x i32> %29, ptr %33, align 64, !alias.scope !5
  store <8 x i32> %30, ptr %34, align 32, !alias.scope !5
  store <8 x i32> %31, ptr %35, align 64, !alias.scope !5
  store <8 x i32> %32, ptr %36, align 32, !alias.scope !5
  %37 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %38 = or disjoint <8 x i32> %37, <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71>
  %39 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %40 = or disjoint <8 x i32> %39, <i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79>
  %41 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %42 = or disjoint <8 x i32> %41, <i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87>
  %43 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %44 = or disjoint <8 x i32> %43, <i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95>
  %45 = add <8 x i32> %broadcast.splat5, %38
  %46 = add <8 x i32> %broadcast.splat5, %40
  %47 = add <8 x i32> %broadcast.splat5, %42
  %48 = add <8 x i32> %broadcast.splat5, %44
  %49 = getelementptr inbounds nuw [256 x [128 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.invar_address.dim.0.02, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 32
  %51 = getelementptr inbounds nuw i8, ptr %49, i64 64
  %52 = getelementptr inbounds nuw i8, ptr %49, i64 96
  store <8 x i32> %45, ptr %49, align 64, !alias.scope !5
  store <8 x i32> %46, ptr %50, align 32, !alias.scope !5
  store <8 x i32> %47, ptr %51, align 64, !alias.scope !5
  store <8 x i32> %48, ptr %52, align 32, !alias.scope !5
  %53 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %54 = or disjoint <8 x i32> %53, <i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103>
  %55 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %56 = or disjoint <8 x i32> %55, <i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111>
  %57 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %58 = or disjoint <8 x i32> %57, <i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119>
  %59 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %60 = or disjoint <8 x i32> %59, <i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %61 = add <8 x i32> %broadcast.splat5, %54
  %62 = add <8 x i32> %broadcast.splat5, %56
  %63 = add <8 x i32> %broadcast.splat5, %58
  %64 = add <8 x i32> %broadcast.splat5, %60
  %65 = getelementptr inbounds nuw [256 x [128 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.invar_address.dim.0.02, i64 96
  %66 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %67 = getelementptr inbounds nuw i8, ptr %65, i64 64
  %68 = getelementptr inbounds nuw i8, ptr %65, i64 96
  store <8 x i32> %61, ptr %65, align 64, !alias.scope !5
  store <8 x i32> %62, ptr %66, align 32, !alias.scope !5
  store <8 x i32> %63, ptr %67, align 64, !alias.scope !5
  store <8 x i32> %64, ptr %68, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.2.invar_address.dim.0.02, 1
  %exitcond3 = icmp eq i64 %invar.inc, 256
  br i1 %exitcond3, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 1}
!1 = !{}
!2 = !{i64 8}
!3 = !{i64 64}
!4 = !{i64 131072}
!5 = !{!6}
!6 = !{!"result slice: {index:9, offset:131136, size:131072}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion.2 AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
