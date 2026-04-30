; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_multiply_fusion.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 128]], [1 x [2 x i64]] [[2 x i64] [i64 128, i64 256]], [1 x [2 x i64]] [[2 x i64] [i64 256, i64 384]], [1 x [2 x i64]] [[2 x i64] [i64 384, i64 512]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_multiply_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_multiply_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not7 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not7, label %broadcast_multiply_fusion.clone.loop_header.dim.1.preheader.lr.ph, label %return

broadcast_multiply_fusion.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load float, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_multiply_fusion.clone.loop_header.dim.1.preheader.lr.ph
  %broadcast_multiply_fusion.clone.invar_address.dim.0.08 = phi i64 [ %lo_dim_0, %broadcast_multiply_fusion.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %vector.ph ]
  %3 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 0
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 96
  %wide.load = load <8 x float>, ptr %3, align 64, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %4, align 32, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %5, align 64, !invariant.load !1, !noalias !5
  %wide.load12 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %7 = fmul <8 x float> %wide.load, %broadcast.splat
  %8 = fmul <8 x float> %wide.load10, %broadcast.splat
  %9 = fmul <8 x float> %wide.load11, %broadcast.splat
  %10 = fmul <8 x float> %wide.load12, %broadcast.splat
  %11 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 0
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 96
  store <8 x float> %7, ptr %11, align 64, !alias.scope !5
  store <8 x float> %8, ptr %12, align 32, !alias.scope !5
  store <8 x float> %9, ptr %13, align 64, !alias.scope !5
  store <8 x float> %10, ptr %14, align 32, !alias.scope !5
  %15 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 96
  %wide.load.1 = load <8 x float>, ptr %15, align 64, !invariant.load !1, !noalias !5
  %wide.load10.1 = load <8 x float>, ptr %16, align 32, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %17, align 64, !invariant.load !1, !noalias !5
  %wide.load12.1 = load <8 x float>, ptr %18, align 32, !invariant.load !1, !noalias !5
  %19 = fmul <8 x float> %wide.load.1, %broadcast.splat
  %20 = fmul <8 x float> %wide.load10.1, %broadcast.splat
  %21 = fmul <8 x float> %wide.load11.1, %broadcast.splat
  %22 = fmul <8 x float> %wide.load12.1, %broadcast.splat
  %23 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %26 = getelementptr inbounds nuw i8, ptr %23, i64 96
  store <8 x float> %19, ptr %23, align 64, !alias.scope !5
  store <8 x float> %20, ptr %24, align 32, !alias.scope !5
  store <8 x float> %21, ptr %25, align 64, !alias.scope !5
  store <8 x float> %22, ptr %26, align 32, !alias.scope !5
  %27 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 64
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 64
  %30 = getelementptr inbounds nuw i8, ptr %27, i64 96
  %wide.load.2 = load <8 x float>, ptr %27, align 64, !invariant.load !1, !noalias !5
  %wide.load10.2 = load <8 x float>, ptr %28, align 32, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %29, align 64, !invariant.load !1, !noalias !5
  %wide.load12.2 = load <8 x float>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %31 = fmul <8 x float> %wide.load.2, %broadcast.splat
  %32 = fmul <8 x float> %wide.load10.2, %broadcast.splat
  %33 = fmul <8 x float> %wide.load11.2, %broadcast.splat
  %34 = fmul <8 x float> %wide.load12.2, %broadcast.splat
  %35 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 32
  %37 = getelementptr inbounds nuw i8, ptr %35, i64 64
  %38 = getelementptr inbounds nuw i8, ptr %35, i64 96
  store <8 x float> %31, ptr %35, align 64, !alias.scope !5
  store <8 x float> %32, ptr %36, align 32, !alias.scope !5
  store <8 x float> %33, ptr %37, align 64, !alias.scope !5
  store <8 x float> %34, ptr %38, align 32, !alias.scope !5
  %39 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 96
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %39, i64 96
  %wide.load.3 = load <8 x float>, ptr %39, align 64, !invariant.load !1, !noalias !5
  %wide.load10.3 = load <8 x float>, ptr %40, align 32, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %41, align 64, !invariant.load !1, !noalias !5
  %wide.load12.3 = load <8 x float>, ptr %42, align 32, !invariant.load !1, !noalias !5
  %43 = fmul <8 x float> %wide.load.3, %broadcast.splat
  %44 = fmul <8 x float> %wide.load10.3, %broadcast.splat
  %45 = fmul <8 x float> %wide.load11.3, %broadcast.splat
  %46 = fmul <8 x float> %wide.load12.3, %broadcast.splat
  %47 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 96
  %48 = getelementptr inbounds nuw i8, ptr %47, i64 32
  %49 = getelementptr inbounds nuw i8, ptr %47, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %47, i64 96
  store <8 x float> %43, ptr %47, align 64, !alias.scope !5
  store <8 x float> %44, ptr %48, align 32, !alias.scope !5
  store <8 x float> %45, ptr %49, align 64, !alias.scope !5
  store <8 x float> %46, ptr %50, align 32, !alias.scope !5
  %51 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 128
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 32
  %53 = getelementptr inbounds nuw i8, ptr %51, i64 64
  %54 = getelementptr inbounds nuw i8, ptr %51, i64 96
  %wide.load.4 = load <8 x float>, ptr %51, align 64, !invariant.load !1, !noalias !5
  %wide.load10.4 = load <8 x float>, ptr %52, align 32, !invariant.load !1, !noalias !5
  %wide.load11.4 = load <8 x float>, ptr %53, align 64, !invariant.load !1, !noalias !5
  %wide.load12.4 = load <8 x float>, ptr %54, align 32, !invariant.load !1, !noalias !5
  %55 = fmul <8 x float> %wide.load.4, %broadcast.splat
  %56 = fmul <8 x float> %wide.load10.4, %broadcast.splat
  %57 = fmul <8 x float> %wide.load11.4, %broadcast.splat
  %58 = fmul <8 x float> %wide.load12.4, %broadcast.splat
  %59 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 128
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 32
  %61 = getelementptr inbounds nuw i8, ptr %59, i64 64
  %62 = getelementptr inbounds nuw i8, ptr %59, i64 96
  store <8 x float> %55, ptr %59, align 64, !alias.scope !5
  store <8 x float> %56, ptr %60, align 32, !alias.scope !5
  store <8 x float> %57, ptr %61, align 64, !alias.scope !5
  store <8 x float> %58, ptr %62, align 32, !alias.scope !5
  %63 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 160
  %64 = getelementptr inbounds nuw i8, ptr %63, i64 32
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 64
  %66 = getelementptr inbounds nuw i8, ptr %63, i64 96
  %wide.load.5 = load <8 x float>, ptr %63, align 64, !invariant.load !1, !noalias !5
  %wide.load10.5 = load <8 x float>, ptr %64, align 32, !invariant.load !1, !noalias !5
  %wide.load11.5 = load <8 x float>, ptr %65, align 64, !invariant.load !1, !noalias !5
  %wide.load12.5 = load <8 x float>, ptr %66, align 32, !invariant.load !1, !noalias !5
  %67 = fmul <8 x float> %wide.load.5, %broadcast.splat
  %68 = fmul <8 x float> %wide.load10.5, %broadcast.splat
  %69 = fmul <8 x float> %wide.load11.5, %broadcast.splat
  %70 = fmul <8 x float> %wide.load12.5, %broadcast.splat
  %71 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 160
  %72 = getelementptr inbounds nuw i8, ptr %71, i64 32
  %73 = getelementptr inbounds nuw i8, ptr %71, i64 64
  %74 = getelementptr inbounds nuw i8, ptr %71, i64 96
  store <8 x float> %67, ptr %71, align 64, !alias.scope !5
  store <8 x float> %68, ptr %72, align 32, !alias.scope !5
  store <8 x float> %69, ptr %73, align 64, !alias.scope !5
  store <8 x float> %70, ptr %74, align 32, !alias.scope !5
  %75 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 192
  %76 = getelementptr inbounds nuw i8, ptr %75, i64 32
  %77 = getelementptr inbounds nuw i8, ptr %75, i64 64
  %78 = getelementptr inbounds nuw i8, ptr %75, i64 96
  %wide.load.6 = load <8 x float>, ptr %75, align 64, !invariant.load !1, !noalias !5
  %wide.load10.6 = load <8 x float>, ptr %76, align 32, !invariant.load !1, !noalias !5
  %wide.load11.6 = load <8 x float>, ptr %77, align 64, !invariant.load !1, !noalias !5
  %wide.load12.6 = load <8 x float>, ptr %78, align 32, !invariant.load !1, !noalias !5
  %79 = fmul <8 x float> %wide.load.6, %broadcast.splat
  %80 = fmul <8 x float> %wide.load10.6, %broadcast.splat
  %81 = fmul <8 x float> %wide.load11.6, %broadcast.splat
  %82 = fmul <8 x float> %wide.load12.6, %broadcast.splat
  %83 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 192
  %84 = getelementptr inbounds nuw i8, ptr %83, i64 32
  %85 = getelementptr inbounds nuw i8, ptr %83, i64 64
  %86 = getelementptr inbounds nuw i8, ptr %83, i64 96
  store <8 x float> %79, ptr %83, align 64, !alias.scope !5
  store <8 x float> %80, ptr %84, align 32, !alias.scope !5
  store <8 x float> %81, ptr %85, align 64, !alias.scope !5
  store <8 x float> %82, ptr %86, align 32, !alias.scope !5
  %87 = getelementptr inbounds [512 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 224
  %88 = getelementptr inbounds nuw i8, ptr %87, i64 32
  %89 = getelementptr inbounds nuw i8, ptr %87, i64 64
  %90 = getelementptr inbounds nuw i8, ptr %87, i64 96
  %wide.load.7 = load <8 x float>, ptr %87, align 64, !invariant.load !1, !noalias !5
  %wide.load10.7 = load <8 x float>, ptr %88, align 32, !invariant.load !1, !noalias !5
  %wide.load11.7 = load <8 x float>, ptr %89, align 64, !invariant.load !1, !noalias !5
  %wide.load12.7 = load <8 x float>, ptr %90, align 32, !invariant.load !1, !noalias !5
  %91 = fmul <8 x float> %wide.load.7, %broadcast.splat
  %92 = fmul <8 x float> %wide.load10.7, %broadcast.splat
  %93 = fmul <8 x float> %wide.load11.7, %broadcast.splat
  %94 = fmul <8 x float> %wide.load12.7, %broadcast.splat
  %95 = getelementptr inbounds [512 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, i64 224
  %96 = getelementptr inbounds nuw i8, ptr %95, i64 32
  %97 = getelementptr inbounds nuw i8, ptr %95, i64 64
  %98 = getelementptr inbounds nuw i8, ptr %95, i64 96
  store <8 x float> %91, ptr %95, align 64, !alias.scope !5
  store <8 x float> %92, ptr %96, align 32, !alias.scope !5
  store <8 x float> %93, ptr %97, align 64, !alias.scope !5
  store <8 x float> %94, ptr %98, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_multiply_fusion.clone.invar_address.dim.0.08, 1
  %exitcond9.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond9.not, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 524288}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:524288}", !7}
!7 = !{!"XLA host kernel broadcast_multiply_fusion.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
