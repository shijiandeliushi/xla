; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@multiply_multiply_fusion.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 32]], [1 x [2 x i64]] [[2 x i64] [i64 32, i64 64]], [1 x [2 x i64]] [[2 x i64] [i64 64, i64 96]], [1 x [2 x i64]] [[2 x i64] [i64 96, i64 128]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @multiply_multiply_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not5 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not5, label %vector.ph, label %return

vector.ph:                                        ; preds = %1, %multiply_multiply_fusion.clone.loop_exit.dim.1
  %multiply_multiply_fusion.clone.invar_address.dim.0.06 = phi i64 [ %invar.inc, %multiply_multiply_fusion.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.3, %vector.body ]
  %2 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !4
  %wide.load8 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !4
  %wide.load9 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !4
  %wide.load10 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !4
  %6 = fmul <8 x float> %wide.load, %wide.load
  %7 = fmul <8 x float> %wide.load8, %wide.load8
  %8 = fmul <8 x float> %wide.load9, %wide.load9
  %9 = fmul <8 x float> %wide.load10, %wide.load10
  %10 = fmul <8 x float> %wide.load, %6
  %11 = fmul <8 x float> %wide.load8, %7
  %12 = fmul <8 x float> %wide.load9, %8
  %13 = fmul <8 x float> %wide.load10, %9
  %14 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index
  %15 = getelementptr inbounds nuw i8, ptr %14, i64 32
  %16 = getelementptr inbounds nuw i8, ptr %14, i64 64
  %17 = getelementptr inbounds nuw i8, ptr %14, i64 96
  store <8 x float> %10, ptr %14, align 64, !alias.scope !4
  store <8 x float> %11, ptr %15, align 32, !alias.scope !4
  store <8 x float> %12, ptr %16, align 64, !alias.scope !4
  store <8 x float> %13, ptr %17, align 32, !alias.scope !4
  %index.next = or disjoint i64 %index, 32
  %18 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index.next
  %19 = getelementptr inbounds nuw i8, ptr %18, i64 32
  %20 = getelementptr inbounds nuw i8, ptr %18, i64 64
  %21 = getelementptr inbounds nuw i8, ptr %18, i64 96
  %wide.load.1 = load <8 x float>, ptr %18, align 64, !invariant.load !1, !noalias !4
  %wide.load8.1 = load <8 x float>, ptr %19, align 32, !invariant.load !1, !noalias !4
  %wide.load9.1 = load <8 x float>, ptr %20, align 64, !invariant.load !1, !noalias !4
  %wide.load10.1 = load <8 x float>, ptr %21, align 32, !invariant.load !1, !noalias !4
  %22 = fmul <8 x float> %wide.load.1, %wide.load.1
  %23 = fmul <8 x float> %wide.load8.1, %wide.load8.1
  %24 = fmul <8 x float> %wide.load9.1, %wide.load9.1
  %25 = fmul <8 x float> %wide.load10.1, %wide.load10.1
  %26 = fmul <8 x float> %wide.load.1, %22
  %27 = fmul <8 x float> %wide.load8.1, %23
  %28 = fmul <8 x float> %wide.load9.1, %24
  %29 = fmul <8 x float> %wide.load10.1, %25
  %30 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index.next
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 64
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 96
  store <8 x float> %26, ptr %30, align 64, !alias.scope !4
  store <8 x float> %27, ptr %31, align 32, !alias.scope !4
  store <8 x float> %28, ptr %32, align 64, !alias.scope !4
  store <8 x float> %29, ptr %33, align 32, !alias.scope !4
  %index.next.1 = or disjoint i64 %index, 64
  %34 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index.next.1
  %35 = getelementptr inbounds nuw i8, ptr %34, i64 32
  %36 = getelementptr inbounds nuw i8, ptr %34, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %34, i64 96
  %wide.load.2 = load <8 x float>, ptr %34, align 64, !invariant.load !1, !noalias !4
  %wide.load8.2 = load <8 x float>, ptr %35, align 32, !invariant.load !1, !noalias !4
  %wide.load9.2 = load <8 x float>, ptr %36, align 64, !invariant.load !1, !noalias !4
  %wide.load10.2 = load <8 x float>, ptr %37, align 32, !invariant.load !1, !noalias !4
  %38 = fmul <8 x float> %wide.load.2, %wide.load.2
  %39 = fmul <8 x float> %wide.load8.2, %wide.load8.2
  %40 = fmul <8 x float> %wide.load9.2, %wide.load9.2
  %41 = fmul <8 x float> %wide.load10.2, %wide.load10.2
  %42 = fmul <8 x float> %wide.load.2, %38
  %43 = fmul <8 x float> %wide.load8.2, %39
  %44 = fmul <8 x float> %wide.load9.2, %40
  %45 = fmul <8 x float> %wide.load10.2, %41
  %46 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index.next.1
  %47 = getelementptr inbounds nuw i8, ptr %46, i64 32
  %48 = getelementptr inbounds nuw i8, ptr %46, i64 64
  %49 = getelementptr inbounds nuw i8, ptr %46, i64 96
  store <8 x float> %42, ptr %46, align 64, !alias.scope !4
  store <8 x float> %43, ptr %47, align 32, !alias.scope !4
  store <8 x float> %44, ptr %48, align 64, !alias.scope !4
  store <8 x float> %45, ptr %49, align 32, !alias.scope !4
  %index.next.2 = or disjoint i64 %index, 96
  %50 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index.next.2
  %51 = getelementptr inbounds nuw i8, ptr %50, i64 32
  %52 = getelementptr inbounds nuw i8, ptr %50, i64 64
  %53 = getelementptr inbounds nuw i8, ptr %50, i64 96
  %wide.load.3 = load <8 x float>, ptr %50, align 64, !invariant.load !1, !noalias !4
  %wide.load8.3 = load <8 x float>, ptr %51, align 32, !invariant.load !1, !noalias !4
  %wide.load9.3 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !4
  %wide.load10.3 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !4
  %54 = fmul <8 x float> %wide.load.3, %wide.load.3
  %55 = fmul <8 x float> %wide.load8.3, %wide.load8.3
  %56 = fmul <8 x float> %wide.load9.3, %wide.load9.3
  %57 = fmul <8 x float> %wide.load10.3, %wide.load10.3
  %58 = fmul <8 x float> %wide.load.3, %54
  %59 = fmul <8 x float> %wide.load8.3, %55
  %60 = fmul <8 x float> %wide.load9.3, %56
  %61 = fmul <8 x float> %wide.load10.3, %57
  %62 = getelementptr inbounds [128 x [2048 x float]], ptr %arg1, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, i64 %index.next.2
  %63 = getelementptr inbounds nuw i8, ptr %62, i64 32
  %64 = getelementptr inbounds nuw i8, ptr %62, i64 64
  %65 = getelementptr inbounds nuw i8, ptr %62, i64 96
  store <8 x float> %58, ptr %62, align 64, !alias.scope !4
  store <8 x float> %59, ptr %63, align 32, !alias.scope !4
  store <8 x float> %60, ptr %64, align 64, !alias.scope !4
  store <8 x float> %61, ptr %65, align 32, !alias.scope !4
  %index.next.3 = add nuw nsw i64 %index, 128
  %66 = icmp eq i64 %index.next.3, 2048
  br i1 %66, label %multiply_multiply_fusion.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !7

multiply_multiply_fusion.clone.loop_exit.dim.1:   ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %multiply_multiply_fusion.clone.invar_address.dim.0.06, 1
  %exitcond7.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond7.not, label %return, label %vector.ph, !llvm.loop !10

return:                                           ; preds = %multiply_multiply_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:1048576}", !6}
!6 = !{!"XLA host kernel multiply_multiply_fusion.clone AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
