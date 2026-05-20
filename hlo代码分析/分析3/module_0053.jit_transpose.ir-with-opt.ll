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

vector.ph:                                        ; preds = %vector.ph, %transpose_copy_fusion.clone.loop_header.dim.2.preheader
  %transpose_copy_fusion.clone.invar_address.dim.2.07 = phi i64 [ 0, %transpose_copy_fusion.clone.loop_header.dim.2.preheader ], [ %invar.inc4, %vector.ph ]
  %2 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 0
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !4
  %wide.load15 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !4
  %wide.load16 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !4
  %wide.load17 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !4
  %6 = getelementptr inbounds [32 x [512 x [16 x [64 x float]]]], ptr %arg1, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, i64 0
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  store <8 x float> %wide.load, ptr %6, align 64, !alias.scope !4
  store <8 x float> %wide.load15, ptr %7, align 32, !alias.scope !4
  store <8 x float> %wide.load16, ptr %8, align 64, !alias.scope !4
  store <8 x float> %wide.load17, ptr %9, align 32, !alias.scope !4
  %10 = getelementptr inbounds [32 x [16 x [512 x [64 x float]]]], ptr %arg0, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 32
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  %wide.load.1 = load <8 x float>, ptr %10, align 64, !invariant.load !1, !noalias !4
  %wide.load15.1 = load <8 x float>, ptr %11, align 32, !invariant.load !1, !noalias !4
  %wide.load16.1 = load <8 x float>, ptr %12, align 64, !invariant.load !1, !noalias !4
  %wide.load17.1 = load <8 x float>, ptr %13, align 32, !invariant.load !1, !noalias !4
  %14 = getelementptr inbounds [32 x [512 x [16 x [64 x float]]]], ptr %arg1, i64 0, i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, i64 32
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  store <8 x float> %wide.load.1, ptr %14, align 64, !alias.scope !4
  store <8 x float> %wide.load15.1, ptr %15, align 32, !alias.scope !4
  store <8 x float> %wide.load16.1, ptr %16, align 64, !alias.scope !4
  store <8 x float> %wide.load17.1, ptr %17, align 32, !alias.scope !4
  %invar.inc4 = add nuw nsw i64 %transpose_copy_fusion.clone.invar_address.dim.2.07, 1
  %exitcond12 = icmp eq i64 %invar.inc4, 16
  br i1 %exitcond12, label %transpose_copy_fusion.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !7

transpose_copy_fusion.clone.loop_exit.dim.2:      ; preds = %vector.ph
  %invar.inc3 = add nuw nsw i64 %transpose_copy_fusion.clone.invar_address.dim.1.08, 1
  %exitcond13 = icmp eq i64 %invar.inc3, 512
  br i1 %exitcond13, label %transpose_copy_fusion.clone.loop_exit.dim.1, label %transpose_copy_fusion.clone.loop_header.dim.2.preheader, !llvm.loop !9

transpose_copy_fusion.clone.loop_exit.dim.1:      ; preds = %transpose_copy_fusion.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %transpose_copy_fusion.clone.invar_address.dim.0.010, 1
  %exitcond14.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond14.not, label %return, label %transpose_copy_fusion.clone.loop_header.dim.1.preheader, !llvm.loop !10

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
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.unroll.disable"}
!9 = distinct !{!9, !8}
!10 = distinct !{!10, !8}
