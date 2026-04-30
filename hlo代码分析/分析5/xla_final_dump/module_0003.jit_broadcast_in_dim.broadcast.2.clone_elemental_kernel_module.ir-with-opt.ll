; ModuleID = '__compute_module_broadcast.2.clone_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2.clone_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast.2.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 32]], [1 x [2 x i64]] [[2 x i64] [i64 32, i64 64]], [1 x [2 x i64]] [[2 x i64] [i64 64, i64 96]], [1 x [2 x i64]] [[2 x i64] [i64 96, i64 128]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast.2.clone_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not5 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not5, label %broadcast.2.clone.loop_header.dim.1.preheader.lr.ph, label %return

broadcast.2.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %broadcast.2.clone.loop_exit.dim.1, %broadcast.2.clone.loop_header.dim.1.preheader.lr.ph
  %broadcast.2.clone.invar_address.dim.0.06 = phi i64 [ %lo_dim_0, %broadcast.2.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %broadcast.2.clone.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.7, %vector.body ]
  %3 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 96
  store <8 x float> %broadcast.splat, ptr %3, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %4, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %5, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %6, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 32
  %7 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 32
  %9 = getelementptr inbounds nuw i8, ptr %7, i64 64
  %10 = getelementptr inbounds nuw i8, ptr %7, i64 96
  store <8 x float> %broadcast.splat, ptr %7, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %8, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %9, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %10, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 64
  %11 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next.1
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 96
  store <8 x float> %broadcast.splat, ptr %11, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %12, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %13, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %14, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 96
  %15 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next.2
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 96
  store <8 x float> %broadcast.splat, ptr %15, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %16, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %17, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %18, align 32, !alias.scope !5
  %index.next.3 = or disjoint i64 %index, 128
  %19 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next.3
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 32
  %21 = getelementptr inbounds nuw i8, ptr %19, i64 64
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 96
  store <8 x float> %broadcast.splat, ptr %19, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %20, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %21, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %22, align 32, !alias.scope !5
  %index.next.4 = or disjoint i64 %index, 160
  %23 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next.4
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %26 = getelementptr inbounds nuw i8, ptr %23, i64 96
  store <8 x float> %broadcast.splat, ptr %23, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %24, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %25, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %26, align 32, !alias.scope !5
  %index.next.5 = or disjoint i64 %index, 192
  %27 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next.5
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 64
  %30 = getelementptr inbounds nuw i8, ptr %27, i64 96
  store <8 x float> %broadcast.splat, ptr %27, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %28, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %29, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %30, align 32, !alias.scope !5
  %index.next.6 = or disjoint i64 %index, 224
  %31 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %broadcast.2.clone.invar_address.dim.0.06, i64 %index.next.6
  %32 = getelementptr inbounds nuw i8, ptr %31, i64 32
  %33 = getelementptr inbounds nuw i8, ptr %31, i64 64
  %34 = getelementptr inbounds nuw i8, ptr %31, i64 96
  store <8 x float> %broadcast.splat, ptr %31, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %32, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %33, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %34, align 32, !alias.scope !5
  %index.next.7 = add nuw nsw i64 %index, 256
  %35 = icmp eq i64 %index.next.7, 2048
  br i1 %35, label %broadcast.2.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !8

broadcast.2.clone.loop_exit.dim.1:                ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %broadcast.2.clone.invar_address.dim.0.06, 1
  %exitcond7.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond7.not, label %return, label %vector.ph, !llvm.loop !11

return:                                           ; preds = %broadcast.2.clone.loop_exit.dim.1, %1
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
!7 = !{!"XLA host kernel broadcast.2.clone_kernel AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
