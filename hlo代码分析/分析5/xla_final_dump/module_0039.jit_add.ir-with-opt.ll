; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_add_fusion.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 32]], [1 x [2 x i64]] [[2 x i64] [i64 32, i64 64]], [1 x [2 x i64]] [[2 x i64] [i64 64, i64 96]], [1 x [2 x i64]] [[2 x i64] [i64 96, i64 128]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_add_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_add_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not7 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not7, label %broadcast_add_fusion.clone.loop_header.dim.1.preheader.lr.ph, label %return

broadcast_add_fusion.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load float, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %broadcast_add_fusion.clone.loop_exit.dim.1, %broadcast_add_fusion.clone.loop_header.dim.1.preheader.lr.ph
  %broadcast_add_fusion.clone.invar_address.dim.0.08 = phi i64 [ %lo_dim_0, %broadcast_add_fusion.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %broadcast_add_fusion.clone.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %3 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 96
  %wide.load = load <8 x float>, ptr %3, align 64, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %4, align 32, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %5, align 64, !invariant.load !1, !noalias !5
  %wide.load12 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %7 = fadd <8 x float> %broadcast.splat, %wide.load
  %8 = fadd <8 x float> %broadcast.splat, %wide.load10
  %9 = fadd <8 x float> %broadcast.splat, %wide.load11
  %10 = fadd <8 x float> %broadcast.splat, %wide.load12
  %11 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 96
  store <8 x float> %7, ptr %11, align 64, !alias.scope !5
  store <8 x float> %8, ptr %12, align 32, !alias.scope !5
  store <8 x float> %9, ptr %13, align 64, !alias.scope !5
  store <8 x float> %10, ptr %14, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 32
  %15 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index.next
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 96
  %wide.load.1 = load <8 x float>, ptr %15, align 64, !invariant.load !1, !noalias !5
  %wide.load10.1 = load <8 x float>, ptr %16, align 32, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %17, align 64, !invariant.load !1, !noalias !5
  %wide.load12.1 = load <8 x float>, ptr %18, align 32, !invariant.load !1, !noalias !5
  %19 = fadd <8 x float> %broadcast.splat, %wide.load.1
  %20 = fadd <8 x float> %broadcast.splat, %wide.load10.1
  %21 = fadd <8 x float> %broadcast.splat, %wide.load11.1
  %22 = fadd <8 x float> %broadcast.splat, %wide.load12.1
  %23 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index.next
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %26 = getelementptr inbounds nuw i8, ptr %23, i64 96
  store <8 x float> %19, ptr %23, align 64, !alias.scope !5
  store <8 x float> %20, ptr %24, align 32, !alias.scope !5
  store <8 x float> %21, ptr %25, align 64, !alias.scope !5
  store <8 x float> %22, ptr %26, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 64
  %27 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index.next.1
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 64
  %30 = getelementptr inbounds nuw i8, ptr %27, i64 96
  %wide.load.2 = load <8 x float>, ptr %27, align 64, !invariant.load !1, !noalias !5
  %wide.load10.2 = load <8 x float>, ptr %28, align 32, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %29, align 64, !invariant.load !1, !noalias !5
  %wide.load12.2 = load <8 x float>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %31 = fadd <8 x float> %broadcast.splat, %wide.load.2
  %32 = fadd <8 x float> %broadcast.splat, %wide.load10.2
  %33 = fadd <8 x float> %broadcast.splat, %wide.load11.2
  %34 = fadd <8 x float> %broadcast.splat, %wide.load12.2
  %35 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index.next.1
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 32
  %37 = getelementptr inbounds nuw i8, ptr %35, i64 64
  %38 = getelementptr inbounds nuw i8, ptr %35, i64 96
  store <8 x float> %31, ptr %35, align 64, !alias.scope !5
  store <8 x float> %32, ptr %36, align 32, !alias.scope !5
  store <8 x float> %33, ptr %37, align 64, !alias.scope !5
  store <8 x float> %34, ptr %38, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 96
  %39 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index.next.2
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %39, i64 96
  %wide.load.3 = load <8 x float>, ptr %39, align 64, !invariant.load !1, !noalias !5
  %wide.load10.3 = load <8 x float>, ptr %40, align 32, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %41, align 64, !invariant.load !1, !noalias !5
  %wide.load12.3 = load <8 x float>, ptr %42, align 32, !invariant.load !1, !noalias !5
  %43 = fadd <8 x float> %broadcast.splat, %wide.load.3
  %44 = fadd <8 x float> %broadcast.splat, %wide.load10.3
  %45 = fadd <8 x float> %broadcast.splat, %wide.load11.3
  %46 = fadd <8 x float> %broadcast.splat, %wide.load12.3
  %47 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, i64 %index.next.2
  %48 = getelementptr inbounds nuw i8, ptr %47, i64 32
  %49 = getelementptr inbounds nuw i8, ptr %47, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %47, i64 96
  store <8 x float> %43, ptr %47, align 64, !alias.scope !5
  store <8 x float> %44, ptr %48, align 32, !alias.scope !5
  store <8 x float> %45, ptr %49, align 64, !alias.scope !5
  store <8 x float> %46, ptr %50, align 32, !alias.scope !5
  %index.next.3 = add nuw nsw i64 %index, 128
  %51 = icmp eq i64 %index.next.3, 2048
  br i1 %51, label %broadcast_add_fusion.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !8

broadcast_add_fusion.clone.loop_exit.dim.1:       ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.clone.invar_address.dim.0.08, 1
  %exitcond9.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond9.not, label %return, label %vector.ph, !llvm.loop !11

return:                                           ; preds = %broadcast_add_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:1048576}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
