; ModuleID = '__compute_module_part_19'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_divide_fusion.1.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @add_add_fusion.8.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg3_gep = getelementptr i8, ptr %args, i64 48
  %arg3 = load ptr, ptr %arg3_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not3 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not3, label %add_add_fusion.8.clone.loop_header.dim.1.preheader, label %return

add_add_fusion.8.clone.loop_header.dim.1.preheader: ; preds = %1, %add_add_fusion.8.clone.loop_exit.dim.1
  %add_add_fusion.8.clone.invar_address.dim.0.04 = phi i64 [ %invar.inc, %add_add_fusion.8.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = shl nuw nsw i64 %add_add_fusion.8.clone.invar_address.dim.0.04, 9
  br label %add_add_fusion.8.clone.loop_header.dim.2.preheader

add_add_fusion.8.clone.loop_header.dim.2.preheader: ; preds = %add_add_fusion.8.clone.loop_header.dim.1.preheader, %add_add_fusion.8.clone.loop_exit.dim.2
  %add_add_fusion.8.clone.invar_address.dim.1.02 = phi i64 [ 0, %add_add_fusion.8.clone.loop_header.dim.1.preheader ], [ %invar.inc7, %add_add_fusion.8.clone.loop_exit.dim.2 ]
  %3 = add nuw nsw i64 %add_add_fusion.8.clone.invar_address.dim.1.02, %2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %add_add_fusion.8.clone.loop_header.dim.2.preheader
  %index = phi i64 [ 0, %add_add_fusion.8.clone.loop_header.dim.2.preheader ], [ %index.next.3, %vector.body ]
  %4 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %wide.load = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !5
  %wide.load7 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !5
  %6 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %wide.load8 = load <8 x float>, ptr %6, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %7, align 32, !invariant.load !1, !noalias !5
  %8 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 32
  %wide.load10 = load <8 x float>, ptr %8, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %9, align 32, !invariant.load !1, !noalias !5
  %10 = fadd <8 x float> %wide.load8, %wide.load10
  %11 = fadd <8 x float> %wide.load9, %wide.load11
  %12 = fadd <8 x float> %wide.load, %10
  %13 = fadd <8 x float> %wide.load7, %11
  %14 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  store <8 x float> %12, ptr %14, align 64, !alias.scope !5
  store <8 x float> %13, ptr %15, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 16
  %16 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index.next
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %wide.load.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !5
  %wide.load7.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !5
  %18 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index.next
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %wide.load8.1 = load <8 x float>, ptr %18, align 64, !invariant.load !1, !noalias !5
  %wide.load9.1 = load <8 x float>, ptr %19, align 32, !invariant.load !1, !noalias !5
  %20 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index.next
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 32
  %wide.load10.1 = load <8 x float>, ptr %20, align 64, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %21, align 32, !invariant.load !1, !noalias !5
  %22 = fadd <8 x float> %wide.load8.1, %wide.load10.1
  %23 = fadd <8 x float> %wide.load9.1, %wide.load11.1
  %24 = fadd <8 x float> %wide.load.1, %22
  %25 = fadd <8 x float> %wide.load7.1, %23
  %26 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index.next
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  store <8 x float> %24, ptr %26, align 64, !alias.scope !5
  store <8 x float> %25, ptr %27, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 32
  %28 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index.next.1
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 32
  %wide.load.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !5
  %wide.load7.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !5
  %30 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index.next.1
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %wide.load8.2 = load <8 x float>, ptr %30, align 64, !invariant.load !1, !noalias !5
  %wide.load9.2 = load <8 x float>, ptr %31, align 32, !invariant.load !1, !noalias !5
  %32 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index.next.1
  %33 = getelementptr inbounds nuw i8, ptr %32, i64 32
  %wide.load10.2 = load <8 x float>, ptr %32, align 64, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %33, align 32, !invariant.load !1, !noalias !5
  %34 = fadd <8 x float> %wide.load8.2, %wide.load10.2
  %35 = fadd <8 x float> %wide.load9.2, %wide.load11.2
  %36 = fadd <8 x float> %wide.load.2, %34
  %37 = fadd <8 x float> %wide.load7.2, %35
  %38 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index.next.1
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  store <8 x float> %36, ptr %38, align 64, !alias.scope !5
  store <8 x float> %37, ptr %39, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 48
  %40 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index.next.2
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 32
  %wide.load.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !5
  %wide.load7.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !5
  %42 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index.next.2
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 32
  %wide.load8.3 = load <8 x float>, ptr %42, align 64, !invariant.load !1, !noalias !5
  %wide.load9.3 = load <8 x float>, ptr %43, align 32, !invariant.load !1, !noalias !5
  %44 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index.next.2
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 32
  %wide.load10.3 = load <8 x float>, ptr %44, align 64, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %45, align 32, !invariant.load !1, !noalias !5
  %46 = fadd <8 x float> %wide.load8.3, %wide.load10.3
  %47 = fadd <8 x float> %wide.load9.3, %wide.load11.3
  %48 = fadd <8 x float> %wide.load.3, %46
  %49 = fadd <8 x float> %wide.load7.3, %47
  %50 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.8.clone.invar_address.dim.0.04, i64 %add_add_fusion.8.clone.invar_address.dim.1.02, i64 %index.next.2
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  store <8 x float> %48, ptr %50, align 64, !alias.scope !5
  store <8 x float> %49, ptr %51, align 32, !alias.scope !5
  %index.next.3 = add nuw nsw i64 %index, 64
  %52 = icmp eq i64 %index.next.3, 1024
  br i1 %52, label %add_add_fusion.8.clone.loop_exit.dim.2, label %vector.body, !llvm.loop !8

add_add_fusion.8.clone.loop_exit.dim.2:           ; preds = %vector.body
  %invar.inc7 = add nuw nsw i64 %add_add_fusion.8.clone.invar_address.dim.1.02, 1
  %exitcond5 = icmp eq i64 %invar.inc7, 512
  br i1 %exitcond5, label %add_add_fusion.8.clone.loop_exit.dim.1, label %add_add_fusion.8.clone.loop_header.dim.2.preheader, !llvm.loop !11

add_add_fusion.8.clone.loop_exit.dim.1:           ; preds = %add_add_fusion.8.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %add_add_fusion.8.clone.invar_address.dim.0.04, 1
  %exitcond6.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond6.not, label %return, label %add_add_fusion.8.clone.loop_header.dim.1.preheader, !llvm.loop !13

return:                                           ; preds = %add_add_fusion.8.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_divide_fusion.1.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !14, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !15, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !14, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %broadcast_divide_fusion.1.clone.loop_header.dim.1.preheader, label %return

broadcast_divide_fusion.1.clone.loop_header.dim.1.preheader: ; preds = %1, %broadcast_divide_fusion.1.clone.loop_exit.dim.1
  %broadcast_divide_fusion.1.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %broadcast_divide_fusion.1.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %broadcast_divide_fusion.1.clone.loop_header.dim.2.preheader

broadcast_divide_fusion.1.clone.loop_header.dim.2.preheader: ; preds = %broadcast_divide_fusion.1.clone.loop_header.dim.1.preheader, %broadcast_divide_fusion.1.clone.loop_exit.dim.2
  %broadcast_divide_fusion.1.clone.invar_address.dim.1.03 = phi i64 [ 0, %broadcast_divide_fusion.1.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %broadcast_divide_fusion.1.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_divide_fusion.1.clone.loop_header.dim.2.preheader
  %broadcast_divide_fusion.1.clone.invar_address.dim.2.02 = phi i64 [ 0, %broadcast_divide_fusion.1.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %vector.ph ]
  %2 = getelementptr inbounds [32 x [16 x [512 x float]]], ptr %arg1, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02
  %3 = load float, ptr %2, align 4, !invariant.load !1, !noalias !16
  %broadcast.splatinsert = insertelement <8 x float> poison, float %3, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  %4 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 0
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %6 = getelementptr inbounds nuw i8, ptr %4, i64 64
  %7 = getelementptr inbounds nuw i8, ptr %4, i64 96
  %wide.load = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !16
  %wide.load9 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !16
  %wide.load10 = load <8 x float>, ptr %6, align 64, !invariant.load !1, !noalias !16
  %wide.load11 = load <8 x float>, ptr %7, align 32, !invariant.load !1, !noalias !16
  %8 = fdiv <8 x float> %wide.load, %broadcast.splat
  %9 = fdiv <8 x float> %wide.load9, %broadcast.splat
  %10 = fdiv <8 x float> %wide.load10, %broadcast.splat
  %11 = fdiv <8 x float> %wide.load11, %broadcast.splat
  %12 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 0
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 32
  %14 = getelementptr inbounds nuw i8, ptr %12, i64 64
  %15 = getelementptr inbounds nuw i8, ptr %12, i64 96
  store <8 x float> %8, ptr %12, align 64, !alias.scope !16
  store <8 x float> %9, ptr %13, align 32, !alias.scope !16
  store <8 x float> %10, ptr %14, align 64, !alias.scope !16
  store <8 x float> %11, ptr %15, align 32, !alias.scope !16
  %16 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %18 = getelementptr inbounds nuw i8, ptr %16, i64 64
  %19 = getelementptr inbounds nuw i8, ptr %16, i64 96
  %wide.load.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !16
  %wide.load9.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !16
  %wide.load10.1 = load <8 x float>, ptr %18, align 64, !invariant.load !1, !noalias !16
  %wide.load11.1 = load <8 x float>, ptr %19, align 32, !invariant.load !1, !noalias !16
  %20 = fdiv <8 x float> %wide.load.1, %broadcast.splat
  %21 = fdiv <8 x float> %wide.load9.1, %broadcast.splat
  %22 = fdiv <8 x float> %wide.load10.1, %broadcast.splat
  %23 = fdiv <8 x float> %wide.load11.1, %broadcast.splat
  %24 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 32
  %26 = getelementptr inbounds nuw i8, ptr %24, i64 64
  %27 = getelementptr inbounds nuw i8, ptr %24, i64 96
  store <8 x float> %20, ptr %24, align 64, !alias.scope !16
  store <8 x float> %21, ptr %25, align 32, !alias.scope !16
  store <8 x float> %22, ptr %26, align 64, !alias.scope !16
  store <8 x float> %23, ptr %27, align 32, !alias.scope !16
  %28 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 32
  %30 = getelementptr inbounds nuw i8, ptr %28, i64 64
  %31 = getelementptr inbounds nuw i8, ptr %28, i64 96
  %wide.load.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !16
  %wide.load9.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !16
  %wide.load10.2 = load <8 x float>, ptr %30, align 64, !invariant.load !1, !noalias !16
  %wide.load11.2 = load <8 x float>, ptr %31, align 32, !invariant.load !1, !noalias !16
  %32 = fdiv <8 x float> %wide.load.2, %broadcast.splat
  %33 = fdiv <8 x float> %wide.load9.2, %broadcast.splat
  %34 = fdiv <8 x float> %wide.load10.2, %broadcast.splat
  %35 = fdiv <8 x float> %wide.load11.2, %broadcast.splat
  %36 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %36, i64 32
  %38 = getelementptr inbounds nuw i8, ptr %36, i64 64
  %39 = getelementptr inbounds nuw i8, ptr %36, i64 96
  store <8 x float> %32, ptr %36, align 64, !alias.scope !16
  store <8 x float> %33, ptr %37, align 32, !alias.scope !16
  store <8 x float> %34, ptr %38, align 64, !alias.scope !16
  store <8 x float> %35, ptr %39, align 32, !alias.scope !16
  %40 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 96
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 32
  %42 = getelementptr inbounds nuw i8, ptr %40, i64 64
  %43 = getelementptr inbounds nuw i8, ptr %40, i64 96
  %wide.load.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !16
  %wide.load9.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !16
  %wide.load10.3 = load <8 x float>, ptr %42, align 64, !invariant.load !1, !noalias !16
  %wide.load11.3 = load <8 x float>, ptr %43, align 32, !invariant.load !1, !noalias !16
  %44 = fdiv <8 x float> %wide.load.3, %broadcast.splat
  %45 = fdiv <8 x float> %wide.load9.3, %broadcast.splat
  %46 = fdiv <8 x float> %wide.load10.3, %broadcast.splat
  %47 = fdiv <8 x float> %wide.load11.3, %broadcast.splat
  %48 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 96
  %49 = getelementptr inbounds nuw i8, ptr %48, i64 32
  %50 = getelementptr inbounds nuw i8, ptr %48, i64 64
  %51 = getelementptr inbounds nuw i8, ptr %48, i64 96
  store <8 x float> %44, ptr %48, align 64, !alias.scope !16
  store <8 x float> %45, ptr %49, align 32, !alias.scope !16
  store <8 x float> %46, ptr %50, align 64, !alias.scope !16
  store <8 x float> %47, ptr %51, align 32, !alias.scope !16
  %52 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 128
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 32
  %54 = getelementptr inbounds nuw i8, ptr %52, i64 64
  %55 = getelementptr inbounds nuw i8, ptr %52, i64 96
  %wide.load.4 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !16
  %wide.load9.4 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !16
  %wide.load10.4 = load <8 x float>, ptr %54, align 64, !invariant.load !1, !noalias !16
  %wide.load11.4 = load <8 x float>, ptr %55, align 32, !invariant.load !1, !noalias !16
  %56 = fdiv <8 x float> %wide.load.4, %broadcast.splat
  %57 = fdiv <8 x float> %wide.load9.4, %broadcast.splat
  %58 = fdiv <8 x float> %wide.load10.4, %broadcast.splat
  %59 = fdiv <8 x float> %wide.load11.4, %broadcast.splat
  %60 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 128
  %61 = getelementptr inbounds nuw i8, ptr %60, i64 32
  %62 = getelementptr inbounds nuw i8, ptr %60, i64 64
  %63 = getelementptr inbounds nuw i8, ptr %60, i64 96
  store <8 x float> %56, ptr %60, align 64, !alias.scope !16
  store <8 x float> %57, ptr %61, align 32, !alias.scope !16
  store <8 x float> %58, ptr %62, align 64, !alias.scope !16
  store <8 x float> %59, ptr %63, align 32, !alias.scope !16
  %64 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 160
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 32
  %66 = getelementptr inbounds nuw i8, ptr %64, i64 64
  %67 = getelementptr inbounds nuw i8, ptr %64, i64 96
  %wide.load.5 = load <8 x float>, ptr %64, align 64, !invariant.load !1, !noalias !16
  %wide.load9.5 = load <8 x float>, ptr %65, align 32, !invariant.load !1, !noalias !16
  %wide.load10.5 = load <8 x float>, ptr %66, align 64, !invariant.load !1, !noalias !16
  %wide.load11.5 = load <8 x float>, ptr %67, align 32, !invariant.load !1, !noalias !16
  %68 = fdiv <8 x float> %wide.load.5, %broadcast.splat
  %69 = fdiv <8 x float> %wide.load9.5, %broadcast.splat
  %70 = fdiv <8 x float> %wide.load10.5, %broadcast.splat
  %71 = fdiv <8 x float> %wide.load11.5, %broadcast.splat
  %72 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 160
  %73 = getelementptr inbounds nuw i8, ptr %72, i64 32
  %74 = getelementptr inbounds nuw i8, ptr %72, i64 64
  %75 = getelementptr inbounds nuw i8, ptr %72, i64 96
  store <8 x float> %68, ptr %72, align 64, !alias.scope !16
  store <8 x float> %69, ptr %73, align 32, !alias.scope !16
  store <8 x float> %70, ptr %74, align 64, !alias.scope !16
  store <8 x float> %71, ptr %75, align 32, !alias.scope !16
  %76 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 192
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 32
  %78 = getelementptr inbounds nuw i8, ptr %76, i64 64
  %79 = getelementptr inbounds nuw i8, ptr %76, i64 96
  %wide.load.6 = load <8 x float>, ptr %76, align 64, !invariant.load !1, !noalias !16
  %wide.load9.6 = load <8 x float>, ptr %77, align 32, !invariant.load !1, !noalias !16
  %wide.load10.6 = load <8 x float>, ptr %78, align 64, !invariant.load !1, !noalias !16
  %wide.load11.6 = load <8 x float>, ptr %79, align 32, !invariant.load !1, !noalias !16
  %80 = fdiv <8 x float> %wide.load.6, %broadcast.splat
  %81 = fdiv <8 x float> %wide.load9.6, %broadcast.splat
  %82 = fdiv <8 x float> %wide.load10.6, %broadcast.splat
  %83 = fdiv <8 x float> %wide.load11.6, %broadcast.splat
  %84 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 192
  %85 = getelementptr inbounds nuw i8, ptr %84, i64 32
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 64
  %87 = getelementptr inbounds nuw i8, ptr %84, i64 96
  store <8 x float> %80, ptr %84, align 64, !alias.scope !16
  store <8 x float> %81, ptr %85, align 32, !alias.scope !16
  store <8 x float> %82, ptr %86, align 64, !alias.scope !16
  store <8 x float> %83, ptr %87, align 32, !alias.scope !16
  %88 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 224
  %89 = getelementptr inbounds nuw i8, ptr %88, i64 32
  %90 = getelementptr inbounds nuw i8, ptr %88, i64 64
  %91 = getelementptr inbounds nuw i8, ptr %88, i64 96
  %wide.load.7 = load <8 x float>, ptr %88, align 64, !invariant.load !1, !noalias !16
  %wide.load9.7 = load <8 x float>, ptr %89, align 32, !invariant.load !1, !noalias !16
  %wide.load10.7 = load <8 x float>, ptr %90, align 64, !invariant.load !1, !noalias !16
  %wide.load11.7 = load <8 x float>, ptr %91, align 32, !invariant.load !1, !noalias !16
  %92 = fdiv <8 x float> %wide.load.7, %broadcast.splat
  %93 = fdiv <8 x float> %wide.load9.7, %broadcast.splat
  %94 = fdiv <8 x float> %wide.load10.7, %broadcast.splat
  %95 = fdiv <8 x float> %wide.load11.7, %broadcast.splat
  %96 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 224
  %97 = getelementptr inbounds nuw i8, ptr %96, i64 32
  %98 = getelementptr inbounds nuw i8, ptr %96, i64 64
  %99 = getelementptr inbounds nuw i8, ptr %96, i64 96
  store <8 x float> %92, ptr %96, align 64, !alias.scope !16
  store <8 x float> %93, ptr %97, align 32, !alias.scope !16
  store <8 x float> %94, ptr %98, align 64, !alias.scope !16
  store <8 x float> %95, ptr %99, align 32, !alias.scope !16
  %100 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 256
  %101 = getelementptr inbounds nuw i8, ptr %100, i64 32
  %102 = getelementptr inbounds nuw i8, ptr %100, i64 64
  %103 = getelementptr inbounds nuw i8, ptr %100, i64 96
  %wide.load.8 = load <8 x float>, ptr %100, align 64, !invariant.load !1, !noalias !16
  %wide.load9.8 = load <8 x float>, ptr %101, align 32, !invariant.load !1, !noalias !16
  %wide.load10.8 = load <8 x float>, ptr %102, align 64, !invariant.load !1, !noalias !16
  %wide.load11.8 = load <8 x float>, ptr %103, align 32, !invariant.load !1, !noalias !16
  %104 = fdiv <8 x float> %wide.load.8, %broadcast.splat
  %105 = fdiv <8 x float> %wide.load9.8, %broadcast.splat
  %106 = fdiv <8 x float> %wide.load10.8, %broadcast.splat
  %107 = fdiv <8 x float> %wide.load11.8, %broadcast.splat
  %108 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 256
  %109 = getelementptr inbounds nuw i8, ptr %108, i64 32
  %110 = getelementptr inbounds nuw i8, ptr %108, i64 64
  %111 = getelementptr inbounds nuw i8, ptr %108, i64 96
  store <8 x float> %104, ptr %108, align 64, !alias.scope !16
  store <8 x float> %105, ptr %109, align 32, !alias.scope !16
  store <8 x float> %106, ptr %110, align 64, !alias.scope !16
  store <8 x float> %107, ptr %111, align 32, !alias.scope !16
  %112 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 288
  %113 = getelementptr inbounds nuw i8, ptr %112, i64 32
  %114 = getelementptr inbounds nuw i8, ptr %112, i64 64
  %115 = getelementptr inbounds nuw i8, ptr %112, i64 96
  %wide.load.9 = load <8 x float>, ptr %112, align 64, !invariant.load !1, !noalias !16
  %wide.load9.9 = load <8 x float>, ptr %113, align 32, !invariant.load !1, !noalias !16
  %wide.load10.9 = load <8 x float>, ptr %114, align 64, !invariant.load !1, !noalias !16
  %wide.load11.9 = load <8 x float>, ptr %115, align 32, !invariant.load !1, !noalias !16
  %116 = fdiv <8 x float> %wide.load.9, %broadcast.splat
  %117 = fdiv <8 x float> %wide.load9.9, %broadcast.splat
  %118 = fdiv <8 x float> %wide.load10.9, %broadcast.splat
  %119 = fdiv <8 x float> %wide.load11.9, %broadcast.splat
  %120 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 288
  %121 = getelementptr inbounds nuw i8, ptr %120, i64 32
  %122 = getelementptr inbounds nuw i8, ptr %120, i64 64
  %123 = getelementptr inbounds nuw i8, ptr %120, i64 96
  store <8 x float> %116, ptr %120, align 64, !alias.scope !16
  store <8 x float> %117, ptr %121, align 32, !alias.scope !16
  store <8 x float> %118, ptr %122, align 64, !alias.scope !16
  store <8 x float> %119, ptr %123, align 32, !alias.scope !16
  %124 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 320
  %125 = getelementptr inbounds nuw i8, ptr %124, i64 32
  %126 = getelementptr inbounds nuw i8, ptr %124, i64 64
  %127 = getelementptr inbounds nuw i8, ptr %124, i64 96
  %wide.load.10 = load <8 x float>, ptr %124, align 64, !invariant.load !1, !noalias !16
  %wide.load9.10 = load <8 x float>, ptr %125, align 32, !invariant.load !1, !noalias !16
  %wide.load10.10 = load <8 x float>, ptr %126, align 64, !invariant.load !1, !noalias !16
  %wide.load11.10 = load <8 x float>, ptr %127, align 32, !invariant.load !1, !noalias !16
  %128 = fdiv <8 x float> %wide.load.10, %broadcast.splat
  %129 = fdiv <8 x float> %wide.load9.10, %broadcast.splat
  %130 = fdiv <8 x float> %wide.load10.10, %broadcast.splat
  %131 = fdiv <8 x float> %wide.load11.10, %broadcast.splat
  %132 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 320
  %133 = getelementptr inbounds nuw i8, ptr %132, i64 32
  %134 = getelementptr inbounds nuw i8, ptr %132, i64 64
  %135 = getelementptr inbounds nuw i8, ptr %132, i64 96
  store <8 x float> %128, ptr %132, align 64, !alias.scope !16
  store <8 x float> %129, ptr %133, align 32, !alias.scope !16
  store <8 x float> %130, ptr %134, align 64, !alias.scope !16
  store <8 x float> %131, ptr %135, align 32, !alias.scope !16
  %136 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 352
  %137 = getelementptr inbounds nuw i8, ptr %136, i64 32
  %138 = getelementptr inbounds nuw i8, ptr %136, i64 64
  %139 = getelementptr inbounds nuw i8, ptr %136, i64 96
  %wide.load.11 = load <8 x float>, ptr %136, align 64, !invariant.load !1, !noalias !16
  %wide.load9.11 = load <8 x float>, ptr %137, align 32, !invariant.load !1, !noalias !16
  %wide.load10.11 = load <8 x float>, ptr %138, align 64, !invariant.load !1, !noalias !16
  %wide.load11.11 = load <8 x float>, ptr %139, align 32, !invariant.load !1, !noalias !16
  %140 = fdiv <8 x float> %wide.load.11, %broadcast.splat
  %141 = fdiv <8 x float> %wide.load9.11, %broadcast.splat
  %142 = fdiv <8 x float> %wide.load10.11, %broadcast.splat
  %143 = fdiv <8 x float> %wide.load11.11, %broadcast.splat
  %144 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 352
  %145 = getelementptr inbounds nuw i8, ptr %144, i64 32
  %146 = getelementptr inbounds nuw i8, ptr %144, i64 64
  %147 = getelementptr inbounds nuw i8, ptr %144, i64 96
  store <8 x float> %140, ptr %144, align 64, !alias.scope !16
  store <8 x float> %141, ptr %145, align 32, !alias.scope !16
  store <8 x float> %142, ptr %146, align 64, !alias.scope !16
  store <8 x float> %143, ptr %147, align 32, !alias.scope !16
  %148 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 384
  %149 = getelementptr inbounds nuw i8, ptr %148, i64 32
  %150 = getelementptr inbounds nuw i8, ptr %148, i64 64
  %151 = getelementptr inbounds nuw i8, ptr %148, i64 96
  %wide.load.12 = load <8 x float>, ptr %148, align 64, !invariant.load !1, !noalias !16
  %wide.load9.12 = load <8 x float>, ptr %149, align 32, !invariant.load !1, !noalias !16
  %wide.load10.12 = load <8 x float>, ptr %150, align 64, !invariant.load !1, !noalias !16
  %wide.load11.12 = load <8 x float>, ptr %151, align 32, !invariant.load !1, !noalias !16
  %152 = fdiv <8 x float> %wide.load.12, %broadcast.splat
  %153 = fdiv <8 x float> %wide.load9.12, %broadcast.splat
  %154 = fdiv <8 x float> %wide.load10.12, %broadcast.splat
  %155 = fdiv <8 x float> %wide.load11.12, %broadcast.splat
  %156 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 384
  %157 = getelementptr inbounds nuw i8, ptr %156, i64 32
  %158 = getelementptr inbounds nuw i8, ptr %156, i64 64
  %159 = getelementptr inbounds nuw i8, ptr %156, i64 96
  store <8 x float> %152, ptr %156, align 64, !alias.scope !16
  store <8 x float> %153, ptr %157, align 32, !alias.scope !16
  store <8 x float> %154, ptr %158, align 64, !alias.scope !16
  store <8 x float> %155, ptr %159, align 32, !alias.scope !16
  %160 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 416
  %161 = getelementptr inbounds nuw i8, ptr %160, i64 32
  %162 = getelementptr inbounds nuw i8, ptr %160, i64 64
  %163 = getelementptr inbounds nuw i8, ptr %160, i64 96
  %wide.load.13 = load <8 x float>, ptr %160, align 64, !invariant.load !1, !noalias !16
  %wide.load9.13 = load <8 x float>, ptr %161, align 32, !invariant.load !1, !noalias !16
  %wide.load10.13 = load <8 x float>, ptr %162, align 64, !invariant.load !1, !noalias !16
  %wide.load11.13 = load <8 x float>, ptr %163, align 32, !invariant.load !1, !noalias !16
  %164 = fdiv <8 x float> %wide.load.13, %broadcast.splat
  %165 = fdiv <8 x float> %wide.load9.13, %broadcast.splat
  %166 = fdiv <8 x float> %wide.load10.13, %broadcast.splat
  %167 = fdiv <8 x float> %wide.load11.13, %broadcast.splat
  %168 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 416
  %169 = getelementptr inbounds nuw i8, ptr %168, i64 32
  %170 = getelementptr inbounds nuw i8, ptr %168, i64 64
  %171 = getelementptr inbounds nuw i8, ptr %168, i64 96
  store <8 x float> %164, ptr %168, align 64, !alias.scope !16
  store <8 x float> %165, ptr %169, align 32, !alias.scope !16
  store <8 x float> %166, ptr %170, align 64, !alias.scope !16
  store <8 x float> %167, ptr %171, align 32, !alias.scope !16
  %172 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 448
  %173 = getelementptr inbounds nuw i8, ptr %172, i64 32
  %174 = getelementptr inbounds nuw i8, ptr %172, i64 64
  %175 = getelementptr inbounds nuw i8, ptr %172, i64 96
  %wide.load.14 = load <8 x float>, ptr %172, align 64, !invariant.load !1, !noalias !16
  %wide.load9.14 = load <8 x float>, ptr %173, align 32, !invariant.load !1, !noalias !16
  %wide.load10.14 = load <8 x float>, ptr %174, align 64, !invariant.load !1, !noalias !16
  %wide.load11.14 = load <8 x float>, ptr %175, align 32, !invariant.load !1, !noalias !16
  %176 = fdiv <8 x float> %wide.load.14, %broadcast.splat
  %177 = fdiv <8 x float> %wide.load9.14, %broadcast.splat
  %178 = fdiv <8 x float> %wide.load10.14, %broadcast.splat
  %179 = fdiv <8 x float> %wide.load11.14, %broadcast.splat
  %180 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 448
  %181 = getelementptr inbounds nuw i8, ptr %180, i64 32
  %182 = getelementptr inbounds nuw i8, ptr %180, i64 64
  %183 = getelementptr inbounds nuw i8, ptr %180, i64 96
  store <8 x float> %176, ptr %180, align 64, !alias.scope !16
  store <8 x float> %177, ptr %181, align 32, !alias.scope !16
  store <8 x float> %178, ptr %182, align 64, !alias.scope !16
  store <8 x float> %179, ptr %183, align 32, !alias.scope !16
  %184 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 480
  %185 = getelementptr inbounds nuw i8, ptr %184, i64 32
  %186 = getelementptr inbounds nuw i8, ptr %184, i64 64
  %187 = getelementptr inbounds nuw i8, ptr %184, i64 96
  %wide.load.15 = load <8 x float>, ptr %184, align 64, !invariant.load !1, !noalias !16
  %wide.load9.15 = load <8 x float>, ptr %185, align 32, !invariant.load !1, !noalias !16
  %wide.load10.15 = load <8 x float>, ptr %186, align 64, !invariant.load !1, !noalias !16
  %wide.load11.15 = load <8 x float>, ptr %187, align 32, !invariant.load !1, !noalias !16
  %188 = fdiv <8 x float> %wide.load.15, %broadcast.splat
  %189 = fdiv <8 x float> %wide.load9.15, %broadcast.splat
  %190 = fdiv <8 x float> %wide.load10.15, %broadcast.splat
  %191 = fdiv <8 x float> %wide.load11.15, %broadcast.splat
  %192 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, i64 480
  %193 = getelementptr inbounds nuw i8, ptr %192, i64 32
  %194 = getelementptr inbounds nuw i8, ptr %192, i64 64
  %195 = getelementptr inbounds nuw i8, ptr %192, i64 96
  store <8 x float> %188, ptr %192, align 64, !alias.scope !16
  store <8 x float> %189, ptr %193, align 32, !alias.scope !16
  store <8 x float> %190, ptr %194, align 64, !alias.scope !16
  store <8 x float> %191, ptr %195, align 32, !alias.scope !16
  %invar.inc6 = add nuw nsw i64 %broadcast_divide_fusion.1.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond6, label %broadcast_divide_fusion.1.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !19

broadcast_divide_fusion.1.clone.loop_exit.dim.2:  ; preds = %vector.ph
  %invar.inc5 = add nuw nsw i64 %broadcast_divide_fusion.1.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %broadcast_divide_fusion.1.clone.loop_exit.dim.1, label %broadcast_divide_fusion.1.clone.loop_header.dim.2.preheader, !llvm.loop !20

broadcast_divide_fusion.1.clone.loop_exit.dim.1:  ; preds = %broadcast_divide_fusion.1.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %broadcast_divide_fusion.1.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %broadcast_divide_fusion.1.clone.loop_header.dim.1.preheader, !llvm.loop !21

return:                                           ; preds = %broadcast_divide_fusion.1.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 19}
!1 = !{}
!2 = !{i64 67108864}
!3 = !{i64 64}
!4 = !{i64 4096}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:1073741824, size:67108864}", !7}
!7 = !{!"XLA host kernel add_add_fusion.8.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = !{i64 536870912}
!15 = !{i64 1048576}
!16 = !{!17}
!17 = !{!"result slice: {index:148, offset:0, size:536870912}", !18}
!18 = !{!"XLA host kernel broadcast_divide_fusion.1.clone AA domain"}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
!21 = distinct !{!21, !12}
