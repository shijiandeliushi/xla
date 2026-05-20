; ModuleID = '__compute_module_part_01'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@add_add_fusion.2.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @transpose_copy_fusion.16.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @add_add_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @add_add_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %transpose_copy_fusion.16.clone.loop_header.dim.1.preheader, label %return

transpose_copy_fusion.16.clone.loop_header.dim.1.preheader: ; preds = %1, %transpose_copy_fusion.16.clone.loop_exit.dim.1
  %transpose_copy_fusion.16.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %transpose_copy_fusion.16.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = shl nuw nsw i64 %transpose_copy_fusion.16.clone.invar_address.dim.0.05, 9
  br label %transpose_copy_fusion.16.clone.loop_header.dim.2.preheader

transpose_copy_fusion.16.clone.loop_header.dim.2.preheader: ; preds = %transpose_copy_fusion.16.clone.loop_header.dim.1.preheader, %transpose_copy_fusion.16.clone.loop_exit.dim.2
  %transpose_copy_fusion.16.clone.invar_address.dim.1.03 = phi i64 [ 0, %transpose_copy_fusion.16.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %transpose_copy_fusion.16.clone.loop_exit.dim.2 ]
  %3 = shl nuw nsw i64 %transpose_copy_fusion.16.clone.invar_address.dim.1.03, 6
  br label %transpose_copy_fusion.16.clone.loop_header.dim.3.preheader

