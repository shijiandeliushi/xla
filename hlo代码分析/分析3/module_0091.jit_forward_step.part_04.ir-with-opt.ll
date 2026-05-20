; ModuleID = '__compute_module_part_04'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@subtract_exponential_fusion.5.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]
@multiply_bitcast_fusion.clone_parallel_bounds = private unnamed_addr constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 1365]], [1 x [2 x i64]] [[2 x i64] [i64 1365, i64 2730]], [1 x [2 x i64]] [[2 x i64] [i64 2730, i64 4095]], [1 x [2 x i64]] [[2 x i64] [i64 4095, i64 5460]], [1 x [2 x i64]] [[2 x i64] [i64 5460, i64 6825]], [1 x [2 x i64]] [[2 x i64] [i64 6825, i64 8190]], [1 x [2 x i64]] [[2 x i64] [i64 8190, i64 9555]], [1 x [2 x i64]] [[2 x i64] [i64 9555, i64 10920]], [1 x [2 x i64]] [[2 x i64] [i64 10920, i64 12285]], [1 x [2 x i64]] [[2 x i64] [i64 12285, i64 13650]], [1 x [2 x i64]] [[2 x i64] [i64 13650, i64 15015]], [1 x [2 x i64]] [[2 x i64] [i64 15015, i64 16384]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @subtract_exponential_fusion.5.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @subtract_exponential_fusion.5.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @subtract_exponential_fusion.5.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %subtract_exponential_fusion.5.clone.loop_header.dim.1.preheader, label %return

subtract_exponential_fusion.5.clone.loop_header.dim.1.preheader: ; preds = %1, %subtract_exponential_fusion.5.clone.loop_exit.dim.1
  %subtract_exponential_fusion.5.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %subtract_exponential_fusion.5.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %subtract_exponential_fusion.5.clone.loop_header.dim.2.preheader

subtract_exponential_fusion.5.clone.loop_header.dim.2.preheader: ; preds = %subtract_exponential_fusion.5.clone.loop_header.dim.1.preheader, %subtract_exponential_fusion.5.clone.loop_exit.dim.2
  %subtract_exponential_fusion.5.clone.invar_address.dim.1.03 = phi i64 [ 0, %subtract_exponential_fusion.5.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %subtract_exponential_fusion.5.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.3, %subtract_exponential_fusion.5.clone.loop_header.dim.2.preheader
  %subtract_exponential_fusion.5.clone.invar_address.dim.2.02 = phi i64 [ 0, %subtract_exponential_fusion.5.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %subtract_exponential_fusion.5.clone.loop_exit.dim.3 ]
  %2 = getelementptr inbounds [32 x [16 x [512 x float]]], ptr %arg0, i64 0, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.0.05, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.1.03, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.2.02
  %3 = load float, ptr %2, align 4, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %3, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %4 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.0.05, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.1.03, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.2.02, i64 %index
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %6 = getelementptr inbounds nuw i8, ptr %4, i64 64
  %7 = getelementptr inbounds nuw i8, ptr %4, i64 96
  %wide.load = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %6, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %7, align 32, !invariant.load !1, !noalias !5
  %8 = fmul <8 x float> %wide.load, splat (float 1.250000e-01)
  %9 = fmul <8 x float> %wide.load9, splat (float 1.250000e-01)
  %10 = fmul <8 x float> %wide.load10, splat (float 1.250000e-01)
  %11 = fmul <8 x float> %wide.load11, splat (float 1.250000e-01)
  %12 = fsub <8 x float> %8, %broadcast.splat
  %13 = fsub <8 x float> %9, %broadcast.splat
  %14 = fsub <8 x float> %10, %broadcast.splat
  %15 = fsub <8 x float> %11, %broadcast.splat
  %16 = fcmp uge <8 x float> %12, splat (float 0xC055F33340000000)
  %17 = select <8 x i1> %16, <8 x float> %12, <8 x float> splat (float 0xC055F33340000000)
  %18 = fcmp ule <8 x float> %17, splat (float 0x4056333340000000)
  %19 = select <8 x i1> %18, <8 x float> %17, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i50 = fmul <8 x float> %19, splat (float 0x3FF7154760000000)
  %exp_f321.i51 = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i50
  %20 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i51)
  %21 = fcmp uge <8 x float> %20, splat (float -1.270000e+02)
  %22 = select <8 x i1> %21, <8 x float> %20, <8 x float> splat (float -1.270000e+02)
  %23 = fcmp ule <8 x float> %22, splat (float 1.270000e+02)
  %24 = select <8 x i1> %23, <8 x float> %22, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i52 = fmul <8 x float> splat (float 0x3FE6300000000000), %24
  %25 = fsub <8 x float> %19, %exp_f322.i52
  %exp_f323.i53 = fmul <8 x float> splat (float 0xBF2BD01060000000), %24
  %26 = fsub <8 x float> %25, %exp_f323.i53
  %exp_f324.i54 = fmul <8 x float> %26, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i55 = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i54
  %exp_f326.i56 = fmul <8 x float> %exp_f325.i55, %26
  %exp_f327.i57 = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i56
  %exp_f328.i58 = fmul <8 x float> %exp_f327.i57, %26
  %exp_f329.i59 = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i58
  %exp_f3210.i60 = fmul <8 x float> %exp_f329.i59, %26
  %exp_f3211.i61 = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i60
  %exp_f3212.i62 = fmul <8 x float> %exp_f3211.i61, %26
  %exp_f3213.i63 = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i62
  %exp_f3214.i64 = fmul <8 x float> %26, %26
  %exp_f3215.i65 = fmul <8 x float> %exp_f3213.i63, %exp_f3214.i64
  %exp_f3216.i66 = fadd <8 x float> %26, %exp_f3215.i65
  %exp_f3217.i67 = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i66
  %27 = fptosi <8 x float> %24 to <8 x i32>
  %28 = add <8 x i32> %27, splat (i32 127)
  %29 = shl <8 x i32> %28, splat (i32 23)
  %30 = bitcast <8 x i32> %29 to <8 x float>
  %exp_f3218.i68 = fmul <8 x float> %exp_f3217.i67, %30
  %31 = fcmp uge <8 x float> %13, splat (float 0xC055F33340000000)
  %32 = select <8 x i1> %31, <8 x float> %13, <8 x float> splat (float 0xC055F33340000000)
  %33 = fcmp ule <8 x float> %32, splat (float 0x4056333340000000)
  %34 = select <8 x i1> %33, <8 x float> %32, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i31 = fmul <8 x float> %34, splat (float 0x3FF7154760000000)
  %exp_f321.i32 = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i31
  %35 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i32)
  %36 = fcmp uge <8 x float> %35, splat (float -1.270000e+02)
  %37 = select <8 x i1> %36, <8 x float> %35, <8 x float> splat (float -1.270000e+02)
  %38 = fcmp ule <8 x float> %37, splat (float 1.270000e+02)
  %39 = select <8 x i1> %38, <8 x float> %37, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i33 = fmul <8 x float> splat (float 0x3FE6300000000000), %39
  %40 = fsub <8 x float> %34, %exp_f322.i33
  %exp_f323.i34 = fmul <8 x float> splat (float 0xBF2BD01060000000), %39
  %41 = fsub <8 x float> %40, %exp_f323.i34
  %exp_f324.i35 = fmul <8 x float> %41, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i36 = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i35
  %exp_f326.i37 = fmul <8 x float> %exp_f325.i36, %41
  %exp_f327.i38 = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i37
  %exp_f328.i39 = fmul <8 x float> %exp_f327.i38, %41
  %exp_f329.i40 = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i39
  %exp_f3210.i41 = fmul <8 x float> %exp_f329.i40, %41
  %exp_f3211.i42 = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i41
  %exp_f3212.i43 = fmul <8 x float> %exp_f3211.i42, %41
  %exp_f3213.i44 = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i43
  %exp_f3214.i45 = fmul <8 x float> %41, %41
  %exp_f3215.i46 = fmul <8 x float> %exp_f3213.i44, %exp_f3214.i45
  %exp_f3216.i47 = fadd <8 x float> %41, %exp_f3215.i46
  %exp_f3217.i48 = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i47
  %42 = fptosi <8 x float> %39 to <8 x i32>
  %43 = add <8 x i32> %42, splat (i32 127)
  %44 = shl <8 x i32> %43, splat (i32 23)
  %45 = bitcast <8 x i32> %44 to <8 x float>
  %exp_f3218.i49 = fmul <8 x float> %exp_f3217.i48, %45
  %46 = fcmp uge <8 x float> %14, splat (float 0xC055F33340000000)
  %47 = select <8 x i1> %46, <8 x float> %14, <8 x float> splat (float 0xC055F33340000000)
  %48 = fcmp ule <8 x float> %47, splat (float 0x4056333340000000)
  %49 = select <8 x i1> %48, <8 x float> %47, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i12 = fmul <8 x float> %49, splat (float 0x3FF7154760000000)
  %exp_f321.i13 = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i12
  %50 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i13)
  %51 = fcmp uge <8 x float> %50, splat (float -1.270000e+02)
  %52 = select <8 x i1> %51, <8 x float> %50, <8 x float> splat (float -1.270000e+02)
  %53 = fcmp ule <8 x float> %52, splat (float 1.270000e+02)
  %54 = select <8 x i1> %53, <8 x float> %52, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i14 = fmul <8 x float> splat (float 0x3FE6300000000000), %54
  %55 = fsub <8 x float> %49, %exp_f322.i14
  %exp_f323.i15 = fmul <8 x float> splat (float 0xBF2BD01060000000), %54
  %56 = fsub <8 x float> %55, %exp_f323.i15
  %exp_f324.i16 = fmul <8 x float> %56, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i17 = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i16
  %exp_f326.i18 = fmul <8 x float> %exp_f325.i17, %56
  %exp_f327.i19 = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i18
  %exp_f328.i20 = fmul <8 x float> %exp_f327.i19, %56
  %exp_f329.i21 = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i20
  %exp_f3210.i22 = fmul <8 x float> %exp_f329.i21, %56
  %exp_f3211.i23 = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i22
  %exp_f3212.i24 = fmul <8 x float> %exp_f3211.i23, %56
  %exp_f3213.i25 = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i24
  %exp_f3214.i26 = fmul <8 x float> %56, %56
  %exp_f3215.i27 = fmul <8 x float> %exp_f3213.i25, %exp_f3214.i26
  %exp_f3216.i28 = fadd <8 x float> %56, %exp_f3215.i27
  %exp_f3217.i29 = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i28
  %57 = fptosi <8 x float> %54 to <8 x i32>
  %58 = add <8 x i32> %57, splat (i32 127)
  %59 = shl <8 x i32> %58, splat (i32 23)
  %60 = bitcast <8 x i32> %59 to <8 x float>
  %exp_f3218.i30 = fmul <8 x float> %exp_f3217.i29, %60
  %61 = fcmp uge <8 x float> %15, splat (float 0xC055F33340000000)
  %62 = select <8 x i1> %61, <8 x float> %15, <8 x float> splat (float 0xC055F33340000000)
  %63 = fcmp ule <8 x float> %62, splat (float 0x4056333340000000)
  %64 = select <8 x i1> %63, <8 x float> %62, <8 x float> splat (float 0x4056333340000000)
  %exp_f32.i = fmul <8 x float> %64, splat (float 0x3FF7154760000000)
  %exp_f321.i = fadd <8 x float> splat (float 5.000000e-01), %exp_f32.i
  %65 = call <8 x float> @llvm.floor.v8f32(<8 x float> %exp_f321.i)
  %66 = fcmp uge <8 x float> %65, splat (float -1.270000e+02)
  %67 = select <8 x i1> %66, <8 x float> %65, <8 x float> splat (float -1.270000e+02)
  %68 = fcmp ule <8 x float> %67, splat (float 1.270000e+02)
  %69 = select <8 x i1> %68, <8 x float> %67, <8 x float> splat (float 1.270000e+02)
  %exp_f322.i = fmul <8 x float> splat (float 0x3FE6300000000000), %69
  %70 = fsub <8 x float> %64, %exp_f322.i
  %exp_f323.i = fmul <8 x float> splat (float 0xBF2BD01060000000), %69
  %71 = fsub <8 x float> %70, %exp_f323.i
  %exp_f324.i = fmul <8 x float> %71, splat (float 0x3F2A0D2CE0000000)
  %exp_f325.i = fadd <8 x float> splat (float 0x3F56E879C0000000), %exp_f324.i
  %exp_f326.i = fmul <8 x float> %exp_f325.i, %71
  %exp_f327.i = fadd <8 x float> splat (float 0x3F81112100000000), %exp_f326.i
  %exp_f328.i = fmul <8 x float> %exp_f327.i, %71
  %exp_f329.i = fadd <8 x float> splat (float 0x3FA5553820000000), %exp_f328.i
  %exp_f3210.i = fmul <8 x float> %exp_f329.i, %71
  %exp_f3211.i = fadd <8 x float> splat (float 0x3FC5555540000000), %exp_f3210.i
  %exp_f3212.i = fmul <8 x float> %exp_f3211.i, %71
  %exp_f3213.i = fadd <8 x float> splat (float 5.000000e-01), %exp_f3212.i
  %exp_f3214.i = fmul <8 x float> %71, %71
  %exp_f3215.i = fmul <8 x float> %exp_f3213.i, %exp_f3214.i
  %exp_f3216.i = fadd <8 x float> %71, %exp_f3215.i
  %exp_f3217.i = fadd <8 x float> splat (float 1.000000e+00), %exp_f3216.i
  %72 = fptosi <8 x float> %69 to <8 x i32>
  %73 = add <8 x i32> %72, splat (i32 127)
  %74 = shl <8 x i32> %73, splat (i32 23)
  %75 = bitcast <8 x i32> %74 to <8 x float>
  %exp_f3218.i = fmul <8 x float> %exp_f3217.i, %75
  %76 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.0.05, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.1.03, i64 %subtract_exponential_fusion.5.clone.invar_address.dim.2.02, i64 %index
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 32
  %78 = getelementptr inbounds nuw i8, ptr %76, i64 64
  %79 = getelementptr inbounds nuw i8, ptr %76, i64 96
  store <8 x float> %exp_f3218.i68, ptr %76, align 64, !alias.scope !5
  store <8 x float> %exp_f3218.i49, ptr %77, align 32, !alias.scope !5
  store <8 x float> %exp_f3218.i30, ptr %78, align 64, !alias.scope !5
  store <8 x float> %exp_f3218.i, ptr %79, align 32, !alias.scope !5
  %index.next = add nuw i64 %index, 32
  %80 = icmp eq i64 %index.next, 512
  br i1 %80, label %subtract_exponential_fusion.5.clone.loop_exit.dim.3, label %vector.body, !llvm.loop !8

