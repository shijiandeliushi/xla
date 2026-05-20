; ModuleID = '__compute_module_part_02'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_add_fusion.3.clone_parallel_bounds = private unnamed_addr constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 85]], [1 x [2 x i64]] [[2 x i64] [i64 85, i64 170]], [1 x [2 x i64]] [[2 x i64] [i64 170, i64 255]], [1 x [2 x i64]] [[2 x i64] [i64 255, i64 340]], [1 x [2 x i64]] [[2 x i64] [i64 340, i64 425]], [1 x [2 x i64]] [[2 x i64] [i64 425, i64 510]], [1 x [2 x i64]] [[2 x i64] [i64 510, i64 595]], [1 x [2 x i64]] [[2 x i64] [i64 595, i64 680]], [1 x [2 x i64]] [[2 x i64] [i64 680, i64 765]], [1 x [2 x i64]] [[2 x i64] [i64 765, i64 850]], [1 x [2 x i64]] [[2 x i64] [i64 850, i64 935]], [1 x [2 x i64]] [[2 x i64] [i64 935, i64 1024]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion.3.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @broadcast_add_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @broadcast_add_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %broadcast_add_fusion.3.clone.loop_header.dim.1.preheader.lr.ph, label %return

broadcast_add_fusion.3.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load i32, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  br label %vector.ph

vector.ph:                                        ; preds = %broadcast_add_fusion.3.clone.loop_exit.dim.1, %broadcast_add_fusion.3.clone.loop_header.dim.1.preheader.lr.ph
  %broadcast_add_fusion.3.clone.invar_address.dim.0.03 = phi i64 [ %lo_dim_0, %broadcast_add_fusion.3.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %broadcast_add_fusion.3.clone.loop_exit.dim.1 ]
  %3 = lshr i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, 20
  %4 = trunc i64 %3 to i32
  %5 = add i32 %2, %4
  %broadcast.splatinsert = insertelement <8 x i32> poison, i32 %5, i64 0
  %broadcast.splat = shufflevector <8 x i32> %broadcast.splatinsert, <8 x i32> poison, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.7, %vector.body ]
  %6 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  store <8 x i32> %broadcast.splat, ptr %6, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %7, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %8, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %9, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 32
  %10 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x i32> %broadcast.splat, ptr %10, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %11, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %12, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %13, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 64
  %14 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next.1
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  store <8 x i32> %broadcast.splat, ptr %14, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %15, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %16, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %17, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 96
  %18 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next.2
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 64
  %21 = getelementptr inbounds nuw i8, ptr %18, i64 96
  store <8 x i32> %broadcast.splat, ptr %18, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %19, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %20, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %21, align 32, !alias.scope !5
  %index.next.3 = or disjoint i64 %index, 128
  %22 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next.3
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x i32> %broadcast.splat, ptr %22, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %23, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %24, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %25, align 32, !alias.scope !5
  %index.next.4 = or disjoint i64 %index, 160
  %26 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next.4
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  store <8 x i32> %broadcast.splat, ptr %26, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %27, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %28, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %29, align 32, !alias.scope !5
  %index.next.5 = or disjoint i64 %index, 192
  %30 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next.5
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 64
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 96
  store <8 x i32> %broadcast.splat, ptr %30, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %31, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %32, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %33, align 32, !alias.scope !5
  %index.next.6 = or disjoint i64 %index, 224
  %34 = getelementptr inbounds [1024 x [4096 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 %index.next.6
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  store <8 x i32> %broadcast.splat, ptr %34, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %35, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %36, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %37, align 32, !alias.scope !5
  %index.next.7 = add nuw nsw i64 %index, 256
  %38 = icmp eq i64 %index.next.7, 4096
  br i1 %38, label %broadcast_add_fusion.3.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !8

broadcast_add_fusion.3.clone.loop_exit.dim.1:     ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %vector.ph, !llvm.loop !11

return:                                           ; preds = %broadcast_add_fusion.3.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 2}
!1 = !{}
!2 = !{i64 16777216}
!3 = !{i64 64}
!4 = !{i64 8}
!5 = !{!6}
!6 = !{!"result slice: {index:9, offset:16777280, size:16777216}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion.3.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
