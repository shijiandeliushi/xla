; ModuleID = '__compute_module_exponential.2.clone_elemental_kernel_module'
source_filename = "__compute_module_exponential.2.clone_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@exponential.2.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @exponential.2.clone_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @exponential.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @exponential.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not9 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not9, label %exponential.2.clone.loop_header.dim.1.preheader, label %return

exponential.2.clone.loop_header.dim.1.preheader:  ; preds = %1, %exponential.2.clone.loop_exit.dim.1
  %exponential.2.clone.invar_address.dim.0.010 = phi i64 [ %invar.inc, %exponential.2.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %exponential.2.clone.loop_header.dim.2.preheader

exponential.2.clone.loop_header.dim.2.preheader:  ; preds = %exponential.2.clone.loop_header.dim.1.preheader, %exponential.2.clone.loop_exit.dim.2
  %exponential.2.clone.invar_address.dim.1.08 = phi i64 [ 0, %exponential.2.clone.loop_header.dim.1.preheader ], [ %invar.inc3, %exponential.2.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %exponential.2.clone.loop_exit.dim.3, %exponential.2.clone.loop_header.dim.2.preheader
  %exponential.2.clone.invar_address.dim.2.07 = phi i64 [ 0, %exponential.2.clone.loop_header.dim.2.preheader ], [ %invar.inc4, %exponential.2.clone.loop_exit.dim.3 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %exponential.2.clone.invar_address.dim.0.010, i64 %exponential.2.clone.invar_address.dim.1.08, i64 %exponential.2.clone.invar_address.dim.2.07, i64 %index
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !4
  %wide.load14 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !4
  %wide.load15 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !4
  %wide.load16 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !4
  %6 = fcmp uge <8 x float> %wide.load, splat (float 0xC055F33340000000)
  %7 = select <8 x i1> %6, <8 x float> %wide.load, <8 x float> splat (float 0xC055F33340000000)
  %8 = fcmp ule <8 x float> %7, splat (float 0x4056333340000000)
  %9 = select <8 x i1> %8, <8 x float> %7, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i55 = fmul <8 x float> %9, splat (float 0x3FF7154760000000)
  %exp_f321.i56 = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i55
  %10 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i56)
  %11 = fcmp uge <8 x float> %10, splat (float -1.270000e+02)
  %12 = select <8 x i1> %11, <8 x float> %10, <8 x float> splat (float -1.270000e+02)
  %13 = fcmp ule <8 x float> %12, splat (float 1.270000e+02)
  %14 = select <8 x i1> %13, <8 x float> %12, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i57 = fmul <8 x float> splat (float 0x3FE6300000000000), %14
  %15 = fsub <8 x float> %9, %exp_f322.i57
  %exp_f323.i58 = fmul <8 x float> splat (float 0xBF2BD01060000000), %14
  %16 = fsub <8 x float> %15, %exp_f323.i58
  %exp_f324.i59 = fmul <8 x float> %16, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i60 = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i59
  %exp_f326.i61 = fmul <8 x float> %exp_f325.i60, %16
  %exp_f327.i62 = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i61
  %exp_f328.i63 = fmul <8 x float> %exp_f327.i62, %16
  %exp_f329.i64 = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i63
  %exp_f3210.i65 = fmul <8 x float> %exp_f329.i64, %16
  %exp_f3211.i66 = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i65
  %exp_f3212.i67 = fmul <8 x float> %exp_f3211.i66, %16
  %exp_f3213.i68 = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i67
  %exp_f3214.i69 = fmul <8 x float> %16, %16
  %exp_f3215.i70 = fmul <8 x float> %exp_f3213.i68, %exp_f3214.i69
  %exp_f3216.i71 = fadd <8 x float> %16, %exp_f3215.i70
  %exp_f3217.i72 = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i71
  %17 = fptosi <8 x float> %14 to <8 x i32>
  %18 = add <8 x i32> %17, splat (i32 127)
  %19 = shl <8 x i32> %18, splat (i32 23)
  %20 = bitcast <8 x i32> %19 to <8 x float>
  %exp_f3218.i73 = fmul <8 x float> %exp_f3217.i72, %20
  %21 = fcmp uge <8 x float> %wide.load14, splat (float 0xC055F33340000000)
  %22 = select <8 x i1> %21, <8 x float> %wide.load14, <8 x float> splat (float 0xC055F33340000000)
  %23 = fcmp ule <8 x float> %22, splat (float 0x4056333340000000)
  %24 = select <8 x i1> %23, <8 x float> %22, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i36 = fmul <8 x float> %24, splat (float 0x3FF7154760000000)
  %exp_f321.i37 = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i36
  %25 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i37)
  %26 = fcmp uge <8 x float> %25, splat (float -1.270000e+02)
  %27 = select <8 x i1> %26, <8 x float> %25, <8 x float> splat (float -1.270000e+02)
  %28 = fcmp ule <8 x float> %27, splat (float 1.270000e+02)
  %29 = select <8 x i1> %28, <8 x float> %27, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i38 = fmul <8 x float> splat (float 0x3FE6300000000000), %29
  %30 = fsub <8 x float> %24, %exp_f322.i38
  %exp_f323.i39 = fmul <8 x float> splat (float 0xBF2BD01060000000), %29
  %31 = fsub <8 x float> %30, %exp_f323.i39
  %exp_f324.i40 = fmul <8 x float> %31, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i41 = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i40
  %exp_f326.i42 = fmul <8 x float> %exp_f325.i41, %31
  %exp_f327.i43 = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i42
  %exp_f328.i44 = fmul <8 x float> %exp_f327.i43, %31
  %exp_f329.i45 = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i44
  %exp_f3210.i46 = fmul <8 x float> %exp_f329.i45, %31
  %exp_f3211.i47 = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i46
  %exp_f3212.i48 = fmul <8 x float> %exp_f3211.i47, %31
  %exp_f3213.i49 = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i48
  %exp_f3214.i50 = fmul <8 x float> %31, %31
  %exp_f3215.i51 = fmul <8 x float> %exp_f3213.i49, %exp_f3214.i50
  %exp_f3216.i52 = fadd <8 x float> %31, %exp_f3215.i51
  %exp_f3217.i53 = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i52
  %32 = fptosi <8 x float> %29 to <8 x i32>
  %33 = add <8 x i32> %32, splat (i32 127)
  %34 = shl <8 x i32> %33, splat (i32 23)
  %35 = bitcast <8 x i32> %34 to <8 x float>
  %exp_f3218.i54 = fmul <8 x float> %exp_f3217.i53, %35
  %36 = fcmp uge <8 x float> %wide.load15, splat (float 0xC055F33340000000)
  %37 = select <8 x i1> %36, <8 x float> %wide.load15, <8 x float> splat (float 0xC055F33340000000)
  %38 = fcmp ule <8 x float> %37, splat (float 0x4056333340000000)
  %39 = select <8 x i1> %38, <8 x float> %37, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i17 = fmul <8 x float> %39, splat (float 0x3FF7154760000000)
  %exp_f321.i18 = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i17
  %40 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i18)
  %41 = fcmp uge <8 x float> %40, splat (float -1.270000e+02)
  %42 = select <8 x i1> %41, <8 x float> %40, <8 x float> splat (float -1.270000e+02)
  %43 = fcmp ule <8 x float> %42, splat (float 1.270000e+02)
  %44 = select <8 x i1> %43, <8 x float> %42, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i19 = fmul <8 x float> splat (float 0x3FE6300000000000), %44
  %45 = fsub <8 x float> %39, %exp_f322.i19
  %exp_f323.i20 = fmul <8 x float> splat (float 0xBF2BD01060000000), %44
  %46 = fsub <8 x float> %45, %exp_f323.i20
  %exp_f324.i21 = fmul <8 x float> %46, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i22 = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i21
  %exp_f326.i23 = fmul <8 x float> %exp_f325.i22, %46
  %exp_f327.i24 = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i23
  %exp_f328.i25 = fmul <8 x float> %exp_f327.i24, %46
  %exp_f329.i26 = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i25
  %exp_f3210.i27 = fmul <8 x float> %exp_f329.i26, %46
  %exp_f3211.i28 = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i27
  %exp_f3212.i29 = fmul <8 x float> %exp_f3211.i28, %46
  %exp_f3213.i30 = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i29
  %exp_f3214.i31 = fmul <8 x float> %46, %46
  %exp_f3215.i32 = fmul <8 x float> %exp_f3213.i30, %exp_f3214.i31
  %exp_f3216.i33 = fadd <8 x float> %46, %exp_f3215.i32
  %exp_f3217.i34 = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i33
  %47 = fptosi <8 x float> %44 to <8 x i32>
  %48 = add <8 x i32> %47, splat (i32 127)
  %49 = shl <8 x i32> %48, splat (i32 23)
  %50 = bitcast <8 x i32> %49 to <8 x float>
  %exp_f3218.i35 = fmul <8 x float> %exp_f3217.i34, %50
  %51 = fcmp uge <8 x float> %wide.load16, splat (float 0xC055F33340000000)
  %52 = select <8 x i1> %51, <8 x float> %wide.load16, <8 x float> splat (float 0xC055F33340000000)
  %53 = fcmp ule <8 x float> %52, splat (float 0x4056333340000000)
  %54 = select <8 x i1> %53, <8 x float> %52, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i = fmul <8 x float> %54, splat (float 0x3FF7154760000000)
  %exp_f321.i = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i
  %55 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i)
  %56 = fcmp uge <8 x float> %55, splat (float -1.270000e+02)
  %57 = select <8 x i1> %56, <8 x float> %55, <8 x float> splat (float -1.270000e+02)
  %58 = fcmp ule <8 x float> %57, splat (float 1.270000e+02)
  %59 = select <8 x i1> %58, <8 x float> %57, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i = fmul <8 x float> splat (float 0x3FE6300000000000), %59
  %60 = fsub <8 x float> %54, %exp_f322.i
  %exp_f323.i = fmul <8 x float> splat (float 0xBF2BD01060000000), %59
  %61 = fsub <8 x float> %60, %exp_f323.i
  %exp_f324.i = fmul <8 x float> %61, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i
  %exp_f326.i = fmul <8 x float> %exp_f325.i, %61
  %exp_f327.i = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i
  %exp_f328.i = fmul <8 x float> %exp_f327.i, %61
  %exp_f329.i = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i
  %exp_f3210.i = fmul <8 x float> %exp_f329.i, %61
  %exp_f3211.i = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i
  %exp_f3212.i = fmul <8 x float> %exp_f3211.i, %61
  %exp_f3213.i = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i
  %exp_f3214.i = fmul <8 x float> %61, %61
  %exp_f3215.i = fmul <8 x float> %exp_f3213.i, %exp_f3214.i
  %exp_f3216.i = fadd <8 x float> %61, %exp_f3215.i
  %exp_f3217.i = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i
  %62 = fptosi <8 x float> %59 to <8 x i32>
  %63 = add <8 x i32> %62, splat (i32 127)
  %64 = shl <8 x i32> %63, splat (i32 23)
  %65 = bitcast <8 x i32> %64 to <8 x float>
  %exp_f3218.i = fmul <8 x float> %exp_f3217.i, %65
  %66 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %exponential.2.clone.invar_address.dim.0.010, i64 %exponential.2.clone.invar_address.dim.1.08, i64 %exponential.2.clone.invar_address.dim.2.07, i64 %index
  %67 = getelementptr inbounds nuw i8, ptr %66, i64 32
  %68 = getelementptr inbounds nuw i8, ptr %66, i64 64
  %69 = getelementptr inbounds nuw i8, ptr %66, i64 96
  store <8 x float> %exp_f3218.i73, ptr %66, align 64, !alias.scope !4
  store <8 x float> %exp_f3218.i54, ptr %67, align 32, !alias.scope !4
  store <8 x float> %exp_f3218.i35, ptr %68, align 64, !alias.scope !4
  store <8 x float> %exp_f3218.i, ptr %69, align 32, !alias.scope !4
  %index.next = add nuw i64 %index, 32
  %70 = icmp eq i64 %index.next, 512
  br i1 %70, label %exponential.2.clone.loop_exit.dim.3, label %vector.body, !llvm.loop !7

