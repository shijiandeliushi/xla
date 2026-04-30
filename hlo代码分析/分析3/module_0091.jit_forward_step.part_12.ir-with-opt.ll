; ModuleID = '__compute_module_part_12'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@transpose_copy_fusion.3.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @transpose_copy_fusion.12.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %transpose_copy_fusion.12.clone.loop_header.dim.1.preheader, label %return

transpose_copy_fusion.12.clone.loop_header.dim.1.preheader: ; preds = %1, %transpose_copy_fusion.12.clone.loop_exit.dim.1
  %transpose_copy_fusion.12.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %transpose_copy_fusion.12.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = shl nuw nsw i64 %transpose_copy_fusion.12.clone.invar_address.dim.0.05, 9
  br label %transpose_copy_fusion.12.clone.loop_header.dim.2.preheader

transpose_copy_fusion.12.clone.loop_header.dim.2.preheader: ; preds = %transpose_copy_fusion.12.clone.loop_header.dim.1.preheader, %transpose_copy_fusion.12.clone.loop_exit.dim.2
  %transpose_copy_fusion.12.clone.invar_address.dim.1.03 = phi i64 [ 0, %transpose_copy_fusion.12.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %transpose_copy_fusion.12.clone.loop_exit.dim.2 ]
  %3 = shl nuw nsw i64 %transpose_copy_fusion.12.clone.invar_address.dim.1.03, 6
  %4 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %3
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %wide.load10 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !5
  %6 = or disjoint i64 %3, 16
  %7 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %6
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 32
  %wide.load10.1 = load <8 x float>, ptr %7, align 64, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %8, align 32, !invariant.load !1, !noalias !5
  %9 = or disjoint i64 %3, 32
  %10 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %9
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %wide.load10.2 = load <8 x float>, ptr %10, align 64, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %11, align 32, !invariant.load !1, !noalias !5
  %12 = or disjoint i64 %3, 48
  %13 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %12
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 32
  %wide.load10.3 = load <8 x float>, ptr %13, align 64, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %14, align 32, !invariant.load !1, !noalias !5
  br label %transpose_copy_fusion.12.clone.loop_header.dim.3.preheader

transpose_copy_fusion.12.clone.loop_header.dim.3.preheader: ; preds = %transpose_copy_fusion.12.clone.loop_header.dim.2.preheader, %transpose_copy_fusion.12.clone.loop_header.dim.3.preheader
  %transpose_copy_fusion.12.clone.invar_address.dim.2.02 = phi i64 [ 0, %transpose_copy_fusion.12.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %transpose_copy_fusion.12.clone.loop_header.dim.3.preheader ]
  %15 = add nuw nsw i64 %transpose_copy_fusion.12.clone.invar_address.dim.2.02, %2
  %16 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %3
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %wide.load = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !5
  %18 = fadd <8 x float> %wide.load, %wide.load10
  %19 = fadd <8 x float> %wide.load9, %wide.load11
  %20 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.12.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.12.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.12.clone.invar_address.dim.2.02, i64 0
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 32
  store <8 x float> %18, ptr %20, align 64, !alias.scope !5
  store <8 x float> %19, ptr %21, align 32, !alias.scope !5
  %22 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %6
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %wide.load.1 = load <8 x float>, ptr %22, align 64, !invariant.load !1, !noalias !5
  %wide.load9.1 = load <8 x float>, ptr %23, align 32, !invariant.load !1, !noalias !5
  %24 = fadd <8 x float> %wide.load.1, %wide.load10.1
  %25 = fadd <8 x float> %wide.load9.1, %wide.load11.1
  %26 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.12.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.12.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.12.clone.invar_address.dim.2.02, i64 16
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  store <8 x float> %24, ptr %26, align 64, !alias.scope !5
  store <8 x float> %25, ptr %27, align 32, !alias.scope !5
  %28 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %9
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 32
  %wide.load.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !5
  %wide.load9.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !5
  %30 = fadd <8 x float> %wide.load.2, %wide.load10.2
  %31 = fadd <8 x float> %wide.load9.2, %wide.load11.2
  %32 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.12.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.12.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.12.clone.invar_address.dim.2.02, i64 32
  %33 = getelementptr inbounds nuw i8, ptr %32, i64 32
  store <8 x float> %30, ptr %32, align 64, !alias.scope !5
  store <8 x float> %31, ptr %33, align 32, !alias.scope !5
  %34 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %12
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %wide.load.3 = load <8 x float>, ptr %34, align 64, !invariant.load !1, !noalias !5
  %wide.load9.3 = load <8 x float>, ptr %35, align 32, !invariant.load !1, !noalias !5
  %36 = fadd <8 x float> %wide.load.3, %wide.load10.3
  %37 = fadd <8 x float> %wide.load9.3, %wide.load11.3
  %38 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.12.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.12.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.12.clone.invar_address.dim.2.02, i64 48
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  store <8 x float> %36, ptr %38, align 64, !alias.scope !5
  store <8 x float> %37, ptr %39, align 32, !alias.scope !5
  %invar.inc6 = add nuw nsw i64 %transpose_copy_fusion.12.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond6, label %transpose_copy_fusion.12.clone.loop_exit.dim.2, label %transpose_copy_fusion.12.clone.loop_header.dim.3.preheader, !llvm.loop !8

