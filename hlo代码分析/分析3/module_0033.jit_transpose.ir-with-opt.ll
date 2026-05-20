; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@transpose_copy_fusion.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @transpose_copy_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @transpose_copy_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not9 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not9, label %transpose_copy_fusion.clone.loop_header.dim.1.preheader, label %return

transpose_copy_fusion.clone.loop_header.dim.1.preheader: ; preds = %1, %transpose_copy_fusion.clone.loop_exit.dim.1
  %transpose_copy_fusion.clone.invar_address.dim.0.010 = phi i64 [ %invar.inc, %transpose_copy_fusion.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %transpose_copy_fusion.clone.loop_header.dim.2.preheader

transpose_copy_fusion.clone.loop_header.dim.2.preheader: ; preds = %transpose_copy_fusion.clone.loop_header.dim.1.preheader, %transpose_copy_fusion.clone.loop_exit.dim.2
  %transpose_copy_fusion.clone.invar_address.dim.1.08 = phi i64 [ 0, %transpose_copy_fusion.clone.loop_header.dim.1.preheader ], [ %invar.inc3, %transpose_copy_fusion.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %transpose_copy_fusion.clone.loop_exit.dim.3, %transpose_copy_fusion.clone.loop_header.dim.2.preheader
  %transpose_copy_fusion.clone.invar_address.dim.2.07 = phi i64 [ 0, %transpose_copy_fusion.clone.loop_header.dim.2.preheader ], [ %invar.inc4, %transpose_copy_fusion.clone.loop_exit.dim.3 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = or disjoint i64 %index, 1
  %3 = or disjoint i64 %index, 2
  %4 = or disjoint i64 %index, 3
  %5 = or disjoint i64 %index, 4
  %6 = or disjoint i64 %index, 5
  %7 = or disjoint i64 %index, 6
  %8 = or disjoint i64 %index, 7
  %9 = or disjoint i64 %index, 8
  %10 = or disjoint i64 %index, 9
  %11 = or disjoint i64 %index, 10
  %12 = or disjoint i64 %index, 11
  %13 = or disjoint i64 %index, 12
  %14 = or disjoint i64 %index, 13
  %15 = or disjoint i64 %index, 14
  %16 = or disjoint i64 %index, 15
  %17 = or disjoint i64 %index, 16
  %18 = or disjoint i64 %index, 17
  %19 = or disjoint i64 %index, 18
  %20 = or disjoint i64 %index, 19
  %21 = or disjoint i64 %index, 20
  %22 = or disjoint i64 %index, 21
  %23 = or disjoint i64 %index, 22
  %24 = or disjoint i64 %index, 23
  %25 = or disjoint i64 %index, 24
  %26 = or disjoint i64 %index, 25
  %27 = or disjoint i64 %index, 26
  %28 = or disjoint i64 %index, 27
  %29 = or disjoint i64 %index, 28
  %30 = or disjoint i64 %index, 29
  %31 = or disjoint i64 %index, 30
  %32 = or disjoint i64 %index, 31
  %33 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %index, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %34 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %2, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %35 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %3, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %36 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %4, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %37 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %5, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %38 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %6, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %39 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %7, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %40 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %8, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %41 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %9, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %42 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %10, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %43 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %11, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %44 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %12, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %45 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %13, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %46 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %14, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %47 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %15, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %48 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %16, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %49 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %17, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %50 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %18, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %51 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %19, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %52 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %20, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %53 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %21, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %54 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %22, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %55 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %23, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %56 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %24, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %57 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %25, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %58 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %26, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %59 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %27, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %60 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %28, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %61 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %29, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %62 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %30, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %63 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %31, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %64 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %32, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07
  %65 = load float, ptr %33, align 4, !invariant.load !1, !noalias !4
  %66 = load float, ptr %34, align 4, !invariant.load !1, !noalias !4
  %67 = load float, ptr %35, align 4, !invariant.load !1, !noalias !4
  %68 = load float, ptr %36, align 4, !invariant.load !1, !noalias !4
  %69 = load float, ptr %37, align 4, !invariant.load !1, !noalias !4
  %70 = load float, ptr %38, align 4, !invariant.load !1, !noalias !4
  %71 = load float, ptr %39, align 4, !invariant.load !1, !noalias !4
  %72 = load float, ptr %40, align 4, !invariant.load !1, !noalias !4
  %73 = insertelement <8 x float> poison, float %65, i64 0
  %74 = insertelement <8 x float> %73, float %66, i64 1
  %75 = insertelement <8 x float> %74, float %67, i64 2
  %76 = insertelement <8 x float> %75, float %68, i64 3
  %77 = insertelement <8 x float> %76, float %69, i64 4
  %78 = insertelement <8 x float> %77, float %70, i64 5
  %79 = insertelement <8 x float> %78, float %71, i64 6
  %80 = insertelement <8 x float> %79, float %72, i64 7
  %81 = load float, ptr %41, align 4, !invariant.load !1, !noalias !4
  %82 = load float, ptr %42, align 4, !invariant.load !1, !noalias !4
  %83 = load float, ptr %43, align 4, !invariant.load !1, !noalias !4
  %84 = load float, ptr %44, align 4, !invariant.load !1, !noalias !4
  %85 = load float, ptr %45, align 4, !invariant.load !1, !noalias !4
  %86 = load float, ptr %46, align 4, !invariant.load !1, !noalias !4
  %87 = load float, ptr %47, align 4, !invariant.load !1, !noalias !4
  %88 = load float, ptr %48, align 4, !invariant.load !1, !noalias !4
  %89 = insertelement <8 x float> poison, float %81, i64 0
  %90 = insertelement <8 x float> %89, float %82, i64 1
  %91 = insertelement <8 x float> %90, float %83, i64 2
  %92 = insertelement <8 x float> %91, float %84, i64 3
  %93 = insertelement <8 x float> %92, float %85, i64 4
  %94 = insertelement <8 x float> %93, float %86, i64 5
  %95 = insertelement <8 x float> %94, float %87, i64 6
  %96 = insertelement <8 x float> %95, float %88, i64 7
  %97 = load float, ptr %49, align 4, !invariant.load !1, !noalias !4
  %98 = load float, ptr %50, align 4, !invariant.load !1, !noalias !4
  %99 = load float, ptr %51, align 4, !invariant.load !1, !noalias !4
  %100 = load float, ptr %52, align 4, !invariant.load !1, !noalias !4
  %101 = load float, ptr %53, align 4, !invariant.load !1, !noalias !4
  %102 = load float, ptr %54, align 4, !invariant.load !1, !noalias !4
  %103 = load float, ptr %55, align 4, !invariant.load !1, !noalias !4
  %104 = load float, ptr %56, align 4, !invariant.load !1, !noalias !4
  %105 = insertelement <8 x float> poison, float %97, i64 0
  %106 = insertelement <8 x float> %105, float %98, i64 1
  %107 = insertelement <8 x float> %106, float %99, i64 2
  %108 = insertelement <8 x float> %107, float %100, i64 3
  %109 = insertelement <8 x float> %108, float %101, i64 4
  %110 = insertelement <8 x float> %109, float %102, i64 5
  %111 = insertelement <8 x float> %110, float %103, i64 6
  %112 = insertelement <8 x float> %111, float %104, i64 7
  %113 = load float, ptr %57, align 4, !invariant.load !1, !noalias !4
  %114 = load float, ptr %58, align 4, !invariant.load !1, !noalias !4
  %115 = load float, ptr %59, align 4, !invariant.load !1, !noalias !4
  %116 = load float, ptr %60, align 4, !invariant.load !1, !noalias !4
  %117 = load float, ptr %61, align 4, !invariant.load !1, !noalias !4
  %118 = load float, ptr %62, align 4, !invariant.load !1, !noalias !4
  %119 = load float, ptr %63, align 4, !invariant.load !1, !noalias !4
  %120 = load float, ptr %64, align 4, !invariant.load !1, !noalias !4
  %121 = insertelement <8 x float> poison, float %113, i64 0
  %122 = insertelement <8 x float> %121, float %114, i64 1
  %123 = insertelement <8 x float> %122, float %115, i64 2
  %124 = insertelement <8 x float> %123, float %116, i64 3
  %125 = insertelement <8 x float> %124, float %117, i64 4
  %126 = insertelement <8 x float> %125, float %118, i64 5
  %127 = insertelement <8 x float> %126, float %119, i64 6
  %128 = insertelement <8 x float> %127, float %120, i64 7
  %129 = getelementptr inbounds [32 x [16 x [64 x [512 x float]]]], ptr %arg1, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, i64 %index
  %130 = getelementptr inbounds nuw i8, ptr %129, i64 32
  %131 = getelementptr inbounds nuw i8, ptr %129, i64 64
  %132 = getelementptr inbounds nuw i8, ptr %129, i64 96
  store <8 x float> %80, ptr %129, align 64, !alias.scope !4
  store <8 x float> %96, ptr %130, align 32, !alias.scope !4
  store <8 x float> %112, ptr %131, align 64, !alias.scope !4
  store <8 x float> %128, ptr %132, align 32, !alias.scope !4
  %index.next = add nuw i64 %index, 32
  %133 = icmp eq i64 %index.next, 512
  br i1 %133, label %transpose_copy_fusion.clone.loop_exit.dim.3, label %vector.body, !llvm.loop !7

transpose_copy_fusion.clone.loop_exit.dim.3:      ; preds = %vector.body
  %invar.inc4 = add nuw nsw i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, 1
  %exitcond11 = icmp eq i64 %invar.inc4, 64
  br i1 %exitcond11, label %transpose_copy_fusion.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !10

transpose_copy_fusion.clone.loop_exit.dim.2:      ; preds = %transpose_copy_fusion.clone.loop_exit.dim.3
  %invar.inc3 = add nuw nsw i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, 1
  %exitcond12 = icmp eq i64 %invar.inc3, 16
  br i1 %exitcond12, label %transpose_copy_fusion.clone.loop_exit.dim.1, label %transpose_copy_fusion.clone.loop_header.dim.2.preheader, !llvm.loop !12

transpose_copy_fusion.clone.loop_exit.dim.1:      ; preds = %transpose_copy_fusion.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, 1
  %exitcond13.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond13.not, label %return, label %transpose_copy_fusion.clone.loop_header.dim.1.preheader, !llvm.loop !13

return:                                           ; preds = %transpose_copy_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 67108864}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:67108864}", !6}
!6 = !{!"XLA host kernel transpose_copy_fusion.clone AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
