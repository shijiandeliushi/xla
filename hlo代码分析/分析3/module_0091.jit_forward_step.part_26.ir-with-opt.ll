; ModuleID = '__compute_module_part_26'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@copy_bitcast_fusion.3.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 4096]], [1 x [2 x i64]] [[2 x i64] [i64 4096, i64 8192]], [1 x [2 x i64]] [[2 x i64] [i64 8192, i64 12288]], [1 x [2 x i64]] [[2 x i64] [i64 12288, i64 16384]]]
@broadcast_multiply_fusion.2.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @copy_bitcast_fusion.3.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @copy_bitcast_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @copy_bitcast_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %copy_bitcast_fusion.3.clone.loop_header.dim.1.preheader, label %return

copy_bitcast_fusion.3.clone.loop_header.dim.1.preheader: ; preds = %1, %copy_bitcast_fusion.3.clone.loop_exit.dim.1
  %copy_bitcast_fusion.3.clone.invar_address.dim.0.03 = phi i64 [ %invar.inc, %copy_bitcast_fusion.3.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  %2 = and i64 %copy_bitcast_fusion.3.clone.invar_address.dim.0.03, 511
  %3 = lshr i64 %copy_bitcast_fusion.3.clone.invar_address.dim.0.03, 9
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %copy_bitcast_fusion.3.clone.loop_header.dim.1.preheader
  %index = phi i64 [ 0, %copy_bitcast_fusion.3.clone.loop_header.dim.1.preheader ], [ %index.next, %vector.body ]
  %4 = and i64 %index, 56
  %5 = and i64 %index, 56
  %6 = or disjoint i64 %5, 1
  %7 = and i64 %index, 56
  %8 = or disjoint i64 %7, 2
  %9 = and i64 %index, 56
  %10 = or disjoint i64 %9, 3
  %11 = and i64 %index, 56
  %12 = or disjoint i64 %11, 4
  %13 = and i64 %index, 56
  %14 = or disjoint i64 %13, 5
  %15 = and i64 %index, 56
  %16 = or disjoint i64 %15, 6
  %17 = and i64 %index, 56
  %18 = or disjoint i64 %17, 7
  %19 = lshr i64 %index, 6
  %20 = lshr i64 %index, 6
  %21 = lshr i64 %index, 6
  %22 = lshr i64 %index, 6
  %23 = lshr i64 %index, 6
  %24 = lshr i64 %index, 6
  %25 = lshr i64 %index, 6
  %26 = lshr i64 %index, 6
  %27 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %19, i64 %2, i64 %4
  %28 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %20, i64 %2, i64 %6
  %29 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %21, i64 %2, i64 %8
  %30 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %22, i64 %2, i64 %10
  %31 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %23, i64 %2, i64 %12
  %32 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %24, i64 %2, i64 %14
  %33 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %25, i64 %2, i64 %16
  %34 = getelementptr inbounds nuw [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %3, i64 %26, i64 %2, i64 %18
  %35 = load float, ptr %27, align 32, !invariant.load !1, !noalias !4
  %36 = load float, ptr %28, align 4, !invariant.load !1, !noalias !4
  %37 = load float, ptr %29, align 8, !invariant.load !1, !noalias !4
  %38 = load float, ptr %30, align 4, !invariant.load !1, !noalias !4
  %39 = load float, ptr %31, align 16, !invariant.load !1, !noalias !4
  %40 = load float, ptr %32, align 4, !invariant.load !1, !noalias !4
  %41 = load float, ptr %33, align 8, !invariant.load !1, !noalias !4
  %42 = load float, ptr %34, align 4, !invariant.load !1, !noalias !4
  %43 = insertelement <8 x float> poison, float %35, i64 0
  %44 = insertelement <8 x float> %43, float %36, i64 1
  %45 = insertelement <8 x float> %44, float %37, i64 2
  %46 = insertelement <8 x float> %45, float %38, i64 3
  %47 = insertelement <8 x float> %46, float %39, i64 4
  %48 = insertelement <8 x float> %47, float %40, i64 5
  %49 = insertelement <8 x float> %48, float %41, i64 6
  %50 = insertelement <8 x float> %49, float %42, i64 7
  %51 = getelementptr inbounds [16384 x [1024 x float]], ptr %arg1, i64 0, i64 %copy_bitcast_fusion.3.clone.invar_address.dim.0.03, i64 %index
  store <8 x float> %50, ptr %51, align 32, !alias.scope !4
  %index.next = add nuw i64 %index, 8
  %52 = icmp eq i64 %index.next, 1024
  br i1 %52, label %copy_bitcast_fusion.3.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !7

copy_bitcast_fusion.3.clone.loop_exit.dim.1:      ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %copy_bitcast_fusion.3.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %copy_bitcast_fusion.3.clone.loop_header.dim.1.preheader, !llvm.loop !10

return:                                           ; preds = %copy_bitcast_fusion.3.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_multiply_fusion.2.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !12, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !12, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %broadcast_multiply_fusion.2.clone.loop_header.dim.1.preheader, label %return

broadcast_multiply_fusion.2.clone.loop_header.dim.1.preheader: ; preds = %1, %broadcast_multiply_fusion.2.clone.loop_exit.dim.1
  %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %broadcast_multiply_fusion.2.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %broadcast_multiply_fusion.2.clone.loop_header.dim.2.preheader

broadcast_multiply_fusion.2.clone.loop_header.dim.2.preheader: ; preds = %broadcast_multiply_fusion.2.clone.loop_header.dim.1.preheader, %broadcast_multiply_fusion.2.clone.loop_exit.dim.2
  %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03 = phi i64 [ 0, %broadcast_multiply_fusion.2.clone.loop_header.dim.1.preheader ], [ %invar.inc3, %broadcast_multiply_fusion.2.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_multiply_fusion.2.clone.loop_header.dim.2.preheader
  %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02 = phi i64 [ 0, %broadcast_multiply_fusion.2.clone.loop_header.dim.2.preheader ], [ %invar.inc4, %vector.ph ]
  %2 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 0
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !13
  %wide.load9 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !13
  %wide.load10 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !13
  %wide.load11 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !13
  %6 = fmul <8 x float> %wide.load, splat (float 1.250000e-01)
  %7 = fmul <8 x float> %wide.load9, splat (float 1.250000e-01)
  %8 = fmul <8 x float> %wide.load10, splat (float 1.250000e-01)
  %9 = fmul <8 x float> %wide.load11, splat (float 1.250000e-01)
  %10 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 0
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x float> %6, ptr %10, align 64, !alias.scope !13
  store <8 x float> %7, ptr %11, align 32, !alias.scope !13
  store <8 x float> %8, ptr %12, align 64, !alias.scope !13
  store <8 x float> %9, ptr %13, align 32, !alias.scope !13
  %14 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 32
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  %wide.load.1 = load <8 x float>, ptr %14, align 64, !invariant.load !1, !noalias !13
  %wide.load9.1 = load <8 x float>, ptr %15, align 32, !invariant.load !1, !noalias !13
  %wide.load10.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !13
  %wide.load11.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !13
  %18 = fmul <8 x float> %wide.load.1, splat (float 1.250000e-01)
  %19 = fmul <8 x float> %wide.load9.1, splat (float 1.250000e-01)
  %20 = fmul <8 x float> %wide.load10.1, splat (float 1.250000e-01)
  %21 = fmul <8 x float> %wide.load11.1, splat (float 1.250000e-01)
  %22 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 32
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x float> %18, ptr %22, align 64, !alias.scope !13
  store <8 x float> %19, ptr %23, align 32, !alias.scope !13
  store <8 x float> %20, ptr %24, align 64, !alias.scope !13
  store <8 x float> %21, ptr %25, align 32, !alias.scope !13
  %26 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 64
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  %wide.load.2 = load <8 x float>, ptr %26, align 64, !invariant.load !1, !noalias !13
  %wide.load9.2 = load <8 x float>, ptr %27, align 32, !invariant.load !1, !noalias !13
  %wide.load10.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !13
  %wide.load11.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !13
  %30 = fmul <8 x float> %wide.load.2, splat (float 1.250000e-01)
  %31 = fmul <8 x float> %wide.load9.2, splat (float 1.250000e-01)
  %32 = fmul <8 x float> %wide.load10.2, splat (float 1.250000e-01)
  %33 = fmul <8 x float> %wide.load11.2, splat (float 1.250000e-01)
  %34 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 64
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  store <8 x float> %30, ptr %34, align 64, !alias.scope !13
  store <8 x float> %31, ptr %35, align 32, !alias.scope !13
  store <8 x float> %32, ptr %36, align 64, !alias.scope !13
  store <8 x float> %33, ptr %37, align 32, !alias.scope !13
  %38 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 96
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 64
  %41 = getelementptr inbounds nuw i8, ptr %38, i64 96
  %wide.load.3 = load <8 x float>, ptr %38, align 64, !invariant.load !1, !noalias !13
  %wide.load9.3 = load <8 x float>, ptr %39, align 32, !invariant.load !1, !noalias !13
  %wide.load10.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !13
  %wide.load11.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !13
  %42 = fmul <8 x float> %wide.load.3, splat (float 1.250000e-01)
  %43 = fmul <8 x float> %wide.load9.3, splat (float 1.250000e-01)
  %44 = fmul <8 x float> %wide.load10.3, splat (float 1.250000e-01)
  %45 = fmul <8 x float> %wide.load11.3, splat (float 1.250000e-01)
  %46 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 96
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x float> %42, ptr %46, align 64, !alias.scope !13
  store <8 x float> %43, ptr %47, align 32, !alias.scope !13
  store <8 x float> %44, ptr %48, align 64, !alias.scope !13
  store <8 x float> %45, ptr %49, align 32, !alias.scope !13
  %50 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 128
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 64
  %53 = getelementptr inbounds nuw i8, ptr %50, i64 96
  %wide.load.4 = load <8 x float>, ptr %50, align 64, !invariant.load !1, !noalias !13
  %wide.load9.4 = load <8 x float>, ptr %51, align 32, !invariant.load !1, !noalias !13
  %wide.load10.4 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !13
  %wide.load11.4 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !13
  %54 = fmul <8 x float> %wide.load.4, splat (float 1.250000e-01)
  %55 = fmul <8 x float> %wide.load9.4, splat (float 1.250000e-01)
  %56 = fmul <8 x float> %wide.load10.4, splat (float 1.250000e-01)
  %57 = fmul <8 x float> %wide.load11.4, splat (float 1.250000e-01)
  %58 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 128
  %59 = getelementptr inbounds nuw i8, ptr %58, i64 32
  %60 = getelementptr inbounds nuw i8, ptr %58, i64 64
  %61 = getelementptr inbounds nuw i8, ptr %58, i64 96
  store <8 x float> %54, ptr %58, align 64, !alias.scope !13
  store <8 x float> %55, ptr %59, align 32, !alias.scope !13
  store <8 x float> %56, ptr %60, align 64, !alias.scope !13
  store <8 x float> %57, ptr %61, align 32, !alias.scope !13
  %62 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 160
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 32
  %64 = getelementptr inbounds nuw i8, ptr %62, i64 64
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 96
  %wide.load.5 = load <8 x float>, ptr %62, align 64, !invariant.load !1, !noalias !13
  %wide.load9.5 = load <8 x float>, ptr %63, align 32, !invariant.load !1, !noalias !13
  %wide.load10.5 = load <8 x float>, ptr %64, align 64, !invariant.load !1, !noalias !13
  %wide.load11.5 = load <8 x float>, ptr %65, align 32, !invariant.load !1, !noalias !13
  %66 = fmul <8 x float> %wide.load.5, splat (float 1.250000e-01)
  %67 = fmul <8 x float> %wide.load9.5, splat (float 1.250000e-01)
  %68 = fmul <8 x float> %wide.load10.5, splat (float 1.250000e-01)
  %69 = fmul <8 x float> %wide.load11.5, splat (float 1.250000e-01)
  %70 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 160
  %71 = getelementptr inbounds nuw i8, ptr %70, i64 32
  %72 = getelementptr inbounds nuw i8, ptr %70, i64 64
  %73 = getelementptr inbounds nuw i8, ptr %70, i64 96
  store <8 x float> %66, ptr %70, align 64, !alias.scope !13
  store <8 x float> %67, ptr %71, align 32, !alias.scope !13
  store <8 x float> %68, ptr %72, align 64, !alias.scope !13
  store <8 x float> %69, ptr %73, align 32, !alias.scope !13
  %74 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 192
  %75 = getelementptr inbounds nuw i8, ptr %74, i64 32
  %76 = getelementptr inbounds nuw i8, ptr %74, i64 64
  %77 = getelementptr inbounds nuw i8, ptr %74, i64 96
  %wide.load.6 = load <8 x float>, ptr %74, align 64, !invariant.load !1, !noalias !13
  %wide.load9.6 = load <8 x float>, ptr %75, align 32, !invariant.load !1, !noalias !13
  %wide.load10.6 = load <8 x float>, ptr %76, align 64, !invariant.load !1, !noalias !13
  %wide.load11.6 = load <8 x float>, ptr %77, align 32, !invariant.load !1, !noalias !13
  %78 = fmul <8 x float> %wide.load.6, splat (float 1.250000e-01)
  %79 = fmul <8 x float> %wide.load9.6, splat (float 1.250000e-01)
  %80 = fmul <8 x float> %wide.load10.6, splat (float 1.250000e-01)
  %81 = fmul <8 x float> %wide.load11.6, splat (float 1.250000e-01)
  %82 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 192
  %83 = getelementptr inbounds nuw i8, ptr %82, i64 32
  %84 = getelementptr inbounds nuw i8, ptr %82, i64 64
  %85 = getelementptr inbounds nuw i8, ptr %82, i64 96
  store <8 x float> %78, ptr %82, align 64, !alias.scope !13
  store <8 x float> %79, ptr %83, align 32, !alias.scope !13
  store <8 x float> %80, ptr %84, align 64, !alias.scope !13
  store <8 x float> %81, ptr %85, align 32, !alias.scope !13
  %86 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 224
  %87 = getelementptr inbounds nuw i8, ptr %86, i64 32
  %88 = getelementptr inbounds nuw i8, ptr %86, i64 64
  %89 = getelementptr inbounds nuw i8, ptr %86, i64 96
  %wide.load.7 = load <8 x float>, ptr %86, align 64, !invariant.load !1, !noalias !13
  %wide.load9.7 = load <8 x float>, ptr %87, align 32, !invariant.load !1, !noalias !13
  %wide.load10.7 = load <8 x float>, ptr %88, align 64, !invariant.load !1, !noalias !13
  %wide.load11.7 = load <8 x float>, ptr %89, align 32, !invariant.load !1, !noalias !13
  %90 = fmul <8 x float> %wide.load.7, splat (float 1.250000e-01)
  %91 = fmul <8 x float> %wide.load9.7, splat (float 1.250000e-01)
  %92 = fmul <8 x float> %wide.load10.7, splat (float 1.250000e-01)
  %93 = fmul <8 x float> %wide.load11.7, splat (float 1.250000e-01)
  %94 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 224
  %95 = getelementptr inbounds nuw i8, ptr %94, i64 32
  %96 = getelementptr inbounds nuw i8, ptr %94, i64 64
  %97 = getelementptr inbounds nuw i8, ptr %94, i64 96
  store <8 x float> %90, ptr %94, align 64, !alias.scope !13
  store <8 x float> %91, ptr %95, align 32, !alias.scope !13
  store <8 x float> %92, ptr %96, align 64, !alias.scope !13
  store <8 x float> %93, ptr %97, align 32, !alias.scope !13
  %98 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 256
  %99 = getelementptr inbounds nuw i8, ptr %98, i64 32
  %100 = getelementptr inbounds nuw i8, ptr %98, i64 64
  %101 = getelementptr inbounds nuw i8, ptr %98, i64 96
  %wide.load.8 = load <8 x float>, ptr %98, align 64, !invariant.load !1, !noalias !13
  %wide.load9.8 = load <8 x float>, ptr %99, align 32, !invariant.load !1, !noalias !13
  %wide.load10.8 = load <8 x float>, ptr %100, align 64, !invariant.load !1, !noalias !13
  %wide.load11.8 = load <8 x float>, ptr %101, align 32, !invariant.load !1, !noalias !13
  %102 = fmul <8 x float> %wide.load.8, splat (float 1.250000e-01)
  %103 = fmul <8 x float> %wide.load9.8, splat (float 1.250000e-01)
  %104 = fmul <8 x float> %wide.load10.8, splat (float 1.250000e-01)
  %105 = fmul <8 x float> %wide.load11.8, splat (float 1.250000e-01)
  %106 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 256
  %107 = getelementptr inbounds nuw i8, ptr %106, i64 32
  %108 = getelementptr inbounds nuw i8, ptr %106, i64 64
  %109 = getelementptr inbounds nuw i8, ptr %106, i64 96
  store <8 x float> %102, ptr %106, align 64, !alias.scope !13
  store <8 x float> %103, ptr %107, align 32, !alias.scope !13
  store <8 x float> %104, ptr %108, align 64, !alias.scope !13
  store <8 x float> %105, ptr %109, align 32, !alias.scope !13
  %110 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 288
  %111 = getelementptr inbounds nuw i8, ptr %110, i64 32
  %112 = getelementptr inbounds nuw i8, ptr %110, i64 64
  %113 = getelementptr inbounds nuw i8, ptr %110, i64 96
  %wide.load.9 = load <8 x float>, ptr %110, align 64, !invariant.load !1, !noalias !13
  %wide.load9.9 = load <8 x float>, ptr %111, align 32, !invariant.load !1, !noalias !13
  %wide.load10.9 = load <8 x float>, ptr %112, align 64, !invariant.load !1, !noalias !13
  %wide.load11.9 = load <8 x float>, ptr %113, align 32, !invariant.load !1, !noalias !13
  %114 = fmul <8 x float> %wide.load.9, splat (float 1.250000e-01)
  %115 = fmul <8 x float> %wide.load9.9, splat (float 1.250000e-01)
  %116 = fmul <8 x float> %wide.load10.9, splat (float 1.250000e-01)
  %117 = fmul <8 x float> %wide.load11.9, splat (float 1.250000e-01)
  %118 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 288
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 32
  %120 = getelementptr inbounds nuw i8, ptr %118, i64 64
  %121 = getelementptr inbounds nuw i8, ptr %118, i64 96
  store <8 x float> %114, ptr %118, align 64, !alias.scope !13
  store <8 x float> %115, ptr %119, align 32, !alias.scope !13
  store <8 x float> %116, ptr %120, align 64, !alias.scope !13
  store <8 x float> %117, ptr %121, align 32, !alias.scope !13
  %122 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 320
  %123 = getelementptr inbounds nuw i8, ptr %122, i64 32
  %124 = getelementptr inbounds nuw i8, ptr %122, i64 64
  %125 = getelementptr inbounds nuw i8, ptr %122, i64 96
  %wide.load.10 = load <8 x float>, ptr %122, align 64, !invariant.load !1, !noalias !13
  %wide.load9.10 = load <8 x float>, ptr %123, align 32, !invariant.load !1, !noalias !13
  %wide.load10.10 = load <8 x float>, ptr %124, align 64, !invariant.load !1, !noalias !13
  %wide.load11.10 = load <8 x float>, ptr %125, align 32, !invariant.load !1, !noalias !13
  %126 = fmul <8 x float> %wide.load.10, splat (float 1.250000e-01)
  %127 = fmul <8 x float> %wide.load9.10, splat (float 1.250000e-01)
  %128 = fmul <8 x float> %wide.load10.10, splat (float 1.250000e-01)
  %129 = fmul <8 x float> %wide.load11.10, splat (float 1.250000e-01)
  %130 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 320
  %131 = getelementptr inbounds nuw i8, ptr %130, i64 32
  %132 = getelementptr inbounds nuw i8, ptr %130, i64 64
  %133 = getelementptr inbounds nuw i8, ptr %130, i64 96
  store <8 x float> %126, ptr %130, align 64, !alias.scope !13
  store <8 x float> %127, ptr %131, align 32, !alias.scope !13
  store <8 x float> %128, ptr %132, align 64, !alias.scope !13
  store <8 x float> %129, ptr %133, align 32, !alias.scope !13
  %134 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 352
  %135 = getelementptr inbounds nuw i8, ptr %134, i64 32
  %136 = getelementptr inbounds nuw i8, ptr %134, i64 64
  %137 = getelementptr inbounds nuw i8, ptr %134, i64 96
  %wide.load.11 = load <8 x float>, ptr %134, align 64, !invariant.load !1, !noalias !13
  %wide.load9.11 = load <8 x float>, ptr %135, align 32, !invariant.load !1, !noalias !13
  %wide.load10.11 = load <8 x float>, ptr %136, align 64, !invariant.load !1, !noalias !13
  %wide.load11.11 = load <8 x float>, ptr %137, align 32, !invariant.load !1, !noalias !13
  %138 = fmul <8 x float> %wide.load.11, splat (float 1.250000e-01)
  %139 = fmul <8 x float> %wide.load9.11, splat (float 1.250000e-01)
  %140 = fmul <8 x float> %wide.load10.11, splat (float 1.250000e-01)
  %141 = fmul <8 x float> %wide.load11.11, splat (float 1.250000e-01)
  %142 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 352
  %143 = getelementptr inbounds nuw i8, ptr %142, i64 32
  %144 = getelementptr inbounds nuw i8, ptr %142, i64 64
  %145 = getelementptr inbounds nuw i8, ptr %142, i64 96
  store <8 x float> %138, ptr %142, align 64, !alias.scope !13
  store <8 x float> %139, ptr %143, align 32, !alias.scope !13
  store <8 x float> %140, ptr %144, align 64, !alias.scope !13
  store <8 x float> %141, ptr %145, align 32, !alias.scope !13
  %146 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 384
  %147 = getelementptr inbounds nuw i8, ptr %146, i64 32
  %148 = getelementptr inbounds nuw i8, ptr %146, i64 64
  %149 = getelementptr inbounds nuw i8, ptr %146, i64 96
  %wide.load.12 = load <8 x float>, ptr %146, align 64, !invariant.load !1, !noalias !13
  %wide.load9.12 = load <8 x float>, ptr %147, align 32, !invariant.load !1, !noalias !13
  %wide.load10.12 = load <8 x float>, ptr %148, align 64, !invariant.load !1, !noalias !13
  %wide.load11.12 = load <8 x float>, ptr %149, align 32, !invariant.load !1, !noalias !13
  %150 = fmul <8 x float> %wide.load.12, splat (float 1.250000e-01)
  %151 = fmul <8 x float> %wide.load9.12, splat (float 1.250000e-01)
  %152 = fmul <8 x float> %wide.load10.12, splat (float 1.250000e-01)
  %153 = fmul <8 x float> %wide.load11.12, splat (float 1.250000e-01)
  %154 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 384
  %155 = getelementptr inbounds nuw i8, ptr %154, i64 32
  %156 = getelementptr inbounds nuw i8, ptr %154, i64 64
  %157 = getelementptr inbounds nuw i8, ptr %154, i64 96
  store <8 x float> %150, ptr %154, align 64, !alias.scope !13
  store <8 x float> %151, ptr %155, align 32, !alias.scope !13
  store <8 x float> %152, ptr %156, align 64, !alias.scope !13
  store <8 x float> %153, ptr %157, align 32, !alias.scope !13
  %158 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 416
  %159 = getelementptr inbounds nuw i8, ptr %158, i64 32
  %160 = getelementptr inbounds nuw i8, ptr %158, i64 64
  %161 = getelementptr inbounds nuw i8, ptr %158, i64 96
  %wide.load.13 = load <8 x float>, ptr %158, align 64, !invariant.load !1, !noalias !13
  %wide.load9.13 = load <8 x float>, ptr %159, align 32, !invariant.load !1, !noalias !13
  %wide.load10.13 = load <8 x float>, ptr %160, align 64, !invariant.load !1, !noalias !13
  %wide.load11.13 = load <8 x float>, ptr %161, align 32, !invariant.load !1, !noalias !13
  %162 = fmul <8 x float> %wide.load.13, splat (float 1.250000e-01)
  %163 = fmul <8 x float> %wide.load9.13, splat (float 1.250000e-01)
  %164 = fmul <8 x float> %wide.load10.13, splat (float 1.250000e-01)
  %165 = fmul <8 x float> %wide.load11.13, splat (float 1.250000e-01)
  %166 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 416
  %167 = getelementptr inbounds nuw i8, ptr %166, i64 32
  %168 = getelementptr inbounds nuw i8, ptr %166, i64 64
  %169 = getelementptr inbounds nuw i8, ptr %166, i64 96
  store <8 x float> %162, ptr %166, align 64, !alias.scope !13
  store <8 x float> %163, ptr %167, align 32, !alias.scope !13
  store <8 x float> %164, ptr %168, align 64, !alias.scope !13
  store <8 x float> %165, ptr %169, align 32, !alias.scope !13
  %170 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 448
  %171 = getelementptr inbounds nuw i8, ptr %170, i64 32
  %172 = getelementptr inbounds nuw i8, ptr %170, i64 64
  %173 = getelementptr inbounds nuw i8, ptr %170, i64 96
  %wide.load.14 = load <8 x float>, ptr %170, align 64, !invariant.load !1, !noalias !13
  %wide.load9.14 = load <8 x float>, ptr %171, align 32, !invariant.load !1, !noalias !13
  %wide.load10.14 = load <8 x float>, ptr %172, align 64, !invariant.load !1, !noalias !13
  %wide.load11.14 = load <8 x float>, ptr %173, align 32, !invariant.load !1, !noalias !13
  %174 = fmul <8 x float> %wide.load.14, splat (float 1.250000e-01)
  %175 = fmul <8 x float> %wide.load9.14, splat (float 1.250000e-01)
  %176 = fmul <8 x float> %wide.load10.14, splat (float 1.250000e-01)
  %177 = fmul <8 x float> %wide.load11.14, splat (float 1.250000e-01)
  %178 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 448
  %179 = getelementptr inbounds nuw i8, ptr %178, i64 32
  %180 = getelementptr inbounds nuw i8, ptr %178, i64 64
  %181 = getelementptr inbounds nuw i8, ptr %178, i64 96
  store <8 x float> %174, ptr %178, align 64, !alias.scope !13
  store <8 x float> %175, ptr %179, align 32, !alias.scope !13
  store <8 x float> %176, ptr %180, align 64, !alias.scope !13
  store <8 x float> %177, ptr %181, align 32, !alias.scope !13
  %182 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 480
  %183 = getelementptr inbounds nuw i8, ptr %182, i64 32
  %184 = getelementptr inbounds nuw i8, ptr %182, i64 64
  %185 = getelementptr inbounds nuw i8, ptr %182, i64 96
  %wide.load.15 = load <8 x float>, ptr %182, align 64, !invariant.load !1, !noalias !13
  %wide.load9.15 = load <8 x float>, ptr %183, align 32, !invariant.load !1, !noalias !13
  %wide.load10.15 = load <8 x float>, ptr %184, align 64, !invariant.load !1, !noalias !13
  %wide.load11.15 = load <8 x float>, ptr %185, align 32, !invariant.load !1, !noalias !13
  %186 = fmul <8 x float> %wide.load.15, splat (float 1.250000e-01)
  %187 = fmul <8 x float> %wide.load9.15, splat (float 1.250000e-01)
  %188 = fmul <8 x float> %wide.load10.15, splat (float 1.250000e-01)
  %189 = fmul <8 x float> %wide.load11.15, splat (float 1.250000e-01)
  %190 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, i64 480
  %191 = getelementptr inbounds nuw i8, ptr %190, i64 32
  %192 = getelementptr inbounds nuw i8, ptr %190, i64 64
  %193 = getelementptr inbounds nuw i8, ptr %190, i64 96
  store <8 x float> %186, ptr %190, align 64, !alias.scope !13
  store <8 x float> %187, ptr %191, align 32, !alias.scope !13
  store <8 x float> %188, ptr %192, align 64, !alias.scope !13
  store <8 x float> %189, ptr %193, align 32, !alias.scope !13
  %invar.inc4 = add nuw nsw i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc4, 512
  br i1 %exitcond6, label %broadcast_multiply_fusion.2.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !16

broadcast_multiply_fusion.2.clone.loop_exit.dim.2: ; preds = %vector.ph
  %invar.inc3 = add nuw nsw i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc3, 16
  br i1 %exitcond7, label %broadcast_multiply_fusion.2.clone.loop_exit.dim.1, label %broadcast_multiply_fusion.2.clone.loop_header.dim.2.preheader, !llvm.loop !17

broadcast_multiply_fusion.2.clone.loop_exit.dim.1: ; preds = %broadcast_multiply_fusion.2.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %broadcast_multiply_fusion.2.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %broadcast_multiply_fusion.2.clone.loop_header.dim.1.preheader, !llvm.loop !18

return:                                           ; preds = %broadcast_multiply_fusion.2.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 26}
!1 = !{}
!2 = !{i64 67108864}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:148, offset:0, size:67108864}", !6}
!6 = !{!"XLA host kernel copy_bitcast_fusion.3.clone AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{i64 536870912}
!13 = !{!14}
!14 = !{!"result slice: {index:148, offset:536870912, size:536870912}", !15}
!15 = !{!"XLA host kernel broadcast_multiply_fusion.2.clone AA domain"}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11}
!18 = distinct !{!18, !11}
