; ModuleID = '__compute_module_part_17'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_multiply_fusion.1.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @add_add_fusion.9.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not3 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not3, label %add_add_fusion.9.clone.loop_header.dim.1.preheader, label %return

add_add_fusion.9.clone.loop_header.dim.1.preheader: ; preds = %1, %add_add_fusion.9.clone.loop_exit.dim.1
  %add_add_fusion.9.clone.invar_address.dim.0.04 = phi i64 [ %invar.inc, %add_add_fusion.9.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = shl nuw nsw i64 %add_add_fusion.9.clone.invar_address.dim.0.04, 9
  br label %add_add_fusion.9.clone.loop_header.dim.2.preheader

add_add_fusion.9.clone.loop_header.dim.2.preheader: ; preds = %add_add_fusion.9.clone.loop_header.dim.1.preheader, %add_add_fusion.9.clone.loop_exit.dim.2
  %add_add_fusion.9.clone.invar_address.dim.1.02 = phi i64 [ 0, %add_add_fusion.9.clone.loop_header.dim.1.preheader ], [ %invar.inc7, %add_add_fusion.9.clone.loop_exit.dim.2 ]
  %3 = add nuw nsw i64 %add_add_fusion.9.clone.invar_address.dim.1.02, %2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %add_add_fusion.9.clone.loop_header.dim.2.preheader
  %index = phi i64 [ 0, %add_add_fusion.9.clone.loop_header.dim.2.preheader ], [ %index.next.3, %vector.body ]
  %4 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index
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
  %14 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  store <8 x float> %12, ptr %14, align 64, !alias.scope !5
  store <8 x float> %13, ptr %15, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 16
  %16 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index.next
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
  %26 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index.next
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  store <8 x float> %24, ptr %26, align 64, !alias.scope !5
  store <8 x float> %25, ptr %27, align 32, !alias.scope !5
  %index.next.1 = or disjoint i64 %index, 32
  %28 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index.next.1
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
  %38 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index.next.1
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  store <8 x float> %36, ptr %38, align 64, !alias.scope !5
  store <8 x float> %37, ptr %39, align 32, !alias.scope !5
  %index.next.2 = or disjoint i64 %index, 48
  %40 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg0, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index.next.2
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
  %50 = getelementptr inbounds [32 x [512 x [1024 x float]]], ptr %arg3, i64 0, i64 %add_add_fusion.9.clone.invar_address.dim.0.04, i64 %add_add_fusion.9.clone.invar_address.dim.1.02, i64 %index.next.2
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  store <8 x float> %48, ptr %50, align 64, !alias.scope !5
  store <8 x float> %49, ptr %51, align 32, !alias.scope !5
  %index.next.3 = add nuw nsw i64 %index, 64
  %52 = icmp eq i64 %index.next.3, 1024
  br i1 %52, label %add_add_fusion.9.clone.loop_exit.dim.2, label %vector.body, !llvm.loop !8

add_add_fusion.9.clone.loop_exit.dim.2:           ; preds = %vector.body
  %invar.inc7 = add nuw nsw i64 %add_add_fusion.9.clone.invar_address.dim.1.02, 1
  %exitcond5 = icmp eq i64 %invar.inc7, 512
  br i1 %exitcond5, label %add_add_fusion.9.clone.loop_exit.dim.1, label %add_add_fusion.9.clone.loop_header.dim.2.preheader, !llvm.loop !11

add_add_fusion.9.clone.loop_exit.dim.1:           ; preds = %add_add_fusion.9.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %add_add_fusion.9.clone.invar_address.dim.0.04, 1
  %exitcond6.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond6.not, label %return, label %add_add_fusion.9.clone.loop_header.dim.1.preheader, !llvm.loop !13

return:                                           ; preds = %add_add_fusion.9.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_multiply_fusion.1.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !14, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !14, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.1.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %broadcast_multiply_fusion.1.clone.loop_header.dim.1.preheader, label %return

broadcast_multiply_fusion.1.clone.loop_header.dim.1.preheader: ; preds = %1, %broadcast_multiply_fusion.1.clone.loop_exit.dim.1
  %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %broadcast_multiply_fusion.1.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %broadcast_multiply_fusion.1.clone.loop_header.dim.2.preheader

broadcast_multiply_fusion.1.clone.loop_header.dim.2.preheader: ; preds = %broadcast_multiply_fusion.1.clone.loop_header.dim.1.preheader, %broadcast_multiply_fusion.1.clone.loop_exit.dim.2
  %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03 = phi i64 [ 0, %broadcast_multiply_fusion.1.clone.loop_header.dim.1.preheader ], [ %invar.inc3, %broadcast_multiply_fusion.1.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_multiply_fusion.1.clone.loop_header.dim.2.preheader
  %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02 = phi i64 [ 0, %broadcast_multiply_fusion.1.clone.loop_header.dim.2.preheader ], [ %invar.inc4, %vector.ph ]
  %2 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 0
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !15
  %wide.load9 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !15
  %wide.load10 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !15
  %wide.load11 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !15
  %6 = fmul <8 x float> %wide.load, splat (float 1.250000e-01)
  %7 = fmul <8 x float> %wide.load9, splat (float 1.250000e-01)
  %8 = fmul <8 x float> %wide.load10, splat (float 1.250000e-01)
  %9 = fmul <8 x float> %wide.load11, splat (float 1.250000e-01)
  %10 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 0
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x float> %6, ptr %10, align 64, !alias.scope !15
  store <8 x float> %7, ptr %11, align 32, !alias.scope !15
  store <8 x float> %8, ptr %12, align 64, !alias.scope !15
  store <8 x float> %9, ptr %13, align 32, !alias.scope !15
  %14 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 32
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  %wide.load.1 = load <8 x float>, ptr %14, align 64, !invariant.load !1, !noalias !15
  %wide.load9.1 = load <8 x float>, ptr %15, align 32, !invariant.load !1, !noalias !15
  %wide.load10.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !15
  %wide.load11.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !15
  %18 = fmul <8 x float> %wide.load.1, splat (float 1.250000e-01)
  %19 = fmul <8 x float> %wide.load9.1, splat (float 1.250000e-01)
  %20 = fmul <8 x float> %wide.load10.1, splat (float 1.250000e-01)
  %21 = fmul <8 x float> %wide.load11.1, splat (float 1.250000e-01)
  %22 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 32
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x float> %18, ptr %22, align 64, !alias.scope !15
  store <8 x float> %19, ptr %23, align 32, !alias.scope !15
  store <8 x float> %20, ptr %24, align 64, !alias.scope !15
  store <8 x float> %21, ptr %25, align 32, !alias.scope !15
  %26 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 64
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  %wide.load.2 = load <8 x float>, ptr %26, align 64, !invariant.load !1, !noalias !15
  %wide.load9.2 = load <8 x float>, ptr %27, align 32, !invariant.load !1, !noalias !15
  %wide.load10.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !15
  %wide.load11.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !15
  %30 = fmul <8 x float> %wide.load.2, splat (float 1.250000e-01)
  %31 = fmul <8 x float> %wide.load9.2, splat (float 1.250000e-01)
  %32 = fmul <8 x float> %wide.load10.2, splat (float 1.250000e-01)
  %33 = fmul <8 x float> %wide.load11.2, splat (float 1.250000e-01)
  %34 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 64
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  store <8 x float> %30, ptr %34, align 64, !alias.scope !15
  store <8 x float> %31, ptr %35, align 32, !alias.scope !15
  store <8 x float> %32, ptr %36, align 64, !alias.scope !15
  store <8 x float> %33, ptr %37, align 32, !alias.scope !15
  %38 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 96
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 64
  %41 = getelementptr inbounds nuw i8, ptr %38, i64 96
  %wide.load.3 = load <8 x float>, ptr %38, align 64, !invariant.load !1, !noalias !15
  %wide.load9.3 = load <8 x float>, ptr %39, align 32, !invariant.load !1, !noalias !15
  %wide.load10.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !15
  %wide.load11.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !15
  %42 = fmul <8 x float> %wide.load.3, splat (float 1.250000e-01)
  %43 = fmul <8 x float> %wide.load9.3, splat (float 1.250000e-01)
  %44 = fmul <8 x float> %wide.load10.3, splat (float 1.250000e-01)
  %45 = fmul <8 x float> %wide.load11.3, splat (float 1.250000e-01)
  %46 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 96
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x float> %42, ptr %46, align 64, !alias.scope !15
  store <8 x float> %43, ptr %47, align 32, !alias.scope !15
  store <8 x float> %44, ptr %48, align 64, !alias.scope !15
  store <8 x float> %45, ptr %49, align 32, !alias.scope !15
  %50 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 128
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 64
  %53 = getelementptr inbounds nuw i8, ptr %50, i64 96
  %wide.load.4 = load <8 x float>, ptr %50, align 64, !invariant.load !1, !noalias !15
  %wide.load9.4 = load <8 x float>, ptr %51, align 32, !invariant.load !1, !noalias !15
  %wide.load10.4 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !15
  %wide.load11.4 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !15
  %54 = fmul <8 x float> %wide.load.4, splat (float 1.250000e-01)
  %55 = fmul <8 x float> %wide.load9.4, splat (float 1.250000e-01)
  %56 = fmul <8 x float> %wide.load10.4, splat (float 1.250000e-01)
  %57 = fmul <8 x float> %wide.load11.4, splat (float 1.250000e-01)
  %58 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 128
  %59 = getelementptr inbounds nuw i8, ptr %58, i64 32
  %60 = getelementptr inbounds nuw i8, ptr %58, i64 64
  %61 = getelementptr inbounds nuw i8, ptr %58, i64 96
  store <8 x float> %54, ptr %58, align 64, !alias.scope !15
  store <8 x float> %55, ptr %59, align 32, !alias.scope !15
  store <8 x float> %56, ptr %60, align 64, !alias.scope !15
  store <8 x float> %57, ptr %61, align 32, !alias.scope !15
  %62 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 160
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 32
  %64 = getelementptr inbounds nuw i8, ptr %62, i64 64
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 96
  %wide.load.5 = load <8 x float>, ptr %62, align 64, !invariant.load !1, !noalias !15
  %wide.load9.5 = load <8 x float>, ptr %63, align 32, !invariant.load !1, !noalias !15
  %wide.load10.5 = load <8 x float>, ptr %64, align 64, !invariant.load !1, !noalias !15
  %wide.load11.5 = load <8 x float>, ptr %65, align 32, !invariant.load !1, !noalias !15
  %66 = fmul <8 x float> %wide.load.5, splat (float 1.250000e-01)
  %67 = fmul <8 x float> %wide.load9.5, splat (float 1.250000e-01)
  %68 = fmul <8 x float> %wide.load10.5, splat (float 1.250000e-01)
  %69 = fmul <8 x float> %wide.load11.5, splat (float 1.250000e-01)
  %70 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 160
  %71 = getelementptr inbounds nuw i8, ptr %70, i64 32
  %72 = getelementptr inbounds nuw i8, ptr %70, i64 64
  %73 = getelementptr inbounds nuw i8, ptr %70, i64 96
  store <8 x float> %66, ptr %70, align 64, !alias.scope !15
  store <8 x float> %67, ptr %71, align 32, !alias.scope !15
  store <8 x float> %68, ptr %72, align 64, !alias.scope !15
  store <8 x float> %69, ptr %73, align 32, !alias.scope !15
  %74 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 192
  %75 = getelementptr inbounds nuw i8, ptr %74, i64 32
  %76 = getelementptr inbounds nuw i8, ptr %74, i64 64
  %77 = getelementptr inbounds nuw i8, ptr %74, i64 96
  %wide.load.6 = load <8 x float>, ptr %74, align 64, !invariant.load !1, !noalias !15
  %wide.load9.6 = load <8 x float>, ptr %75, align 32, !invariant.load !1, !noalias !15
  %wide.load10.6 = load <8 x float>, ptr %76, align 64, !invariant.load !1, !noalias !15
  %wide.load11.6 = load <8 x float>, ptr %77, align 32, !invariant.load !1, !noalias !15
  %78 = fmul <8 x float> %wide.load.6, splat (float 1.250000e-01)
  %79 = fmul <8 x float> %wide.load9.6, splat (float 1.250000e-01)
  %80 = fmul <8 x float> %wide.load10.6, splat (float 1.250000e-01)
  %81 = fmul <8 x float> %wide.load11.6, splat (float 1.250000e-01)
  %82 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 192
  %83 = getelementptr inbounds nuw i8, ptr %82, i64 32
  %84 = getelementptr inbounds nuw i8, ptr %82, i64 64
  %85 = getelementptr inbounds nuw i8, ptr %82, i64 96
  store <8 x float> %78, ptr %82, align 64, !alias.scope !15
  store <8 x float> %79, ptr %83, align 32, !alias.scope !15
  store <8 x float> %80, ptr %84, align 64, !alias.scope !15
  store <8 x float> %81, ptr %85, align 32, !alias.scope !15
  %86 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 224
  %87 = getelementptr inbounds nuw i8, ptr %86, i64 32
  %88 = getelementptr inbounds nuw i8, ptr %86, i64 64
  %89 = getelementptr inbounds nuw i8, ptr %86, i64 96
  %wide.load.7 = load <8 x float>, ptr %86, align 64, !invariant.load !1, !noalias !15
  %wide.load9.7 = load <8 x float>, ptr %87, align 32, !invariant.load !1, !noalias !15
  %wide.load10.7 = load <8 x float>, ptr %88, align 64, !invariant.load !1, !noalias !15
  %wide.load11.7 = load <8 x float>, ptr %89, align 32, !invariant.load !1, !noalias !15
  %90 = fmul <8 x float> %wide.load.7, splat (float 1.250000e-01)
  %91 = fmul <8 x float> %wide.load9.7, splat (float 1.250000e-01)
  %92 = fmul <8 x float> %wide.load10.7, splat (float 1.250000e-01)
  %93 = fmul <8 x float> %wide.load11.7, splat (float 1.250000e-01)
  %94 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 224
  %95 = getelementptr inbounds nuw i8, ptr %94, i64 32
  %96 = getelementptr inbounds nuw i8, ptr %94, i64 64
  %97 = getelementptr inbounds nuw i8, ptr %94, i64 96
  store <8 x float> %90, ptr %94, align 64, !alias.scope !15
  store <8 x float> %91, ptr %95, align 32, !alias.scope !15
  store <8 x float> %92, ptr %96, align 64, !alias.scope !15
  store <8 x float> %93, ptr %97, align 32, !alias.scope !15
  %98 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 256
  %99 = getelementptr inbounds nuw i8, ptr %98, i64 32
  %100 = getelementptr inbounds nuw i8, ptr %98, i64 64
  %101 = getelementptr inbounds nuw i8, ptr %98, i64 96
  %wide.load.8 = load <8 x float>, ptr %98, align 64, !invariant.load !1, !noalias !15
  %wide.load9.8 = load <8 x float>, ptr %99, align 32, !invariant.load !1, !noalias !15
  %wide.load10.8 = load <8 x float>, ptr %100, align 64, !invariant.load !1, !noalias !15
  %wide.load11.8 = load <8 x float>, ptr %101, align 32, !invariant.load !1, !noalias !15
  %102 = fmul <8 x float> %wide.load.8, splat (float 1.250000e-01)
  %103 = fmul <8 x float> %wide.load9.8, splat (float 1.250000e-01)
  %104 = fmul <8 x float> %wide.load10.8, splat (float 1.250000e-01)
  %105 = fmul <8 x float> %wide.load11.8, splat (float 1.250000e-01)
  %106 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 256
  %107 = getelementptr inbounds nuw i8, ptr %106, i64 32
  %108 = getelementptr inbounds nuw i8, ptr %106, i64 64
  %109 = getelementptr inbounds nuw i8, ptr %106, i64 96
  store <8 x float> %102, ptr %106, align 64, !alias.scope !15
  store <8 x float> %103, ptr %107, align 32, !alias.scope !15
  store <8 x float> %104, ptr %108, align 64, !alias.scope !15
  store <8 x float> %105, ptr %109, align 32, !alias.scope !15
  %110 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 288
  %111 = getelementptr inbounds nuw i8, ptr %110, i64 32
  %112 = getelementptr inbounds nuw i8, ptr %110, i64 64
  %113 = getelementptr inbounds nuw i8, ptr %110, i64 96
  %wide.load.9 = load <8 x float>, ptr %110, align 64, !invariant.load !1, !noalias !15
  %wide.load9.9 = load <8 x float>, ptr %111, align 32, !invariant.load !1, !noalias !15
  %wide.load10.9 = load <8 x float>, ptr %112, align 64, !invariant.load !1, !noalias !15
  %wide.load11.9 = load <8 x float>, ptr %113, align 32, !invariant.load !1, !noalias !15
  %114 = fmul <8 x float> %wide.load.9, splat (float 1.250000e-01)
  %115 = fmul <8 x float> %wide.load9.9, splat (float 1.250000e-01)
  %116 = fmul <8 x float> %wide.load10.9, splat (float 1.250000e-01)
  %117 = fmul <8 x float> %wide.load11.9, splat (float 1.250000e-01)
  %118 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 288
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 32
  %120 = getelementptr inbounds nuw i8, ptr %118, i64 64
  %121 = getelementptr inbounds nuw i8, ptr %118, i64 96
  store <8 x float> %114, ptr %118, align 64, !alias.scope !15
  store <8 x float> %115, ptr %119, align 32, !alias.scope !15
  store <8 x float> %116, ptr %120, align 64, !alias.scope !15
  store <8 x float> %117, ptr %121, align 32, !alias.scope !15
  %122 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 320
  %123 = getelementptr inbounds nuw i8, ptr %122, i64 32
  %124 = getelementptr inbounds nuw i8, ptr %122, i64 64
  %125 = getelementptr inbounds nuw i8, ptr %122, i64 96
  %wide.load.10 = load <8 x float>, ptr %122, align 64, !invariant.load !1, !noalias !15
  %wide.load9.10 = load <8 x float>, ptr %123, align 32, !invariant.load !1, !noalias !15
  %wide.load10.10 = load <8 x float>, ptr %124, align 64, !invariant.load !1, !noalias !15
  %wide.load11.10 = load <8 x float>, ptr %125, align 32, !invariant.load !1, !noalias !15
  %126 = fmul <8 x float> %wide.load.10, splat (float 1.250000e-01)
  %127 = fmul <8 x float> %wide.load9.10, splat (float 1.250000e-01)
  %128 = fmul <8 x float> %wide.load10.10, splat (float 1.250000e-01)
  %129 = fmul <8 x float> %wide.load11.10, splat (float 1.250000e-01)
  %130 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 320
  %131 = getelementptr inbounds nuw i8, ptr %130, i64 32
  %132 = getelementptr inbounds nuw i8, ptr %130, i64 64
  %133 = getelementptr inbounds nuw i8, ptr %130, i64 96
  store <8 x float> %126, ptr %130, align 64, !alias.scope !15
  store <8 x float> %127, ptr %131, align 32, !alias.scope !15
  store <8 x float> %128, ptr %132, align 64, !alias.scope !15
  store <8 x float> %129, ptr %133, align 32, !alias.scope !15
  %134 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 352
  %135 = getelementptr inbounds nuw i8, ptr %134, i64 32
  %136 = getelementptr inbounds nuw i8, ptr %134, i64 64
  %137 = getelementptr inbounds nuw i8, ptr %134, i64 96
  %wide.load.11 = load <8 x float>, ptr %134, align 64, !invariant.load !1, !noalias !15
  %wide.load9.11 = load <8 x float>, ptr %135, align 32, !invariant.load !1, !noalias !15
  %wide.load10.11 = load <8 x float>, ptr %136, align 64, !invariant.load !1, !noalias !15
  %wide.load11.11 = load <8 x float>, ptr %137, align 32, !invariant.load !1, !noalias !15
  %138 = fmul <8 x float> %wide.load.11, splat (float 1.250000e-01)
  %139 = fmul <8 x float> %wide.load9.11, splat (float 1.250000e-01)
  %140 = fmul <8 x float> %wide.load10.11, splat (float 1.250000e-01)
  %141 = fmul <8 x float> %wide.load11.11, splat (float 1.250000e-01)
  %142 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 352
  %143 = getelementptr inbounds nuw i8, ptr %142, i64 32
  %144 = getelementptr inbounds nuw i8, ptr %142, i64 64
  %145 = getelementptr inbounds nuw i8, ptr %142, i64 96
  store <8 x float> %138, ptr %142, align 64, !alias.scope !15
  store <8 x float> %139, ptr %143, align 32, !alias.scope !15
  store <8 x float> %140, ptr %144, align 64, !alias.scope !15
  store <8 x float> %141, ptr %145, align 32, !alias.scope !15
  %146 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 384
  %147 = getelementptr inbounds nuw i8, ptr %146, i64 32
  %148 = getelementptr inbounds nuw i8, ptr %146, i64 64
  %149 = getelementptr inbounds nuw i8, ptr %146, i64 96
  %wide.load.12 = load <8 x float>, ptr %146, align 64, !invariant.load !1, !noalias !15
  %wide.load9.12 = load <8 x float>, ptr %147, align 32, !invariant.load !1, !noalias !15
  %wide.load10.12 = load <8 x float>, ptr %148, align 64, !invariant.load !1, !noalias !15
  %wide.load11.12 = load <8 x float>, ptr %149, align 32, !invariant.load !1, !noalias !15
  %150 = fmul <8 x float> %wide.load.12, splat (float 1.250000e-01)
  %151 = fmul <8 x float> %wide.load9.12, splat (float 1.250000e-01)
  %152 = fmul <8 x float> %wide.load10.12, splat (float 1.250000e-01)
  %153 = fmul <8 x float> %wide.load11.12, splat (float 1.250000e-01)
  %154 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 384
  %155 = getelementptr inbounds nuw i8, ptr %154, i64 32
  %156 = getelementptr inbounds nuw i8, ptr %154, i64 64
  %157 = getelementptr inbounds nuw i8, ptr %154, i64 96
  store <8 x float> %150, ptr %154, align 64, !alias.scope !15
  store <8 x float> %151, ptr %155, align 32, !alias.scope !15
  store <8 x float> %152, ptr %156, align 64, !alias.scope !15
  store <8 x float> %153, ptr %157, align 32, !alias.scope !15
  %158 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 416
  %159 = getelementptr inbounds nuw i8, ptr %158, i64 32
  %160 = getelementptr inbounds nuw i8, ptr %158, i64 64
  %161 = getelementptr inbounds nuw i8, ptr %158, i64 96
  %wide.load.13 = load <8 x float>, ptr %158, align 64, !invariant.load !1, !noalias !15
  %wide.load9.13 = load <8 x float>, ptr %159, align 32, !invariant.load !1, !noalias !15
  %wide.load10.13 = load <8 x float>, ptr %160, align 64, !invariant.load !1, !noalias !15
  %wide.load11.13 = load <8 x float>, ptr %161, align 32, !invariant.load !1, !noalias !15
  %162 = fmul <8 x float> %wide.load.13, splat (float 1.250000e-01)
  %163 = fmul <8 x float> %wide.load9.13, splat (float 1.250000e-01)
  %164 = fmul <8 x float> %wide.load10.13, splat (float 1.250000e-01)
  %165 = fmul <8 x float> %wide.load11.13, splat (float 1.250000e-01)
  %166 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 416
  %167 = getelementptr inbounds nuw i8, ptr %166, i64 32
  %168 = getelementptr inbounds nuw i8, ptr %166, i64 64
  %169 = getelementptr inbounds nuw i8, ptr %166, i64 96
  store <8 x float> %162, ptr %166, align 64, !alias.scope !15
  store <8 x float> %163, ptr %167, align 32, !alias.scope !15
  store <8 x float> %164, ptr %168, align 64, !alias.scope !15
  store <8 x float> %165, ptr %169, align 32, !alias.scope !15
  %170 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 448
  %171 = getelementptr inbounds nuw i8, ptr %170, i64 32
  %172 = getelementptr inbounds nuw i8, ptr %170, i64 64
  %173 = getelementptr inbounds nuw i8, ptr %170, i64 96
  %wide.load.14 = load <8 x float>, ptr %170, align 64, !invariant.load !1, !noalias !15
  %wide.load9.14 = load <8 x float>, ptr %171, align 32, !invariant.load !1, !noalias !15
  %wide.load10.14 = load <8 x float>, ptr %172, align 64, !invariant.load !1, !noalias !15
  %wide.load11.14 = load <8 x float>, ptr %173, align 32, !invariant.load !1, !noalias !15
  %174 = fmul <8 x float> %wide.load.14, splat (float 1.250000e-01)
  %175 = fmul <8 x float> %wide.load9.14, splat (float 1.250000e-01)
  %176 = fmul <8 x float> %wide.load10.14, splat (float 1.250000e-01)
  %177 = fmul <8 x float> %wide.load11.14, splat (float 1.250000e-01)
  %178 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 448
  %179 = getelementptr inbounds nuw i8, ptr %178, i64 32
  %180 = getelementptr inbounds nuw i8, ptr %178, i64 64
  %181 = getelementptr inbounds nuw i8, ptr %178, i64 96
  store <8 x float> %174, ptr %178, align 64, !alias.scope !15
  store <8 x float> %175, ptr %179, align 32, !alias.scope !15
  store <8 x float> %176, ptr %180, align 64, !alias.scope !15
  store <8 x float> %177, ptr %181, align 32, !alias.scope !15
  %182 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 480
  %183 = getelementptr inbounds nuw i8, ptr %182, i64 32
  %184 = getelementptr inbounds nuw i8, ptr %182, i64 64
  %185 = getelementptr inbounds nuw i8, ptr %182, i64 96
  %wide.load.15 = load <8 x float>, ptr %182, align 64, !invariant.load !1, !noalias !15
  %wide.load9.15 = load <8 x float>, ptr %183, align 32, !invariant.load !1, !noalias !15
  %wide.load10.15 = load <8 x float>, ptr %184, align 64, !invariant.load !1, !noalias !15
  %wide.load11.15 = load <8 x float>, ptr %185, align 32, !invariant.load !1, !noalias !15
  %186 = fmul <8 x float> %wide.load.15, splat (float 1.250000e-01)
  %187 = fmul <8 x float> %wide.load9.15, splat (float 1.250000e-01)
  %188 = fmul <8 x float> %wide.load10.15, splat (float 1.250000e-01)
  %189 = fmul <8 x float> %wide.load11.15, splat (float 1.250000e-01)
  %190 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, i64 480
  %191 = getelementptr inbounds nuw i8, ptr %190, i64 32
  %192 = getelementptr inbounds nuw i8, ptr %190, i64 64
  %193 = getelementptr inbounds nuw i8, ptr %190, i64 96
  store <8 x float> %186, ptr %190, align 64, !alias.scope !15
  store <8 x float> %187, ptr %191, align 32, !alias.scope !15
  store <8 x float> %188, ptr %192, align 64, !alias.scope !15
  store <8 x float> %189, ptr %193, align 32, !alias.scope !15
  %invar.inc4 = add nuw nsw i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc4, 512
  br i1 %exitcond6, label %broadcast_multiply_fusion.1.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !18

broadcast_multiply_fusion.1.clone.loop_exit.dim.2: ; preds = %vector.ph
  %invar.inc3 = add nuw nsw i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc3, 16
  br i1 %exitcond7, label %broadcast_multiply_fusion.1.clone.loop_exit.dim.1, label %broadcast_multiply_fusion.1.clone.loop_header.dim.2.preheader, !llvm.loop !19

broadcast_multiply_fusion.1.clone.loop_exit.dim.1: ; preds = %broadcast_multiply_fusion.1.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %broadcast_multiply_fusion.1.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %broadcast_multiply_fusion.1.clone.loop_header.dim.1.preheader, !llvm.loop !20

return:                                           ; preds = %broadcast_multiply_fusion.1.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 17}
!1 = !{}
!2 = !{i64 67108864}
!3 = !{i64 64}
!4 = !{i64 4096}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:536870912, size:67108864}", !7}
!7 = !{!"XLA host kernel add_add_fusion.9.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = !{i64 536870912}
!15 = !{!16}
!16 = !{!"result slice: {index:148, offset:536870912, size:536870912}", !17}
!17 = !{!"XLA host kernel broadcast_multiply_fusion.1.clone AA domain"}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