transpose_copy_fusion.12.clone.loop_exit.dim.2:   ; preds = %transpose_copy_fusion.12.clone.loop_header.dim.3.preheader
  %invar.inc5 = add nuw nsw i64 %transpose_copy_fusion.12.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %transpose_copy_fusion.12.clone.loop_exit.dim.1, label %transpose_copy_fusion.12.clone.loop_header.dim.2.preheader, !llvm.loop !10

transpose_copy_fusion.12.clone.loop_exit.dim.1:   ; preds = %transpose_copy_fusion.12.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %transpose_copy_fusion.12.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %transpose_copy_fusion.12.clone.loop_header.dim.1.preheader, !llvm.loop !11

return:                                           ; preds = %transpose_copy_fusion.12.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @transpose_copy_fusion.3.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %transpose_copy_fusion.3.clone.loop_header.dim.1.preheader, label %return

transpose_copy_fusion.3.clone.loop_header.dim.1.preheader: ; preds = %1, %transpose_copy_fusion.3.clone.loop_exit.dim.1
  %transpose_copy_fusion.3.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %transpose_copy_fusion.3.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = shl nuw nsw i64 %transpose_copy_fusion.3.clone.invar_address.dim.0.05, 9
  br label %transpose_copy_fusion.3.clone.loop_header.dim.2.preheader

transpose_copy_fusion.3.clone.loop_header.dim.2.preheader: ; preds = %transpose_copy_fusion.3.clone.loop_header.dim.1.preheader, %transpose_copy_fusion.3.clone.loop_exit.dim.2
  %transpose_copy_fusion.3.clone.invar_address.dim.1.03 = phi i64 [ 0, %transpose_copy_fusion.3.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %transpose_copy_fusion.3.clone.loop_exit.dim.2 ]
  %3 = shl nuw nsw i64 %transpose_copy_fusion.3.clone.invar_address.dim.1.03, 6
  %4 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %3
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %wide.load10 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !12
  %wide.load11 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !12
  %6 = or disjoint i64 %3, 16
  %7 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %6
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 32
  %wide.load10.1 = load <8 x float>, ptr %7, align 64, !invariant.load !1, !noalias !12
  %wide.load11.1 = load <8 x float>, ptr %8, align 32, !invariant.load !1, !noalias !12
  %9 = or disjoint i64 %3, 32
  %10 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %9
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %wide.load10.2 = load <8 x float>, ptr %10, align 64, !invariant.load !1, !noalias !12
  %wide.load11.2 = load <8 x float>, ptr %11, align 32, !invariant.load !1, !noalias !12
  %12 = or disjoint i64 %3, 48
  %13 = getelementptr inbounds nuw [1024 x float], ptr %arg0, i64 0, i64 %12
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 32
  %wide.load10.3 = load <8 x float>, ptr %13, align 64, !invariant.load !1, !noalias !12
  %wide.load11.3 = load <8 x float>, ptr %14, align 32, !invariant.load !1, !noalias !12
  br label %transpose_copy_fusion.3.clone.loop_header.dim.3.preheader

