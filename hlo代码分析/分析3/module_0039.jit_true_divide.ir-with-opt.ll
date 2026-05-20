; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_divide_fusion.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_divide_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not11 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not11, label %broadcast_divide_fusion.clone.loop_header.dim.1.preheader.lr.ph, label %return

broadcast_divide_fusion.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load float, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %broadcast_divide_fusion.clone.loop_header.dim.1.preheader

broadcast_divide_fusion.clone.loop_header.dim.1.preheader: ; preds = %broadcast_divide_fusion.clone.loop_header.dim.1.preheader.lr.ph, %broadcast_divide_fusion.clone.loop_exit.dim.1
  %broadcast_divide_fusion.clone.invar_address.dim.0.012 = phi i64 [ %lo_dim_0, %broadcast_divide_fusion.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %broadcast_divide_fusion.clone.loop_exit.dim.1 ]
  br label %broadcast_divide_fusion.clone.loop_header.dim.2.preheader

broadcast_divide_fusion.clone.loop_header.dim.2.preheader: ; preds = %broadcast_divide_fusion.clone.loop_header.dim.1.preheader, %broadcast_divide_fusion.clone.loop_exit.dim.2
  %broadcast_divide_fusion.clone.invar_address.dim.1.010 = phi i64 [ 0, %broadcast_divide_fusion.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %broadcast_divide_fusion.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_divide_fusion.clone.loop_header.dim.2.preheader
  %broadcast_divide_fusion.clone.invar_address.dim.2.09 = phi i64 [ 0, %broadcast_divide_fusion.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %vector.ph ]
  %3 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 0
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 96
  %wide.load = load <8 x float>, ptr %3, align 64, !invariant.load !1, !noalias !5
  %wide.load16 = load <8 x float>, ptr %4, align 32, !invariant.load !1, !noalias !5
  %wide.load17 = load <8 x float>, ptr %5, align 64, !invariant.load !1, !noalias !5
  %wide.load18 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %7 = fdiv <8 x float> %wide.load, %broadcast.splat
  %8 = fdiv <8 x float> %wide.load16, %broadcast.splat
  %9 = fdiv <8 x float> %wide.load17, %broadcast.splat
  %10 = fdiv <8 x float> %wide.load18, %broadcast.splat
  %11 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 0
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 96
  store <8 x float> %7, ptr %11, align 64, !alias.scope !5
  store <8 x float> %8, ptr %12, align 32, !alias.scope !5
  store <8 x float> %9, ptr %13, align 64, !alias.scope !5
  store <8 x float> %10, ptr %14, align 32, !alias.scope !5
  %15 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 96
  %wide.load.1 = load <8 x float>, ptr %15, align 64, !invariant.load !1, !noalias !5
  %wide.load16.1 = load <8 x float>, ptr %16, align 32, !invariant.load !1, !noalias !5
  %wide.load17.1 = load <8 x float>, ptr %17, align 64, !invariant.load !1, !noalias !5
  %wide.load18.1 = load <8 x float>, ptr %18, align 32, !invariant.load !1, !noalias !5
  %19 = fdiv <8 x float> %wide.load.1, %broadcast.splat
  %20 = fdiv <8 x float> %wide.load16.1, %broadcast.splat
  %21 = fdiv <8 x float> %wide.load17.1, %broadcast.splat
  %22 = fdiv <8 x float> %wide.load18.1, %broadcast.splat
  %23 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %26 = getelementptr inbounds nuw i8, ptr %23, i64 96
  store <8 x float> %19, ptr %23, align 64, !alias.scope !5
  store <8 x float> %20, ptr %24, align 32, !alias.scope !5
  store <8 x float> %21, ptr %25, align 64, !alias.scope !5
  store <8 x float> %22, ptr %26, align 32, !alias.scope !5
  %27 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 64
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 64
  %30 = getelementptr inbounds nuw i8, ptr %27, i64 96
  %wide.load.2 = load <8 x float>, ptr %27, align 64, !invariant.load !1, !noalias !5
  %wide.load16.2 = load <8 x float>, ptr %28, align 32, !invariant.load !1, !noalias !5
  %wide.load17.2 = load <8 x float>, ptr %29, align 64, !invariant.load !1, !noalias !5
  %wide.load18.2 = load <8 x float>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %31 = fdiv <8 x float> %wide.load.2, %broadcast.splat
  %32 = fdiv <8 x float> %wide.load16.2, %broadcast.splat
  %33 = fdiv <8 x float> %wide.load17.2, %broadcast.splat
  %34 = fdiv <8 x float> %wide.load18.2, %broadcast.splat
  %35 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 32
  %37 = getelementptr inbounds nuw i8, ptr %35, i64 64
  %38 = getelementptr inbounds nuw i8, ptr %35, i64 96
  store <8 x float> %31, ptr %35, align 64, !alias.scope !5
  store <8 x float> %32, ptr %36, align 32, !alias.scope !5
  store <8 x float> %33, ptr %37, align 64, !alias.scope !5
  store <8 x float> %34, ptr %38, align 32, !alias.scope !5
  %39 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 96
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %39, i64 96
  %wide.load.3 = load <8 x float>, ptr %39, align 64, !invariant.load !1, !noalias !5
  %wide.load16.3 = load <8 x float>, ptr %40, align 32, !invariant.load !1, !noalias !5
  %wide.load17.3 = load <8 x float>, ptr %41, align 64, !invariant.load !1, !noalias !5
  %wide.load18.3 = load <8 x float>, ptr %42, align 32, !invariant.load !1, !noalias !5
  %43 = fdiv <8 x float> %wide.load.3, %broadcast.splat
  %44 = fdiv <8 x float> %wide.load16.3, %broadcast.splat
  %45 = fdiv <8 x float> %wide.load17.3, %broadcast.splat
  %46 = fdiv <8 x float> %wide.load18.3, %broadcast.splat
  %47 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 96
  %48 = getelementptr inbounds nuw i8, ptr %47, i64 32
  %49 = getelementptr inbounds nuw i8, ptr %47, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %47, i64 96
  store <8 x float> %43, ptr %47, align 64, !alias.scope !5
  store <8 x float> %44, ptr %48, align 32, !alias.scope !5
  store <8 x float> %45, ptr %49, align 64, !alias.scope !5
  store <8 x float> %46, ptr %50, align 32, !alias.scope !5
  %51 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 128
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 32
  %53 = getelementptr inbounds nuw i8, ptr %51, i64 64
  %54 = getelementptr inbounds nuw i8, ptr %51, i64 96
  %wide.load.4 = load <8 x float>, ptr %51, align 64, !invariant.load !1, !noalias !5
  %wide.load16.4 = load <8 x float>, ptr %52, align 32, !invariant.load !1, !noalias !5
  %wide.load17.4 = load <8 x float>, ptr %53, align 64, !invariant.load !1, !noalias !5
  %wide.load18.4 = load <8 x float>, ptr %54, align 32, !invariant.load !1, !noalias !5
  %55 = fdiv <8 x float> %wide.load.4, %broadcast.splat
  %56 = fdiv <8 x float> %wide.load16.4, %broadcast.splat
  %57 = fdiv <8 x float> %wide.load17.4, %broadcast.splat
  %58 = fdiv <8 x float> %wide.load18.4, %broadcast.splat
  %59 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 128
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 32
  %61 = getelementptr inbounds nuw i8, ptr %59, i64 64
  %62 = getelementptr inbounds nuw i8, ptr %59, i64 96
  store <8 x float> %55, ptr %59, align 64, !alias.scope !5
  store <8 x float> %56, ptr %60, align 32, !alias.scope !5
  store <8 x float> %57, ptr %61, align 64, !alias.scope !5
  store <8 x float> %58, ptr %62, align 32, !alias.scope !5
  %63 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 160
  %64 = getelementptr inbounds nuw i8, ptr %63, i64 32
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 64
  %66 = getelementptr inbounds nuw i8, ptr %63, i64 96
  %wide.load.5 = load <8 x float>, ptr %63, align 64, !invariant.load !1, !noalias !5
  %wide.load16.5 = load <8 x float>, ptr %64, align 32, !invariant.load !1, !noalias !5
  %wide.load17.5 = load <8 x float>, ptr %65, align 64, !invariant.load !1, !noalias !5
  %wide.load18.5 = load <8 x float>, ptr %66, align 32, !invariant.load !1, !noalias !5
  %67 = fdiv <8 x float> %wide.load.5, %broadcast.splat
  %68 = fdiv <8 x float> %wide.load16.5, %broadcast.splat
  %69 = fdiv <8 x float> %wide.load17.5, %broadcast.splat
  %70 = fdiv <8 x float> %wide.load18.5, %broadcast.splat
  %71 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 160
  %72 = getelementptr inbounds nuw i8, ptr %71, i64 32
  %73 = getelementptr inbounds nuw i8, ptr %71, i64 64
  %74 = getelementptr inbounds nuw i8, ptr %71, i64 96
  store <8 x float> %67, ptr %71, align 64, !alias.scope !5
  store <8 x float> %68, ptr %72, align 32, !alias.scope !5
  store <8 x float> %69, ptr %73, align 64, !alias.scope !5
  store <8 x float> %70, ptr %74, align 32, !alias.scope !5
  %75 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 192
  %76 = getelementptr inbounds nuw i8, ptr %75, i64 32
  %77 = getelementptr inbounds nuw i8, ptr %75, i64 64
  %78 = getelementptr inbounds nuw i8, ptr %75, i64 96
  %wide.load.6 = load <8 x float>, ptr %75, align 64, !invariant.load !1, !noalias !5
  %wide.load16.6 = load <8 x float>, ptr %76, align 32, !invariant.load !1, !noalias !5
  %wide.load17.6 = load <8 x float>, ptr %77, align 64, !invariant.load !1, !noalias !5
  %wide.load18.6 = load <8 x float>, ptr %78, align 32, !invariant.load !1, !noalias !5
  %79 = fdiv <8 x float> %wide.load.6, %broadcast.splat
  %80 = fdiv <8 x float> %wide.load16.6, %broadcast.splat
  %81 = fdiv <8 x float> %wide.load17.6, %broadcast.splat
  %82 = fdiv <8 x float> %wide.load18.6, %broadcast.splat
  %83 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 192
  %84 = getelementptr inbounds nuw i8, ptr %83, i64 32
  %85 = getelementptr inbounds nuw i8, ptr %83, i64 64
  %86 = getelementptr inbounds nuw i8, ptr %83, i64 96
  store <8 x float> %79, ptr %83, align 64, !alias.scope !5
  store <8 x float> %80, ptr %84, align 32, !alias.scope !5
  store <8 x float> %81, ptr %85, align 64, !alias.scope !5
  store <8 x float> %82, ptr %86, align 32, !alias.scope !5
  %87 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 224
  %88 = getelementptr inbounds nuw i8, ptr %87, i64 32
  %89 = getelementptr inbounds nuw i8, ptr %87, i64 64
  %90 = getelementptr inbounds nuw i8, ptr %87, i64 96
  %wide.load.7 = load <8 x float>, ptr %87, align 64, !invariant.load !1, !noalias !5
  %wide.load16.7 = load <8 x float>, ptr %88, align 32, !invariant.load !1, !noalias !5
  %wide.load17.7 = load <8 x float>, ptr %89, align 64, !invariant.load !1, !noalias !5
  %wide.load18.7 = load <8 x float>, ptr %90, align 32, !invariant.load !1, !noalias !5
  %91 = fdiv <8 x float> %wide.load.7, %broadcast.splat
  %92 = fdiv <8 x float> %wide.load16.7, %broadcast.splat
  %93 = fdiv <8 x float> %wide.load17.7, %broadcast.splat
  %94 = fdiv <8 x float> %wide.load18.7, %broadcast.splat
  %95 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 224
  %96 = getelementptr inbounds nuw i8, ptr %95, i64 32
  %97 = getelementptr inbounds nuw i8, ptr %95, i64 64
  %98 = getelementptr inbounds nuw i8, ptr %95, i64 96
  store <8 x float> %91, ptr %95, align 64, !alias.scope !5
  store <8 x float> %92, ptr %96, align 32, !alias.scope !5
  store <8 x float> %93, ptr %97, align 64, !alias.scope !5
  store <8 x float> %94, ptr %98, align 32, !alias.scope !5
  %99 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 256
  %100 = getelementptr inbounds nuw i8, ptr %99, i64 32
  %101 = getelementptr inbounds nuw i8, ptr %99, i64 64
  %102 = getelementptr inbounds nuw i8, ptr %99, i64 96
  %wide.load.8 = load <8 x float>, ptr %99, align 64, !invariant.load !1, !noalias !5
  %wide.load16.8 = load <8 x float>, ptr %100, align 32, !invariant.load !1, !noalias !5
  %wide.load17.8 = load <8 x float>, ptr %101, align 64, !invariant.load !1, !noalias !5
  %wide.load18.8 = load <8 x float>, ptr %102, align 32, !invariant.load !1, !noalias !5
  %103 = fdiv <8 x float> %wide.load.8, %broadcast.splat
  %104 = fdiv <8 x float> %wide.load16.8, %broadcast.splat
  %105 = fdiv <8 x float> %wide.load17.8, %broadcast.splat
  %106 = fdiv <8 x float> %wide.load18.8, %broadcast.splat
  %107 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 256
  %108 = getelementptr inbounds nuw i8, ptr %107, i64 32
  %109 = getelementptr inbounds nuw i8, ptr %107, i64 64
  %110 = getelementptr inbounds nuw i8, ptr %107, i64 96
  store <8 x float> %103, ptr %107, align 64, !alias.scope !5
  store <8 x float> %104, ptr %108, align 32, !alias.scope !5
  store <8 x float> %105, ptr %109, align 64, !alias.scope !5
  store <8 x float> %106, ptr %110, align 32, !alias.scope !5
  %111 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 288
  %112 = getelementptr inbounds nuw i8, ptr %111, i64 32
  %113 = getelementptr inbounds nuw i8, ptr %111, i64 64
  %114 = getelementptr inbounds nuw i8, ptr %111, i64 96
  %wide.load.9 = load <8 x float>, ptr %111, align 64, !invariant.load !1, !noalias !5
  %wide.load16.9 = load <8 x float>, ptr %112, align 32, !invariant.load !1, !noalias !5
  %wide.load17.9 = load <8 x float>, ptr %113, align 64, !invariant.load !1, !noalias !5
  %wide.load18.9 = load <8 x float>, ptr %114, align 32, !invariant.load !1, !noalias !5
  %115 = fdiv <8 x float> %wide.load.9, %broadcast.splat
  %116 = fdiv <8 x float> %wide.load16.9, %broadcast.splat
  %117 = fdiv <8 x float> %wide.load17.9, %broadcast.splat
  %118 = fdiv <8 x float> %wide.load18.9, %broadcast.splat
  %119 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 288
  %120 = getelementptr inbounds nuw i8, ptr %119, i64 32
  %121 = getelementptr inbounds nuw i8, ptr %119, i64 64
  %122 = getelementptr inbounds nuw i8, ptr %119, i64 96
  store <8 x float> %115, ptr %119, align 64, !alias.scope !5
  store <8 x float> %116, ptr %120, align 32, !alias.scope !5
  store <8 x float> %117, ptr %121, align 64, !alias.scope !5
  store <8 x float> %118, ptr %122, align 32, !alias.scope !5
  %123 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 320
  %124 = getelementptr inbounds nuw i8, ptr %123, i64 32
  %125 = getelementptr inbounds nuw i8, ptr %123, i64 64
  %126 = getelementptr inbounds nuw i8, ptr %123, i64 96
  %wide.load.10 = load <8 x float>, ptr %123, align 64, !invariant.load !1, !noalias !5
  %wide.load16.10 = load <8 x float>, ptr %124, align 32, !invariant.load !1, !noalias !5
  %wide.load17.10 = load <8 x float>, ptr %125, align 64, !invariant.load !1, !noalias !5
  %wide.load18.10 = load <8 x float>, ptr %126, align 32, !invariant.load !1, !noalias !5
  %127 = fdiv <8 x float> %wide.load.10, %broadcast.splat
  %128 = fdiv <8 x float> %wide.load16.10, %broadcast.splat
  %129 = fdiv <8 x float> %wide.load17.10, %broadcast.splat
  %130 = fdiv <8 x float> %wide.load18.10, %broadcast.splat
  %131 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 320
  %132 = getelementptr inbounds nuw i8, ptr %131, i64 32
  %133 = getelementptr inbounds nuw i8, ptr %131, i64 64
  %134 = getelementptr inbounds nuw i8, ptr %131, i64 96
  store <8 x float> %127, ptr %131, align 64, !alias.scope !5
  store <8 x float> %128, ptr %132, align 32, !alias.scope !5
  store <8 x float> %129, ptr %133, align 64, !alias.scope !5
  store <8 x float> %130, ptr %134, align 32, !alias.scope !5
  %135 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 352
  %136 = getelementptr inbounds nuw i8, ptr %135, i64 32
  %137 = getelementptr inbounds nuw i8, ptr %135, i64 64
  %138 = getelementptr inbounds nuw i8, ptr %135, i64 96
  %wide.load.11 = load <8 x float>, ptr %135, align 64, !invariant.load !1, !noalias !5
  %wide.load16.11 = load <8 x float>, ptr %136, align 32, !invariant.load !1, !noalias !5
  %wide.load17.11 = load <8 x float>, ptr %137, align 64, !invariant.load !1, !noalias !5
  %wide.load18.11 = load <8 x float>, ptr %138, align 32, !invariant.load !1, !noalias !5
  %139 = fdiv <8 x float> %wide.load.11, %broadcast.splat
  %140 = fdiv <8 x float> %wide.load16.11, %broadcast.splat
  %141 = fdiv <8 x float> %wide.load17.11, %broadcast.splat
  %142 = fdiv <8 x float> %wide.load18.11, %broadcast.splat
  %143 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 352
  %144 = getelementptr inbounds nuw i8, ptr %143, i64 32
  %145 = getelementptr inbounds nuw i8, ptr %143, i64 64
  %146 = getelementptr inbounds nuw i8, ptr %143, i64 96
  store <8 x float> %139, ptr %143, align 64, !alias.scope !5
  store <8 x float> %140, ptr %144, align 32, !alias.scope !5
  store <8 x float> %141, ptr %145, align 64, !alias.scope !5
  store <8 x float> %142, ptr %146, align 32, !alias.scope !5
  %147 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 384
  %148 = getelementptr inbounds nuw i8, ptr %147, i64 32
  %149 = getelementptr inbounds nuw i8, ptr %147, i64 64
  %150 = getelementptr inbounds nuw i8, ptr %147, i64 96
  %wide.load.12 = load <8 x float>, ptr %147, align 64, !invariant.load !1, !noalias !5
  %wide.load16.12 = load <8 x float>, ptr %148, align 32, !invariant.load !1, !noalias !5
  %wide.load17.12 = load <8 x float>, ptr %149, align 64, !invariant.load !1, !noalias !5
  %wide.load18.12 = load <8 x float>, ptr %150, align 32, !invariant.load !1, !noalias !5
  %151 = fdiv <8 x float> %wide.load.12, %broadcast.splat
  %152 = fdiv <8 x float> %wide.load16.12, %broadcast.splat
  %153 = fdiv <8 x float> %wide.load17.12, %broadcast.splat
  %154 = fdiv <8 x float> %wide.load18.12, %broadcast.splat
  %155 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 384
  %156 = getelementptr inbounds nuw i8, ptr %155, i64 32
  %157 = getelementptr inbounds nuw i8, ptr %155, i64 64
  %158 = getelementptr inbounds nuw i8, ptr %155, i64 96
  store <8 x float> %151, ptr %155, align 64, !alias.scope !5
  store <8 x float> %152, ptr %156, align 32, !alias.scope !5
  store <8 x float> %153, ptr %157, align 64, !alias.scope !5
  store <8 x float> %154, ptr %158, align 32, !alias.scope !5
  %159 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 416
  %160 = getelementptr inbounds nuw i8, ptr %159, i64 32
  %161 = getelementptr inbounds nuw i8, ptr %159, i64 64
  %162 = getelementptr inbounds nuw i8, ptr %159, i64 96
  %wide.load.13 = load <8 x float>, ptr %159, align 64, !invariant.load !1, !noalias !5
  %wide.load16.13 = load <8 x float>, ptr %160, align 32, !invariant.load !1, !noalias !5
  %wide.load17.13 = load <8 x float>, ptr %161, align 64, !invariant.load !1, !noalias !5
  %wide.load18.13 = load <8 x float>, ptr %162, align 32, !invariant.load !1, !noalias !5
  %163 = fdiv <8 x float> %wide.load.13, %broadcast.splat
  %164 = fdiv <8 x float> %wide.load16.13, %broadcast.splat
  %165 = fdiv <8 x float> %wide.load17.13, %broadcast.splat
  %166 = fdiv <8 x float> %wide.load18.13, %broadcast.splat
  %167 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 416
  %168 = getelementptr inbounds nuw i8, ptr %167, i64 32
  %169 = getelementptr inbounds nuw i8, ptr %167, i64 64
  %170 = getelementptr inbounds nuw i8, ptr %167, i64 96
  store <8 x float> %163, ptr %167, align 64, !alias.scope !5
  store <8 x float> %164, ptr %168, align 32, !alias.scope !5
  store <8 x float> %165, ptr %169, align 64, !alias.scope !5
  store <8 x float> %166, ptr %170, align 32, !alias.scope !5
  %171 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 448
  %172 = getelementptr inbounds nuw i8, ptr %171, i64 32
  %173 = getelementptr inbounds nuw i8, ptr %171, i64 64
  %174 = getelementptr inbounds nuw i8, ptr %171, i64 96
  %wide.load.14 = load <8 x float>, ptr %171, align 64, !invariant.load !1, !noalias !5
  %wide.load16.14 = load <8 x float>, ptr %172, align 32, !invariant.load !1, !noalias !5
  %wide.load17.14 = load <8 x float>, ptr %173, align 64, !invariant.load !1, !noalias !5
  %wide.load18.14 = load <8 x float>, ptr %174, align 32, !invariant.load !1, !noalias !5
  %175 = fdiv <8 x float> %wide.load.14, %broadcast.splat
  %176 = fdiv <8 x float> %wide.load16.14, %broadcast.splat
  %177 = fdiv <8 x float> %wide.load17.14, %broadcast.splat
  %178 = fdiv <8 x float> %wide.load18.14, %broadcast.splat
  %179 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 448
  %180 = getelementptr inbounds nuw i8, ptr %179, i64 32
  %181 = getelementptr inbounds nuw i8, ptr %179, i64 64
  %182 = getelementptr inbounds nuw i8, ptr %179, i64 96
  store <8 x float> %175, ptr %179, align 64, !alias.scope !5
  store <8 x float> %176, ptr %180, align 32, !alias.scope !5
  store <8 x float> %177, ptr %181, align 64, !alias.scope !5
  store <8 x float> %178, ptr %182, align 32, !alias.scope !5
  %183 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 480
  %184 = getelementptr inbounds nuw i8, ptr %183, i64 32
  %185 = getelementptr inbounds nuw i8, ptr %183, i64 64
  %186 = getelementptr inbounds nuw i8, ptr %183, i64 96
  %wide.load.15 = load <8 x float>, ptr %183, align 64, !invariant.load !1, !noalias !5
  %wide.load16.15 = load <8 x float>, ptr %184, align 32, !invariant.load !1, !noalias !5
  %wide.load17.15 = load <8 x float>, ptr %185, align 64, !invariant.load !1, !noalias !5
  %wide.load18.15 = load <8 x float>, ptr %186, align 32, !invariant.load !1, !noalias !5
  %187 = fdiv <8 x float> %wide.load.15, %broadcast.splat
  %188 = fdiv <8 x float> %wide.load16.15, %broadcast.splat
  %189 = fdiv <8 x float> %wide.load17.15, %broadcast.splat
  %190 = fdiv <8 x float> %wide.load18.15, %broadcast.splat
  %191 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, i64 480
  %192 = getelementptr inbounds nuw i8, ptr %191, i64 32
  %193 = getelementptr inbounds nuw i8, ptr %191, i64 64
  %194 = getelementptr inbounds nuw i8, ptr %191, i64 96
  store <8 x float> %187, ptr %191, align 64, !alias.scope !5
  store <8 x float> %188, ptr %192, align 32, !alias.scope !5
  store <8 x float> %189, ptr %193, align 64, !alias.scope !5
  store <8 x float> %190, ptr %194, align 32, !alias.scope !5
  %invar.inc6 = add nuw nsw i64 %broadcast_divide_fusion.clone.invar_address.dim.2.09, 1
  %exitcond13 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond13, label %broadcast_divide_fusion.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !8

broadcast_divide_fusion.clone.loop_exit.dim.2:    ; preds = %vector.ph
  %invar.inc5 = add nuw nsw i64 %broadcast_divide_fusion.clone.invar_address.dim.1.010, 1
  %exitcond14 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond14, label %broadcast_divide_fusion.clone.loop_exit.dim.1, label %broadcast_divide_fusion.clone.loop_header.dim.2.preheader, !llvm.loop !10

broadcast_divide_fusion.clone.loop_exit.dim.1:    ; preds = %broadcast_divide_fusion.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %broadcast_divide_fusion.clone.invar_address.dim.0.012, 1
  %exitcond15.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond15.not, label %return, label %broadcast_divide_fusion.clone.loop_header.dim.1.preheader, !llvm.loop !11

return:                                           ; preds = %broadcast_divide_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 536870912}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:536870912}", !7}
!7 = !{!"XLA host kernel broadcast_divide_fusion.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !9}
