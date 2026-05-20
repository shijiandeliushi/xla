; ModuleID = '__compute_module_part_00'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@multiply_multiply_fusion.3.clone_parallel_bounds = private unnamed_addr constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 10]], [1 x [2 x i64]] [[2 x i64] [i64 10, i64 20]], [1 x [2 x i64]] [[2 x i64] [i64 20, i64 30]], [1 x [2 x i64]] [[2 x i64] [i64 30, i64 40]], [1 x [2 x i64]] [[2 x i64] [i64 40, i64 50]], [1 x [2 x i64]] [[2 x i64] [i64 50, i64 60]], [1 x [2 x i64]] [[2 x i64] [i64 60, i64 70]], [1 x [2 x i64]] [[2 x i64] [i64 70, i64 80]], [1 x [2 x i64]] [[2 x i64] [i64 80, i64 90]], [1 x [2 x i64]] [[2 x i64] [i64 90, i64 100]], [1 x [2 x i64]] [[2 x i64] [i64 100, i64 110]], [1 x [2 x i64]] [[2 x i64] [i64 110, i64 128]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @multiply_multiply_fusion.3.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.3.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %vector.ph, label %return

vector.ph:                                        ; preds = %1, %multiply_multiply_fusion.3.clone.loop_exit.dim.1
  %multiply_multiply_fusion.3.clone.invar_address.dim.0.03 = phi i64 [ %invar.inc, %multiply_multiply_fusion.3.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.3.clone.invar_address.dim.0.03, i64 %index
  %wide.load = load <8 x float>, ptr %2, align 32, !invariant.load !1, !noalias !5
  %3 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index
  %wide.load5 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !5
  %4 = fadd <8 x float> %wide.load, %wide.load5
  %5 = fmul <8 x float> %4, %4
  %6 = fmul <8 x float> %4, %5
  %7 = fmul <8 x float> %6, splat (float 0x3FA6E4E260000000)
  %8 = fadd <8 x float> %4, %7
  %9 = fmul <8 x float> %8, splat (float 0x3FE9884540000000)
  %10 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %9)
  %11 = fcmp olt <8 x float> %10, splat (float 0x3F3A36E2E0000000)
  %12 = fcmp uge <8 x float> %9, splat (float 0xC01FFEC880000000)
  %13 = select <8 x i1> %12, <8 x float> %9, <8 x float> splat (float 0xC01FFEC880000000)
  %14 = fcmp ule <8 x float> %13, splat (float 0x401FFEC880000000)
  %15 = select <8 x i1> %14, <8 x float> %13, <8 x float> splat (float 0x401FFEC880000000)
  %16 = fmul <8 x float> %15, %15
  %17 = fmul <8 x float> %16, splat (float 0xBCB3E4B800000000)
  %18 = fadd <8 x float> %17, splat (float 0x3D4C266FC0000000)
  %19 = fmul <8 x float> %16, %18
  %20 = fadd <8 x float> %19, splat (float 0xBDD7A6FFE0000000)
  %21 = fmul <8 x float> %16, %20
  %22 = fadd <8 x float> %21, splat (float 0x3E6B800820000000)
  %23 = fmul <8 x float> %16, %22
  %24 = fadd <8 x float> %23, splat (float 0x3EEF286940000000)
  %25 = fmul <8 x float> %16, %24
  %26 = fadd <8 x float> %25, splat (float 0x3F44E1BDA0000000)
  %27 = fmul <8 x float> %16, %26
  %28 = fadd <8 x float> %27, splat (float 0x3F740B3B80000000)
  %29 = fmul <8 x float> %15, %28
  %30 = fmul <8 x float> %16, splat (float 0x3EB41A7B00000000)
  %31 = fadd <8 x float> %30, splat (float 0x3F1F12BAC0000000)
  %32 = fmul <8 x float> %16, %31
  %33 = fadd <8 x float> %32, splat (float 0x3F629540A0000000)
  %34 = fmul <8 x float> %16, %33
  %35 = fadd <8 x float> %34, splat (float 0x3F740B3BA0000000)
  %36 = fdiv <8 x float> %29, %35
  %37 = select <8 x i1> %11, <8 x float> %9, <8 x float> %36
  %38 = fadd <8 x float> %37, splat (float 1.000000e+00)
  %39 = fmul <8 x float> %38, splat (float 5.000000e-01)
  %40 = fmul <8 x float> %4, %39
  %41 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.3.clone.invar_address.dim.0.03, i64 %index
  store <8 x float> %40, ptr %41, align 32, !alias.scope !5
  %index.next = add nuw i64 %index, 8
  %42 = icmp eq i64 %index.next, 2048
  br i1 %42, label %multiply_multiply_fusion.3.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !8

multiply_multiply_fusion.3.clone.loop_exit.dim.1: ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %multiply_multiply_fusion.3.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %vector.ph, !llvm.loop !11

return:                                           ; preds = %multiply_multiply_fusion.3.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fabs.v4f32(<4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fabs.v16f32(<16 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 8192}
!5 = !{!6}
!6 = !{!"result slice: {index:10, offset:0, size:1048576}", !7}
!7 = !{!"XLA host kernel multiply_multiply_fusion.3.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
