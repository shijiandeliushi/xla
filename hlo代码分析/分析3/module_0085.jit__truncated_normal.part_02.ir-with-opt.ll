; ModuleID = '__compute_module_part_02'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_add_fusion.3.clone_parallel_bounds = private unnamed_addr constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 341]], [1 x [2 x i64]] [[2 x i64] [i64 341, i64 682]], [1 x [2 x i64]] [[2 x i64] [i64 682, i64 1023]], [1 x [2 x i64]] [[2 x i64] [i64 1023, i64 1364]], [1 x [2 x i64]] [[2 x i64] [i64 1364, i64 1705]], [1 x [2 x i64]] [[2 x i64] [i64 1705, i64 2046]], [1 x [2 x i64]] [[2 x i64] [i64 2046, i64 2387]], [1 x [2 x i64]] [[2 x i64] [i64 2387, i64 2728]], [1 x [2 x i64]] [[2 x i64] [i64 2728, i64 3069]], [1 x [2 x i64]] [[2 x i64] [i64 3069, i64 3410]], [1 x [2 x i64]] [[2 x i64] [i64 3410, i64 3751]], [1 x [2 x i64]] [[2 x i64] [i64 3751, i64 4096]]]

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

vector.ph:                                        ; preds = %vector.ph, %broadcast_add_fusion.3.clone.loop_header.dim.1.preheader.lr.ph
  %broadcast_add_fusion.3.clone.invar_address.dim.0.03 = phi i64 [ %lo_dim_0, %broadcast_add_fusion.3.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %vector.ph ]
  %3 = lshr i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, 22
  %4 = trunc i64 %3 to i32
  %5 = add i32 %2, %4
  %broadcast.splatinsert = insertelement <8 x i32> poison, i32 %5, i64 0
  %broadcast.splat = shufflevector <8 x i32> %broadcast.splatinsert, <8 x i32> poison, <8 x i32> zeroinitializer
  %6 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 0
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  store <8 x i32> %broadcast.splat, ptr %6, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %7, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %8, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %9, align 32, !alias.scope !5
  %10 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 32
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  store <8 x i32> %broadcast.splat, ptr %10, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %11, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %12, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %13, align 32, !alias.scope !5
  %14 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 64
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  store <8 x i32> %broadcast.splat, ptr %14, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %15, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %16, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %17, align 32, !alias.scope !5
  %18 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 96
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 64
  %21 = getelementptr inbounds nuw i8, ptr %18, i64 96
  store <8 x i32> %broadcast.splat, ptr %18, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %19, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %20, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %21, align 32, !alias.scope !5
  %22 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 128
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x i32> %broadcast.splat, ptr %22, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %23, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %24, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %25, align 32, !alias.scope !5
  %26 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 160
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  store <8 x i32> %broadcast.splat, ptr %26, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %27, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %28, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %29, align 32, !alias.scope !5
  %30 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 192
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 64
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 96
  store <8 x i32> %broadcast.splat, ptr %30, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %31, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %32, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %33, align 32, !alias.scope !5
  %34 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 224
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  store <8 x i32> %broadcast.splat, ptr %34, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %35, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %36, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %37, align 32, !alias.scope !5
  %38 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 256
  %39 = getelementptr inbounds nuw i8, ptr %38, i64 32
  %40 = getelementptr inbounds nuw i8, ptr %38, i64 64
  %41 = getelementptr inbounds nuw i8, ptr %38, i64 96
  store <8 x i32> %broadcast.splat, ptr %38, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %39, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %40, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %41, align 32, !alias.scope !5
  %42 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 288
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 32
  %44 = getelementptr inbounds nuw i8, ptr %42, i64 64
  %45 = getelementptr inbounds nuw i8, ptr %42, i64 96
  store <8 x i32> %broadcast.splat, ptr %42, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %43, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %44, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %45, align 32, !alias.scope !5
  %46 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 320
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x i32> %broadcast.splat, ptr %46, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %47, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %48, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %49, align 32, !alias.scope !5
  %50 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 352
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 64
  %53 = getelementptr inbounds nuw i8, ptr %50, i64 96
  store <8 x i32> %broadcast.splat, ptr %50, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %51, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %52, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %53, align 32, !alias.scope !5
  %54 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 384
  %55 = getelementptr inbounds nuw i8, ptr %54, i64 32
  %56 = getelementptr inbounds nuw i8, ptr %54, i64 64
  %57 = getelementptr inbounds nuw i8, ptr %54, i64 96
  store <8 x i32> %broadcast.splat, ptr %54, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %55, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %56, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %57, align 32, !alias.scope !5
  %58 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 416
  %59 = getelementptr inbounds nuw i8, ptr %58, i64 32
  %60 = getelementptr inbounds nuw i8, ptr %58, i64 64
  %61 = getelementptr inbounds nuw i8, ptr %58, i64 96
  store <8 x i32> %broadcast.splat, ptr %58, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %59, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %60, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %61, align 32, !alias.scope !5
  %62 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 448
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 32
  %64 = getelementptr inbounds nuw i8, ptr %62, i64 64
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 96
  store <8 x i32> %broadcast.splat, ptr %62, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %63, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %64, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %65, align 32, !alias.scope !5
  %66 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 480
  %67 = getelementptr inbounds nuw i8, ptr %66, i64 32
  %68 = getelementptr inbounds nuw i8, ptr %66, i64 64
  %69 = getelementptr inbounds nuw i8, ptr %66, i64 96
  store <8 x i32> %broadcast.splat, ptr %66, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %67, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %68, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %69, align 32, !alias.scope !5
  %70 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 512
  %71 = getelementptr inbounds nuw i8, ptr %70, i64 32
  %72 = getelementptr inbounds nuw i8, ptr %70, i64 64
  %73 = getelementptr inbounds nuw i8, ptr %70, i64 96
  store <8 x i32> %broadcast.splat, ptr %70, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %71, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %72, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %73, align 32, !alias.scope !5
  %74 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 544
  %75 = getelementptr inbounds nuw i8, ptr %74, i64 32
  %76 = getelementptr inbounds nuw i8, ptr %74, i64 64
  %77 = getelementptr inbounds nuw i8, ptr %74, i64 96
  store <8 x i32> %broadcast.splat, ptr %74, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %75, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %76, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %77, align 32, !alias.scope !5
  %78 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 576
  %79 = getelementptr inbounds nuw i8, ptr %78, i64 32
  %80 = getelementptr inbounds nuw i8, ptr %78, i64 64
  %81 = getelementptr inbounds nuw i8, ptr %78, i64 96
  store <8 x i32> %broadcast.splat, ptr %78, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %79, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %80, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %81, align 32, !alias.scope !5
  %82 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 608
  %83 = getelementptr inbounds nuw i8, ptr %82, i64 32
  %84 = getelementptr inbounds nuw i8, ptr %82, i64 64
  %85 = getelementptr inbounds nuw i8, ptr %82, i64 96
  store <8 x i32> %broadcast.splat, ptr %82, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %83, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %84, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %85, align 32, !alias.scope !5
  %86 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 640
  %87 = getelementptr inbounds nuw i8, ptr %86, i64 32
  %88 = getelementptr inbounds nuw i8, ptr %86, i64 64
  %89 = getelementptr inbounds nuw i8, ptr %86, i64 96
  store <8 x i32> %broadcast.splat, ptr %86, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %87, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %88, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %89, align 32, !alias.scope !5
  %90 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 672
  %91 = getelementptr inbounds nuw i8, ptr %90, i64 32
  %92 = getelementptr inbounds nuw i8, ptr %90, i64 64
  %93 = getelementptr inbounds nuw i8, ptr %90, i64 96
  store <8 x i32> %broadcast.splat, ptr %90, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %91, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %92, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %93, align 32, !alias.scope !5
  %94 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 704
  %95 = getelementptr inbounds nuw i8, ptr %94, i64 32
  %96 = getelementptr inbounds nuw i8, ptr %94, i64 64
  %97 = getelementptr inbounds nuw i8, ptr %94, i64 96
  store <8 x i32> %broadcast.splat, ptr %94, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %95, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %96, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %97, align 32, !alias.scope !5
  %98 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 736
  %99 = getelementptr inbounds nuw i8, ptr %98, i64 32
  %100 = getelementptr inbounds nuw i8, ptr %98, i64 64
  %101 = getelementptr inbounds nuw i8, ptr %98, i64 96
  store <8 x i32> %broadcast.splat, ptr %98, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %99, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %100, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %101, align 32, !alias.scope !5
  %102 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 768
  %103 = getelementptr inbounds nuw i8, ptr %102, i64 32
  %104 = getelementptr inbounds nuw i8, ptr %102, i64 64
  %105 = getelementptr inbounds nuw i8, ptr %102, i64 96
  store <8 x i32> %broadcast.splat, ptr %102, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %103, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %104, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %105, align 32, !alias.scope !5
  %106 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 800
  %107 = getelementptr inbounds nuw i8, ptr %106, i64 32
  %108 = getelementptr inbounds nuw i8, ptr %106, i64 64
  %109 = getelementptr inbounds nuw i8, ptr %106, i64 96
  store <8 x i32> %broadcast.splat, ptr %106, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %107, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %108, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %109, align 32, !alias.scope !5
  %110 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 832
  %111 = getelementptr inbounds nuw i8, ptr %110, i64 32
  %112 = getelementptr inbounds nuw i8, ptr %110, i64 64
  %113 = getelementptr inbounds nuw i8, ptr %110, i64 96
  store <8 x i32> %broadcast.splat, ptr %110, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %111, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %112, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %113, align 32, !alias.scope !5
  %114 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 864
  %115 = getelementptr inbounds nuw i8, ptr %114, i64 32
  %116 = getelementptr inbounds nuw i8, ptr %114, i64 64
  %117 = getelementptr inbounds nuw i8, ptr %114, i64 96
  store <8 x i32> %broadcast.splat, ptr %114, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %115, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %116, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %117, align 32, !alias.scope !5
  %118 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 896
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 32
  %120 = getelementptr inbounds nuw i8, ptr %118, i64 64
  %121 = getelementptr inbounds nuw i8, ptr %118, i64 96
  store <8 x i32> %broadcast.splat, ptr %118, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %119, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %120, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %121, align 32, !alias.scope !5
  %122 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 928
  %123 = getelementptr inbounds nuw i8, ptr %122, i64 32
  %124 = getelementptr inbounds nuw i8, ptr %122, i64 64
  %125 = getelementptr inbounds nuw i8, ptr %122, i64 96
  store <8 x i32> %broadcast.splat, ptr %122, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %123, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %124, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %125, align 32, !alias.scope !5
  %126 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 960
  %127 = getelementptr inbounds nuw i8, ptr %126, i64 32
  %128 = getelementptr inbounds nuw i8, ptr %126, i64 64
  %129 = getelementptr inbounds nuw i8, ptr %126, i64 96
  store <8 x i32> %broadcast.splat, ptr %126, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %127, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %128, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %129, align 32, !alias.scope !5
  %130 = getelementptr inbounds [4096 x [1024 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, i64 992
  %131 = getelementptr inbounds nuw i8, ptr %130, i64 32
  %132 = getelementptr inbounds nuw i8, ptr %130, i64 64
  %133 = getelementptr inbounds nuw i8, ptr %130, i64 96
  store <8 x i32> %broadcast.splat, ptr %130, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %131, align 32, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %132, align 64, !alias.scope !5
  store <8 x i32> %broadcast.splat, ptr %133, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.3.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph, %1
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
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