subtract_exponential_fusion.5.clone.loop_exit.dim.3: ; preds = %vector.body
  %invar.inc6 = add nuw nsw i64 %subtract_exponential_fusion.5.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond6, label %subtract_exponential_fusion.5.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !11

subtract_exponential_fusion.5.clone.loop_exit.dim.2: ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.3
  %invar.inc5 = add nuw nsw i64 %subtract_exponential_fusion.5.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %subtract_exponential_fusion.5.clone.loop_exit.dim.1, label %subtract_exponential_fusion.5.clone.loop_header.dim.2.preheader, !llvm.loop !13

subtract_exponential_fusion.5.clone.loop_exit.dim.1: ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %subtract_exponential_fusion.5.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %subtract_exponential_fusion.5.clone.loop_header.dim.1.preheader, !llvm.loop !14

return:                                           ; preds = %subtract_exponential_fusion.5.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @multiply_bitcast_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !15, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !16, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !16, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_bitcast_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %vector.ph, label %return

vector.ph:                                        ; preds = %1, %multiply_bitcast_fusion.clone.loop_exit.dim.1
  %multiply_bitcast_fusion.clone.invar_address.dim.0.03 = phi i64 [ %invar.inc, %multiply_bitcast_fusion.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds nuw [16384 x [4096 x float]], ptr %arg1, i64 0, i64 %multiply_bitcast_fusion.clone.invar_address.dim.0.03, i64 %index
  %wide.load = load <8 x float>, ptr %2, align 32, !invariant.load !1, !noalias !17
  %3 = getelementptr inbounds nuw [4096 x float], ptr %arg0, i64 0, i64 %index
  %wide.load5 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !17
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
  %41 = getelementptr inbounds [16384 x [4096 x float]], ptr %arg2, i64 0, i64 %multiply_bitcast_fusion.clone.invar_address.dim.0.03, i64 %index
  store <8 x float> %40, ptr %41, align 32, !alias.scope !17
  %index.next = add nuw i64 %index, 8
  %42 = icmp eq i64 %index.next, 4096
  br i1 %42, label %multiply_bitcast_fusion.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !20

multiply_bitcast_fusion.clone.loop_exit.dim.1:    ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %multiply_bitcast_fusion.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %vector.ph, !llvm.loop !21

return:                                           ; preds = %multiply_bitcast_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fabs.v4f32(<4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fabs.v16f32(<16 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.floor.v4f32(<4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.floor.v8f32(<8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.floor.v16f32(<16 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 4}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 536870912}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:536870912, size:536870912}", !7}
!7 = !{!"XLA host kernel subtract_exponential_fusion.5.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = !{i64 16384}
!16 = !{i64 268435456}
!17 = !{!18}
!18 = !{!"result slice: {index:148, offset:0, size:268435456}", !19}
!19 = !{!"XLA host kernel multiply_bitcast_fusion.clone AA domain"}
!20 = distinct !{!20, !9, !10}
!21 = distinct !{!21, !12}