exponential.2.clone.loop_exit.dim.3:              ; preds = %vector.body
  %invar.inc4 = add nuw nsw i64 %exponential.2.clone.invar_address.dim.2.07, 1
  %exitcond11 = icmp eq i64 %invar.inc4, 512
  br i1 %exitcond11, label %exponential.2.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !10

exponential.2.clone.loop_exit.dim.2:              ; preds = %exponential.2.clone.loop_exit.dim.3
  %invar.inc3 = add nuw nsw i64 %exponential.2.clone.invar_address.dim.1.08, 1
  %exitcond12 = icmp eq i64 %invar.inc3, 16
  br i1 %exitcond12, label %exponential.2.clone.loop_exit.dim.1, label %exponential.2.clone.loop_header.dim.2.preheader, !llvm.loop !12

exponential.2.clone.loop_exit.dim.1:              ; preds = %exponential.2.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %exponential.2.clone.invar_address.dim.0.010, 1
  %exitcond13.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond13.not, label %return, label %exponential.2.clone.loop_header.dim.1.preheader, !llvm.loop !13

return:                                           ; preds = %exponential.2.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.floor.v4f32(<4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.floor.v8f32(<8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.floor.v16f32(<16 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 536870912}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:536870912}", !6}
!6 = !{!"XLA host kernel exponential.2.clone_kernel AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