transpose_copy_fusion.16.clone.loop_header.dim.3.preheader: ; preds = %transpose_copy_fusion.16.clone.loop_header.dim.2.preheader, %transpose_copy_fusion.16.clone.loop_exit.dim.3
  %transpose_copy_fusion.16.clone.invar_address.dim.2.02 = phi i64 [ 0, %transpose_copy_fusion.16.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %transpose_copy_fusion.16.clone.loop_exit.dim.3 ]
  %4 = add nuw nsw i64 %transpose_copy_fusion.16.clone.invar_address.dim.2.02, %3
  %5 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %4
  %6 = load float, ptr %5, align 4, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %6, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %transpose_copy_fusion.16.clone.loop_header.dim.3.preheader
  %index = phi i64 [ 0, %transpose_copy_fusion.16.clone.loop_header.dim.3.preheader ], [ %index.next, %vector.body ]
  %7 = or disjoint i64 %index, 1
  %8 = or disjoint i64 %index, 2
  %9 = or disjoint i64 %index, 3
  %10 = or disjoint i64 %index, 4
  %11 = or disjoint i64 %index, 5
  %12 = or disjoint i64 %index, 6
  %13 = or disjoint i64 %index, 7
  %14 = add nuw nsw i64 %index, %2
  %15 = add nuw nsw i64 %7, %2
  %16 = add nuw nsw i64 %8, %2
  %17 = add nuw nsw i64 %9, %2
  %18 = add nuw nsw i64 %10, %2
  %19 = add nuw nsw i64 %11, %2
  %20 = add nuw nsw i64 %12, %2
  %21 = add nuw nsw i64 %13, %2
  %22 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %14, i64 %4
  %23 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %4
  %24 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %16, i64 %4
  %25 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %17, i64 %4
  %26 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %18, i64 %4
  %27 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %19, i64 %4
  %28 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %20, i64 %4
  %29 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %21, i64 %4
  %30 = load float, ptr %22, align 4, !invariant.load !1, !noalias !5
  %31 = load float, ptr %23, align 4, !invariant.load !1, !noalias !5
  %32 = load float, ptr %24, align 4, !invariant.load !1, !noalias !5
  %33 = load float, ptr %25, align 4, !invariant.load !1, !noalias !5
  %34 = load float, ptr %26, align 4, !invariant.load !1, !noalias !5
  %35 = load float, ptr %27, align 4, !invariant.load !1, !noalias !5
  %36 = load float, ptr %28, align 4, !invariant.load !1, !noalias !5
  %37 = load float, ptr %29, align 4, !invariant.load !1, !noalias !5
  %38 = insertelement <8 x float> poison, float %30, i64 0
  %39 = insertelement <8 x float> %38, float %31, i64 1
  %40 = insertelement <8 x float> %39, float %32, i64 2
  %41 = insertelement <8 x float> %40, float %33, i64 3
  %42 = insertelement <8 x float> %41, float %34, i64 4
  %43 = insertelement <8 x float> %42, float %35, i64 5
  %44 = insertelement <8 x float> %43, float %36, i64 6
  %45 = insertelement <8 x float> %44, float %37, i64 7
  %46 = fadd <8 x float> %45, %broadcast.splat
  %47 = getelementptr inbounds [32 x [16 x [64 x [512 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.16.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.16.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.16.clone.invar_address.dim.2.02, i64 %index
  store <8 x float> %46, ptr %47, align 32, !alias.scope !5
  %index.next = add nuw i64 %index, 8
  %48 = icmp eq i64 %index.next, 512
  br i1 %48, label %transpose_copy_fusion.16.clone.loop_exit.dim.3, label %vector.body, !llvm.loop !8

transpose_copy_fusion.16.clone.loop_exit.dim.3:   ; preds = %vector.body
  %invar.inc6 = add nuw nsw i64 %transpose_copy_fusion.16.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 64
  br i1 %exitcond6, label %transpose_copy_fusion.16.clone.loop_exit.dim.2, label %transpose_copy_fusion.16.clone.loop_header.dim.3.preheader, !llvm.loop !11

transpose_copy_fusion.16.clone.loop_exit.dim.2:   ; preds = %transpose_copy_fusion.16.clone.loop_exit.dim.3
  %invar.inc5 = add nuw nsw i64 %transpose_copy_fusion.16.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %transpose_copy_fusion.16.clone.loop_exit.dim.1, label %transpose_copy_fusion.16.clone.loop_header.dim.2.preheader, !llvm.loop !13

transpose_copy_fusion.16.clone.loop_exit.dim.1:   ; preds = %transpose_copy_fusion.16.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %transpose_copy_fusion.16.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %transpose_copy_fusion.16.clone.loop_header.dim.1.preheader, !llvm.loop !14

return:                                           ; preds = %transpose_copy_fusion.16.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @add_add_fusion.2.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg3_gep = getelementptr i8, ptr %args, i64 48
  %arg3 = load ptr, ptr %arg3_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @add_add_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @add_add_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not3 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not3, label %add_add_fusion.2.clone.loop_header.dim.1.preheader, label %return

add_add_fusion.2.clone.loop_header.dim.1.preheader: ; preds = %1, %add_add_fusion.2.clone.loop_exit.dim.1
  %add_add_fusion.2.clone.invar_address.dim.0.04 = phi i64 [ %invar.inc, %add_add_fusion.2.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = shl nuw nsw i64 %add_add_fusion.2.clone.invar_address.dim.0.04, 9
  br label %add_add_fusion.2.clone.loop_header.dim.2.preheader

add_add_fusion.2.clone.loop_header.dim.2.preheader: ; preds = %add_add_fusion.2.clone.loop_header.dim.1.preheader, %add_add_fusion.2.clone.loop_exit.dim.2
  %add_add_fusion.2.clone.invar_address.dim.1.02 = phi i64 [ 0, %add_add_fusion.2.clone.loop_header.dim.1.preheader ], [ %invar.inc7, %add_add_fusion.2.clone.loop_exit.dim.2 ]
  %3 = add nuw nsw i64 %add_add_fusion.2.clone.invar_address.dim.1.02, %2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %add_add_fusion.2.clone.loop_header.dim.2.preheader
  %index = phi i64 [ 0, %add_add_fusion.2.clone.loop_header.dim.2.preheader ], [ %index.next.3, %vector.body ]
  %4 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %wide.load = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !15
  %wide.load7 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !15
  %6 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %wide.load8 = load <8 x float>, ptr %6, align 64, !invariant.load !1, !noalias !15
  %wide.load9 = load <8 x float>, ptr %7, align 32, !invariant.load !1, !noalias !15
  %8 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index
  %9 = getelementptr inbounds nuw i8, ptr %8, i64 32
  %wide.load10 = load <8 x float>, ptr %8, align 64, !invariant.load !1, !noalias !15
  %wide.load11 = load <8 x float>, ptr %9, align 32, !invariant.load !1, !noalias !15
  %10 = fadd <8 x float> %wide.load8, %wide.load10
  %11 = fadd <8 x float> %wide.load9, %wide.load11
  %12 = fadd <8 x float> %wide.load, %10
  %13 = fadd <8 x float> %wide.load7, %11
  %14 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  store <8 x float> %12, ptr %14, align 64, !alias.scope !15
  store <8 x float> %13, ptr %15, align 32, !alias.scope !15
  %index.next = or disjoint i64 %index, 16
  %16 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index.next
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %wide.load.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !15
  %wide.load7.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !15
  %18 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index.next
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %wide.load8.1 = load <8 x float>, ptr %18, align 64, !invariant.load !1, !noalias !15
  %wide.load9.1 = load <8 x float>, ptr %19, align 32, !invariant.load !1, !noalias !15
  %20 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index.next
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 32
  %wide.load10.1 = load <8 x float>, ptr %20, align 64, !invariant.load !1, !noalias !15
  %wide.load11.1 = load <8 x float>, ptr %21, align 32, !invariant.load !1, !noalias !15
  %22 = fadd <8 x float> %wide.load8.1, %wide.load10.1
  %23 = fadd <8 x float> %wide.load9.1, %wide.load11.1
  %24 = fadd <8 x float> %wide.load.1, %22
  %25 = fadd <8 x float> %wide.load7.1, %23
  %26 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index.next
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  store <8 x float> %24, ptr %26, align 64, !alias.scope !15
  store <8 x float> %25, ptr %27, align 32, !alias.scope !15
  %index.next.1 = or disjoint i64 %index, 32
  %28 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index.next.1
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 32
  %wide.load.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !15
  %wide.load7.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !15
  %30 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index.next.1
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %wide.load8.2 = load <8 x float>, ptr %30, align 64, !invariant.load !1, !noalias !15
  %wide.load9.2 = load <8 x float>, ptr %31, align 32, !invariant.load !1, !noalias !15
  %32 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index.next.1
  %33 = getelementptr inbounds nuw i8, ptr %32, i64 32
  %wide.load10.2 = load <8 x float>, ptr %32, align 64, !invariant.load !1, !noalias !15
  %wide.load11.2 = load <8 x float>, ptr %33, align 32, !invariant.load !1, !noalias !15
  %34 = fadd <8 x float> %wide.load8.2, %wide.load10.2
  %35 = fadd <8 x float> %wide.load9.2, %wide.load11.2
  %36 = fadd <8 x float> %wide.load.2, %34
  %37 = fadd <8 x float> %wide.load7.2, %35
  %38 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index.next.1
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  store <8 x float> %36, ptr %38, align 64, !alias.scope !15
  store <8 x float> %37, ptr %39, align 32, !alias.scope !15
  %index.next.2 = or disjoint i64 %index, 48
  %40 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index.next.2
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 32
  %wide.load.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !15
  %wide.load7.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !15
  %42 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg2, i64 0, i64 %3, i64 %index.next.2
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 32
  %wide.load8.3 = load <8 x float>, ptr %42, align 64, !invariant.load !1, !noalias !15
  %wide.load9.3 = load <8 x float>, ptr %43, align 32, !invariant.load !1, !noalias !15
  %44 = getelementptr inbounds nuw [1024 x float], ptr %arg1, i64 0, i64 %index.next.2
  %45 = getelementptr inbounds nuw i8, ptr %44, i64 32
  %wide.load10.3 = load <8 x float>, ptr %44, align 64, !invariant.load !1, !noalias !15
  %wide.load11.3 = load <8 x float>, ptr %45, align 32, !invariant.load !1, !noalias !15
  %46 = fadd <8 x float> %wide.load8.3, %wide.load10.3
  %47 = fadd <8 x float> %wide.load9.3, %wide.load11.3
  %48 = fadd <8 x float> %wide.load.3, %46
  %49 = fadd <8 x float> %wide.load7.3, %47
  %50 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.2.clone.invar_address.dim.0.04, i64 %add_add_fusion.2.clone.invar_address.dim.1.02, i64 %index.next.2
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  store <8 x float> %48, ptr %50, align 64, !alias.scope !15
  store <8 x float> %49, ptr %51, align 32, !alias.scope !15
  %index.next.3 = add nuw nsw i64 %index, 64
  %52 = icmp eq i64 %index.next.3, 1024
  br i1 %52, label %add_add_fusion.2.clone.loop_exit.dim.2, label %vector.body, !llvm.loop !18

add_add_fusion.2.clone.loop_exit.dim.2:           ; preds = %vector.body
  %invar.inc7 = add nuw nsw i64 %add_add_fusion.2.clone.invar_address.dim.1.02, 1
  %exitcond5 = icmp eq i64 %invar.inc7, 512
  br i1 %exitcond5, label %add_add_fusion.2.clone.loop_exit.dim.1, label %add_add_fusion.2.clone.loop_header.dim.2.preheader, !llvm.loop !19

add_add_fusion.2.clone.loop_exit.dim.1:           ; preds = %add_add_fusion.2.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %add_add_fusion.2.clone.invar_address.dim.0.04, 1
  %exitcond6.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond6.not, label %return, label %add_add_fusion.2.clone.loop_header.dim.1.preheader, !llvm.loop !20

return:                                           ; preds = %add_add_fusion.2.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 1}
!1 = !{}
!2 = !{i64 4096}
!3 = !{i64 64}
!4 = !{i64 67108864}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:67108864}", !7}
!7 = !{!"XLA host kernel transpose_copy_fusion.16.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = !{!16}
!16 = !{!"result slice: {index:148, offset:1073741824, size:67108864}", !17}
!17 = !{!"XLA host kernel add_add_fusion.2.clone AA domain"}
!18 = distinct !{!18, !9, !10}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