transpose_copy_fusion.3.clone.loop_header.dim.3.preheader: ; preds = %transpose_copy_fusion.3.clone.loop_header.dim.2.preheader, %transpose_copy_fusion.3.clone.loop_header.dim.3.preheader
  %transpose_copy_fusion.3.clone.invar_address.dim.2.02 = phi i64 [ 0, %transpose_copy_fusion.3.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %transpose_copy_fusion.3.clone.loop_header.dim.3.preheader ]
  %15 = add nuw nsw i64 %transpose_copy_fusion.3.clone.invar_address.dim.2.02, %2
  %16 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %3
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %wide.load = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !12
  %wide.load9 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !12
  %18 = fadd <8 x float> %wide.load, %wide.load10
  %19 = fadd <8 x float> %wide.load9, %wide.load11
  %20 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.3.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.3.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.3.clone.invar_address.dim.2.02, i64 0
  %21 = getelementptr inbounds nuw i8, ptr %20, i64 32
  store <8 x float> %18, ptr %20, align 64, !alias.scope !12
  store <8 x float> %19, ptr %21, align 32, !alias.scope !12
  %22 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %6
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %wide.load.1 = load <8 x float>, ptr %22, align 64, !invariant.load !1, !noalias !12
  %wide.load9.1 = load <8 x float>, ptr %23, align 32, !invariant.load !1, !noalias !12
  %24 = fadd <8 x float> %wide.load.1, %wide.load10.1
  %25 = fadd <8 x float> %wide.load9.1, %wide.load11.1
  %26 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.3.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.3.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.3.clone.invar_address.dim.2.02, i64 16
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  store <8 x float> %24, ptr %26, align 64, !alias.scope !12
  store <8 x float> %25, ptr %27, align 32, !alias.scope !12
  %28 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %9
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 32
  %wide.load.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !12
  %wide.load9.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !12
  %30 = fadd <8 x float> %wide.load.2, %wide.load10.2
  %31 = fadd <8 x float> %wide.load9.2, %wide.load11.2
  %32 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.3.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.3.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.3.clone.invar_address.dim.2.02, i64 32
  %33 = getelementptr inbounds nuw i8, ptr %32, i64 32
  store <8 x float> %30, ptr %32, align 64, !alias.scope !12
  store <8 x float> %31, ptr %33, align 32, !alias.scope !12
  %34 = getelementptr inbounds nuw [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %15, i64 %12
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %wide.load.3 = load <8 x float>, ptr %34, align 64, !invariant.load !1, !noalias !12
  %wide.load9.3 = load <8 x float>, ptr %35, align 32, !invariant.load !1, !noalias !12
  %36 = fadd <8 x float> %wide.load.3, %wide.load10.3
  %37 = fadd <8 x float> %wide.load9.3, %wide.load11.3
  %38 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg2, i64 0, i64 %transpose_copy_fusion.3.clone.invar_address.dim.0.05, i64 %transpose_copy_fusion.3.clone.invar_address.dim.1.03, i64 %transpose_copy_fusion.3.clone.invar_address.dim.2.02, i64 48
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  store <8 x float> %36, ptr %38, align 64, !alias.scope !12
  store <8 x float> %37, ptr %39, align 32, !alias.scope !12
  %invar.inc6 = add nuw nsw i64 %transpose_copy_fusion.3.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond6, label %transpose_copy_fusion.3.clone.loop_exit.dim.2, label %transpose_copy_fusion.3.clone.loop_header.dim.3.preheader, !llvm.loop !15

transpose_copy_fusion.3.clone.loop_exit.dim.2:    ; preds = %transpose_copy_fusion.3.clone.loop_header.dim.3.preheader
  %invar.inc5 = add nuw nsw i64 %transpose_copy_fusion.3.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %transpose_copy_fusion.3.clone.loop_exit.dim.1, label %transpose_copy_fusion.3.clone.loop_header.dim.2.preheader, !llvm.loop !16

transpose_copy_fusion.3.clone.loop_exit.dim.1:    ; preds = %transpose_copy_fusion.3.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %transpose_copy_fusion.3.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %transpose_copy_fusion.3.clone.loop_header.dim.1.preheader, !llvm.loop !17

return:                                           ; preds = %transpose_copy_fusion.3.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 12}
!1 = !{}
!2 = !{i64 4096}
!3 = !{i64 64}
!4 = !{i64 67108864}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:1140850688, size:67108864}", !7}
!7 = !{!"XLA host kernel transpose_copy_fusion.12.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
!12 = !{!13}
!13 = !{!"result slice: {index:148, offset:1140850688, size:67108864}", !14}
!14 = !{!"XLA host kernel transpose_copy_fusion.3.clone AA domain"}
!15 = distinct !{!15, !9}
!16 = distinct !{!16, !9}
!17 = distinct !{!17, !9}
