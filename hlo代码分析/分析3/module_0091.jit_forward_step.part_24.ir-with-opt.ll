; ModuleID = '__compute_module_part_24'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_divide_fusion.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @subtract_exponential_fusion.3.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %subtract_exponential_fusion.3.clone.loop_header.dim.1.preheader, label %return

subtract_exponential_fusion.3.clone.loop_header.dim.1.preheader: ; preds = %1, %subtract_exponential_fusion.3.clone.loop_exit.dim.1
  %subtract_exponential_fusion.3.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %subtract_exponential_fusion.3.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %subtract_exponential_fusion.3.clone.loop_header.dim.2.preheader

subtract_exponential_fusion.3.clone.loop_header.dim.2.preheader: ; preds = %subtract_exponential_fusion.3.clone.loop_header.dim.1.preheader, %subtract_exponential_fusion.3.clone.loop_exit.dim.2
  %subtract_exponential_fusion.3.clone.invar_address.dim.1.03 = phi i64 [ 0, %subtract_exponential_fusion.3.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %subtract_exponential_fusion.3.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %subtract_exponential_fusion.3.clone.loop_exit.dim.3, %subtract_exponential_fusion.3.clone.loop_header.dim.2.preheader
  %subtract_exponential_fusion.3.clone.invar_address.dim.2.02 = phi i64 [ 0, %subtract_exponential_fusion.3.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %subtract_exponential_fusion.3.clone.loop_exit.dim.3 ]
  %2 = getelementptr inbounds [32 x [16 x [512 x float]]], ptr %arg0, i64 0, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.0.05, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.1.03, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.2.02
  %3 = load float, ptr %2, align 4, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %3, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %4 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg1, i64 0, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.0.05, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.1.03, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.2.02, i64 %index
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
  %76 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.0.05, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.1.03, i64 %subtract_exponential_fusion.3.clone.invar_address.dim.2.02, i64 %index
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 32
  %78 = getelementptr inbounds nuw i8, ptr %76, i64 64
  %79 = getelementptr inbounds nuw i8, ptr %76, i64 96
  store <8 x float> %exp_f3218.i68, ptr %76, align 64, !alias.scope !5
  store <8 x float> %exp_f3218.i49, ptr %77, align 32, !alias.scope !5
  store <8 x float> %exp_f3218.i30, ptr %78, align 64, !alias.scope !5
  store <8 x float> %exp_f3218.i, ptr %79, align 32, !alias.scope !5
  %index.next = add nuw i64 %index, 32
  %80 = icmp eq i64 %index.next, 512
  br i1 %80, label %subtract_exponential_fusion.3.clone.loop_exit.dim.3, label %vector.body, !llvm.loop !8

subtract_exponential_fusion.3.clone.loop_exit.dim.3: ; preds = %vector.body
  %invar.inc6 = add nuw nsw i64 %subtract_exponential_fusion.3.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond6, label %subtract_exponential_fusion.3.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !11

subtract_exponential_fusion.3.clone.loop_exit.dim.2: ; preds = %subtract_exponential_fusion.3.clone.loop_exit.dim.3
  %invar.inc5 = add nuw nsw i64 %subtract_exponential_fusion.3.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %subtract_exponential_fusion.3.clone.loop_exit.dim.1, label %subtract_exponential_fusion.3.clone.loop_header.dim.2.preheader, !llvm.loop !13

subtract_exponential_fusion.3.clone.loop_exit.dim.1: ; preds = %subtract_exponential_fusion.3.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %subtract_exponential_fusion.3.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %subtract_exponential_fusion.3.clone.loop_header.dim.1.preheader, !llvm.loop !14

return:                                           ; preds = %subtract_exponential_fusion.3.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_divide_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @broadcast_divide_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not4 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not4, label %broadcast_divide_fusion.clone.loop_header.dim.1.preheader, label %return

broadcast_divide_fusion.clone.loop_header.dim.1.preheader: ; preds = %1, %broadcast_divide_fusion.clone.loop_exit.dim.1
  %broadcast_divide_fusion.clone.invar_address.dim.0.05 = phi i64 [ %invar.inc, %broadcast_divide_fusion.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %broadcast_divide_fusion.clone.loop_header.dim.2.preheader

broadcast_divide_fusion.clone.loop_header.dim.2.preheader: ; preds = %broadcast_divide_fusion.clone.loop_header.dim.1.preheader, %broadcast_divide_fusion.clone.loop_exit.dim.2
  %broadcast_divide_fusion.clone.invar_address.dim.1.03 = phi i64 [ 0, %broadcast_divide_fusion.clone.loop_header.dim.1.preheader ], [ %invar.inc5, %broadcast_divide_fusion.clone.loop_exit.dim.2 ]
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_divide_fusion.clone.loop_header.dim.2.preheader
  %broadcast_divide_fusion.clone.invar_address.dim.2.02 = phi i64 [ 0, %broadcast_divide_fusion.clone.loop_header.dim.2.preheader ], [ %invar.inc6, %vector.ph ]
  %2 = getelementptr inbounds [32 x [16 x [512 x float]]], ptr %arg1, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02
  %3 = load float, ptr %2, align 4, !invariant.load !1, !noalias !15
  %broadcast.splatinsert = insertelement <8 x float> poison, float %3, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  %4 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 0
  %5 = getelementptr inbounds nuw i8, ptr %4, i64 32
  %6 = getelementptr inbounds nuw i8, ptr %4, i64 64
  %7 = getelementptr inbounds nuw i8, ptr %4, i64 96
  %wide.load = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !15
  %wide.load9 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !15
  %wide.load10 = load <8 x float>, ptr %6, align 64, !invariant.load !1, !noalias !15
  %wide.load11 = load <8 x float>, ptr %7, align 32, !invariant.load !1, !noalias !15
  %8 = fdiv <8 x float> %wide.load, %broadcast.splat
  %9 = fdiv <8 x float> %wide.load9, %broadcast.splat
  %10 = fdiv <8 x float> %wide.load10, %broadcast.splat
  %11 = fdiv <8 x float> %wide.load11, %broadcast.splat
  %12 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 0
  %13 = getelementptr inbounds nuw i8, ptr %12, i64 32
  %14 = getelementptr inbounds nuw i8, ptr %12, i64 64
  %15 = getelementptr inbounds nuw i8, ptr %12, i64 96
  store <8 x float> %8, ptr %12, align 64, !alias.scope !15
  store <8 x float> %9, ptr %13, align 32, !alias.scope !15
  store <8 x float> %10, ptr %14, align 64, !alias.scope !15
  store <8 x float> %11, ptr %15, align 32, !alias.scope !15
  %16 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %16, i64 32
  %18 = getelementptr inbounds nuw i8, ptr %16, i64 64
  %19 = getelementptr inbounds nuw i8, ptr %16, i64 96
  %wide.load.1 = load <8 x float>, ptr %16, align 64, !invariant.load !1, !noalias !15
  %wide.load9.1 = load <8 x float>, ptr %17, align 32, !invariant.load !1, !noalias !15
  %wide.load10.1 = load <8 x float>, ptr %18, align 64, !invariant.load !1, !noalias !15
  %wide.load11.1 = load <8 x float>, ptr %19, align 32, !invariant.load !1, !noalias !15
  %20 = fdiv <8 x float> %wide.load.1, %broadcast.splat
  %21 = fdiv <8 x float> %wide.load9.1, %broadcast.splat
  %22 = fdiv <8 x float> %wide.load10.1, %broadcast.splat
  %23 = fdiv <8 x float> %wide.load11.1, %broadcast.splat
  %24 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %24, i64 32
  %26 = getelementptr inbounds nuw i8, ptr %24, i64 64
  %27 = getelementptr inbounds nuw i8, ptr %24, i64 96
  store <8 x float> %20, ptr %24, align 64, !alias.scope !15
  store <8 x float> %21, ptr %25, align 32, !alias.scope !15
  store <8 x float> %22, ptr %26, align 64, !alias.scope !15
  store <8 x float> %23, ptr %27, align 32, !alias.scope !15
  %28 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %28, i64 32
  %30 = getelementptr inbounds nuw i8, ptr %28, i64 64
  %31 = getelementptr inbounds nuw i8, ptr %28, i64 96
  %wide.load.2 = load <8 x float>, ptr %28, align 64, !invariant.load !1, !noalias !15
  %wide.load9.2 = load <8 x float>, ptr %29, align 32, !invariant.load !1, !noalias !15
  %wide.load10.2 = load <8 x float>, ptr %30, align 64, !invariant.load !1, !noalias !15
  %wide.load11.2 = load <8 x float>, ptr %31, align 32, !invariant.load !1, !noalias !15
  %32 = fdiv <8 x float> %wide.load.2, %broadcast.splat
  %33 = fdiv <8 x float> %wide.load9.2, %broadcast.splat
  %34 = fdiv <8 x float> %wide.load10.2, %broadcast.splat
  %35 = fdiv <8 x float> %wide.load11.2, %broadcast.splat
  %36 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 64
  %37 = getelementptr inbounds nuw i8, ptr %36, i64 32
  %38 = getelementptr inbounds nuw i8, ptr %36, i64 64
  %39 = getelementptr inbounds nuw i8, ptr %36, i64 96
  store <8 x float> %32, ptr %36, align 64, !alias.scope !15
  store <8 x float> %33, ptr %37, align 32, !alias.scope !15
  store <8 x float> %34, ptr %38, align 64, !alias.scope !15
  store <8 x float> %35, ptr %39, align 32, !alias.scope !15
  %40 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 96
  %41 = getelementptr inbounds nuw i8, ptr %40, i64 32
  %42 = getelementptr inbounds nuw i8, ptr %40, i64 64
  %43 = getelementptr inbounds nuw i8, ptr %40, i64 96
  %wide.load.3 = load <8 x float>, ptr %40, align 64, !invariant.load !1, !noalias !15
  %wide.load9.3 = load <8 x float>, ptr %41, align 32, !invariant.load !1, !noalias !15
  %wide.load10.3 = load <8 x float>, ptr %42, align 64, !invariant.load !1, !noalias !15
  %wide.load11.3 = load <8 x float>, ptr %43, align 32, !invariant.load !1, !noalias !15
  %44 = fdiv <8 x float> %wide.load.3, %broadcast.splat
  %45 = fdiv <8 x float> %wide.load9.3, %broadcast.splat
  %46 = fdiv <8 x float> %wide.load10.3, %broadcast.splat
  %47 = fdiv <8 x float> %wide.load11.3, %broadcast.splat
  %48 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 96
  %49 = getelementptr inbounds nuw i8, ptr %48, i64 32
  %50 = getelementptr inbounds nuw i8, ptr %48, i64 64
  %51 = getelementptr inbounds nuw i8, ptr %48, i64 96
  store <8 x float> %44, ptr %48, align 64, !alias.scope !15
  store <8 x float> %45, ptr %49, align 32, !alias.scope !15
  store <8 x float> %46, ptr %50, align 64, !alias.scope !15
  store <8 x float> %47, ptr %51, align 32, !alias.scope !15
  %52 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 128
  %53 = getelementptr inbounds nuw i8, ptr %52, i64 32
  %54 = getelementptr inbounds nuw i8, ptr %52, i64 64
  %55 = getelementptr inbounds nuw i8, ptr %52, i64 96
  %wide.load.4 = load <8 x float>, ptr %52, align 64, !invariant.load !1, !noalias !15
  %wide.load9.4 = load <8 x float>, ptr %53, align 32, !invariant.load !1, !noalias !15
  %wide.load10.4 = load <8 x float>, ptr %54, align 64, !invariant.load !1, !noalias !15
  %wide.load11.4 = load <8 x float>, ptr %55, align 32, !invariant.load !1, !noalias !15
  %56 = fdiv <8 x float> %wide.load.4, %broadcast.splat
  %57 = fdiv <8 x float> %wide.load9.4, %broadcast.splat
  %58 = fdiv <8 x float> %wide.load10.4, %broadcast.splat
  %59 = fdiv <8 x float> %wide.load11.4, %broadcast.splat
  %60 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 128
  %61 = getelementptr inbounds nuw i8, ptr %60, i64 32
  %62 = getelementptr inbounds nuw i8, ptr %60, i64 64
  %63 = getelementptr inbounds nuw i8, ptr %60, i64 96
  store <8 x float> %56, ptr %60, align 64, !alias.scope !15
  store <8 x float> %57, ptr %61, align 32, !alias.scope !15
  store <8 x float> %58, ptr %62, align 64, !alias.scope !15
  store <8 x float> %59, ptr %63, align 32, !alias.scope !15
  %64 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 160
  %65 = getelementptr inbounds nuw i8, ptr %64, i64 32
  %66 = getelementptr inbounds nuw i8, ptr %64, i64 64
  %67 = getelementptr inbounds nuw i8, ptr %64, i64 96
  %wide.load.5 = load <8 x float>, ptr %64, align 64, !invariant.load !1, !noalias !15
  %wide.load9.5 = load <8 x float>, ptr %65, align 32, !invariant.load !1, !noalias !15
  %wide.load10.5 = load <8 x float>, ptr %66, align 64, !invariant.load !1, !noalias !15
  %wide.load11.5 = load <8 x float>, ptr %67, align 32, !invariant.load !1, !noalias !15
  %68 = fdiv <8 x float> %wide.load.5, %broadcast.splat
  %69 = fdiv <8 x float> %wide.load9.5, %broadcast.splat
  %70 = fdiv <8 x float> %wide.load10.5, %broadcast.splat
  %71 = fdiv <8 x float> %wide.load11.5, %broadcast.splat
  %72 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 160
  %73 = getelementptr inbounds nuw i8, ptr %72, i64 32
  %74 = getelementptr inbounds nuw i8, ptr %72, i64 64
  %75 = getelementptr inbounds nuw i8, ptr %72, i64 96
  store <8 x float> %68, ptr %72, align 64, !alias.scope !15
  store <8 x float> %69, ptr %73, align 32, !alias.scope !15
  store <8 x float> %70, ptr %74, align 64, !alias.scope !15
  store <8 x float> %71, ptr %75, align 32, !alias.scope !15
  %76 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 192
  %77 = getelementptr inbounds nuw i8, ptr %76, i64 32
  %78 = getelementptr inbounds nuw i8, ptr %76, i64 64
  %79 = getelementptr inbounds nuw i8, ptr %76, i64 96
  %wide.load.6 = load <8 x float>, ptr %76, align 64, !invariant.load !1, !noalias !15
  %wide.load9.6 = load <8 x float>, ptr %77, align 32, !invariant.load !1, !noalias !15
  %wide.load10.6 = load <8 x float>, ptr %78, align 64, !invariant.load !1, !noalias !15
  %wide.load11.6 = load <8 x float>, ptr %79, align 32, !invariant.load !1, !noalias !15
  %80 = fdiv <8 x float> %wide.load.6, %broadcast.splat
  %81 = fdiv <8 x float> %wide.load9.6, %broadcast.splat
  %82 = fdiv <8 x float> %wide.load10.6, %broadcast.splat
  %83 = fdiv <8 x float> %wide.load11.6, %broadcast.splat
  %84 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 192
  %85 = getelementptr inbounds nuw i8, ptr %84, i64 32
  %86 = getelementptr inbounds nuw i8, ptr %84, i64 64
  %87 = getelementptr inbounds nuw i8, ptr %84, i64 96
  store <8 x float> %80, ptr %84, align 64, !alias.scope !15
  store <8 x float> %81, ptr %85, align 32, !alias.scope !15
  store <8 x float> %82, ptr %86, align 64, !alias.scope !15
  store <8 x float> %83, ptr %87, align 32, !alias.scope !15
  %88 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 224
  %89 = getelementptr inbounds nuw i8, ptr %88, i64 32
  %90 = getelementptr inbounds nuw i8, ptr %88, i64 64
  %91 = getelementptr inbounds nuw i8, ptr %88, i64 96
  %wide.load.7 = load <8 x float>, ptr %88, align 64, !invariant.load !1, !noalias !15
  %wide.load9.7 = load <8 x float>, ptr %89, align 32, !invariant.load !1, !noalias !15
  %wide.load10.7 = load <8 x float>, ptr %90, align 64, !invariant.load !1, !noalias !15
  %wide.load11.7 = load <8 x float>, ptr %91, align 32, !invariant.load !1, !noalias !15
  %92 = fdiv <8 x float> %wide.load.7, %broadcast.splat
  %93 = fdiv <8 x float> %wide.load9.7, %broadcast.splat
  %94 = fdiv <8 x float> %wide.load10.7, %broadcast.splat
  %95 = fdiv <8 x float> %wide.load11.7, %broadcast.splat
  %96 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 224
  %97 = getelementptr inbounds nuw i8, ptr %96, i64 32
  %98 = getelementptr inbounds nuw i8, ptr %96, i64 64
  %99 = getelementptr inbounds nuw i8, ptr %96, i64 96
  store <8 x float> %92, ptr %96, align 64, !alias.scope !15
  store <8 x float> %93, ptr %97, align 32, !alias.scope !15
  store <8 x float> %94, ptr %98, align 64, !alias.scope !15
  store <8 x float> %95, ptr %99, align 32, !alias.scope !15
  %100 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 256
  %101 = getelementptr inbounds nuw i8, ptr %100, i64 32
  %102 = getelementptr inbounds nuw i8, ptr %100, i64 64
  %103 = getelementptr inbounds nuw i8, ptr %100, i64 96
  %wide.load.8 = load <8 x float>, ptr %100, align 64, !invariant.load !1, !noalias !15
  %wide.load9.8 = load <8 x float>, ptr %101, align 32, !invariant.load !1, !noalias !15
  %wide.load10.8 = load <8 x float>, ptr %102, align 64, !invariant.load !1, !noalias !15
  %wide.load11.8 = load <8 x float>, ptr %103, align 32, !invariant.load !1, !noalias !15
  %104 = fdiv <8 x float> %wide.load.8, %broadcast.splat
  %105 = fdiv <8 x float> %wide.load9.8, %broadcast.splat
  %106 = fdiv <8 x float> %wide.load10.8, %broadcast.splat
  %107 = fdiv <8 x float> %wide.load11.8, %broadcast.splat
  %108 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 256
  %109 = getelementptr inbounds nuw i8, ptr %108, i64 32
  %110 = getelementptr inbounds nuw i8, ptr %108, i64 64
  %111 = getelementptr inbounds nuw i8, ptr %108, i64 96
  store <8 x float> %104, ptr %108, align 64, !alias.scope !15
  store <8 x float> %105, ptr %109, align 32, !alias.scope !15
  store <8 x float> %106, ptr %110, align 64, !alias.scope !15
  store <8 x float> %107, ptr %111, align 32, !alias.scope !15
  %112 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 288
  %113 = getelementptr inbounds nuw i8, ptr %112, i64 32
  %114 = getelementptr inbounds nuw i8, ptr %112, i64 64
  %115 = getelementptr inbounds nuw i8, ptr %112, i64 96
  %wide.load.9 = load <8 x float>, ptr %112, align 64, !invariant.load !1, !noalias !15
  %wide.load9.9 = load <8 x float>, ptr %113, align 32, !invariant.load !1, !noalias !15
  %wide.load10.9 = load <8 x float>, ptr %114, align 64, !invariant.load !1, !noalias !15
  %wide.load11.9 = load <8 x float>, ptr %115, align 32, !invariant.load !1, !noalias !15
  %116 = fdiv <8 x float> %wide.load.9, %broadcast.splat
  %117 = fdiv <8 x float> %wide.load9.9, %broadcast.splat
  %118 = fdiv <8 x float> %wide.load10.9, %broadcast.splat
  %119 = fdiv <8 x float> %wide.load11.9, %broadcast.splat
  %120 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 288
  %121 = getelementptr inbounds nuw i8, ptr %120, i64 32
  %122 = getelementptr inbounds nuw i8, ptr %120, i64 64
  %123 = getelementptr inbounds nuw i8, ptr %120, i64 96
  store <8 x float> %116, ptr %120, align 64, !alias.scope !15
  store <8 x float> %117, ptr %121, align 32, !alias.scope !15
  store <8 x float> %118, ptr %122, align 64, !alias.scope !15
  store <8 x float> %119, ptr %123, align 32, !alias.scope !15
  %124 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 320
  %125 = getelementptr inbounds nuw i8, ptr %124, i64 32
  %126 = getelementptr inbounds nuw i8, ptr %124, i64 64
  %127 = getelementptr inbounds nuw i8, ptr %124, i64 96
  %wide.load.10 = load <8 x float>, ptr %124, align 64, !invariant.load !1, !noalias !15
  %wide.load9.10 = load <8 x float>, ptr %125, align 32, !invariant.load !1, !noalias !15
  %wide.load10.10 = load <8 x float>, ptr %126, align 64, !invariant.load !1, !noalias !15
  %wide.load11.10 = load <8 x float>, ptr %127, align 32, !invariant.load !1, !noalias !15
  %128 = fdiv <8 x float> %wide.load.10, %broadcast.splat
  %129 = fdiv <8 x float> %wide.load9.10, %broadcast.splat
  %130 = fdiv <8 x float> %wide.load10.10, %broadcast.splat
  %131 = fdiv <8 x float> %wide.load11.10, %broadcast.splat
  %132 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 320
  %133 = getelementptr inbounds nuw i8, ptr %132, i64 32
  %134 = getelementptr inbounds nuw i8, ptr %132, i64 64
  %135 = getelementptr inbounds nuw i8, ptr %132, i64 96
  store <8 x float> %128, ptr %132, align 64, !alias.scope !15
  store <8 x float> %129, ptr %133, align 32, !alias.scope !15
  store <8 x float> %130, ptr %134, align 64, !alias.scope !15
  store <8 x float> %131, ptr %135, align 32, !alias.scope !15
  %136 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 352
  %137 = getelementptr inbounds nuw i8, ptr %136, i64 32
  %138 = getelementptr inbounds nuw i8, ptr %136, i64 64
  %139 = getelementptr inbounds nuw i8, ptr %136, i64 96
  %wide.load.11 = load <8 x float>, ptr %136, align 64, !invariant.load !1, !noalias !15
  %wide.load9.11 = load <8 x float>, ptr %137, align 32, !invariant.load !1, !noalias !15
  %wide.load10.11 = load <8 x float>, ptr %138, align 64, !invariant.load !1, !noalias !15
  %wide.load11.11 = load <8 x float>, ptr %139, align 32, !invariant.load !1, !noalias !15
  %140 = fdiv <8 x float> %wide.load.11, %broadcast.splat
  %141 = fdiv <8 x float> %wide.load9.11, %broadcast.splat
  %142 = fdiv <8 x float> %wide.load10.11, %broadcast.splat
  %143 = fdiv <8 x float> %wide.load11.11, %broadcast.splat
  %144 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 352
  %145 = getelementptr inbounds nuw i8, ptr %144, i64 32
  %146 = getelementptr inbounds nuw i8, ptr %144, i64 64
  %147 = getelementptr inbounds nuw i8, ptr %144, i64 96
  store <8 x float> %140, ptr %144, align 64, !alias.scope !15
  store <8 x float> %141, ptr %145, align 32, !alias.scope !15
  store <8 x float> %142, ptr %146, align 64, !alias.scope !15
  store <8 x float> %143, ptr %147, align 32, !alias.scope !15
  %148 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 384
  %149 = getelementptr inbounds nuw i8, ptr %148, i64 32
  %150 = getelementptr inbounds nuw i8, ptr %148, i64 64
  %151 = getelementptr inbounds nuw i8, ptr %148, i64 96
  %wide.load.12 = load <8 x float>, ptr %148, align 64, !invariant.load !1, !noalias !15
  %wide.load9.12 = load <8 x float>, ptr %149, align 32, !invariant.load !1, !noalias !15
  %wide.load10.12 = load <8 x float>, ptr %150, align 64, !invariant.load !1, !noalias !15
  %wide.load11.12 = load <8 x float>, ptr %151, align 32, !invariant.load !1, !noalias !15
  %152 = fdiv <8 x float> %wide.load.12, %broadcast.splat
  %153 = fdiv <8 x float> %wide.load9.12, %broadcast.splat
  %154 = fdiv <8 x float> %wide.load10.12, %broadcast.splat
  %155 = fdiv <8 x float> %wide.load11.12, %broadcast.splat
  %156 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 384
  %157 = getelementptr inbounds nuw i8, ptr %156, i64 32
  %158 = getelementptr inbounds nuw i8, ptr %156, i64 64
  %159 = getelementptr inbounds nuw i8, ptr %156, i64 96
  store <8 x float> %152, ptr %156, align 64, !alias.scope !15
  store <8 x float> %153, ptr %157, align 32, !alias.scope !15
  store <8 x float> %154, ptr %158, align 64, !alias.scope !15
  store <8 x float> %155, ptr %159, align 32, !alias.scope !15
  %160 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 416
  %161 = getelementptr inbounds nuw i8, ptr %160, i64 32
  %162 = getelementptr inbounds nuw i8, ptr %160, i64 64
  %163 = getelementptr inbounds nuw i8, ptr %160, i64 96
  %wide.load.13 = load <8 x float>, ptr %160, align 64, !invariant.load !1, !noalias !15
  %wide.load9.13 = load <8 x float>, ptr %161, align 32, !invariant.load !1, !noalias !15
  %wide.load10.13 = load <8 x float>, ptr %162, align 64, !invariant.load !1, !noalias !15
  %wide.load11.13 = load <8 x float>, ptr %163, align 32, !invariant.load !1, !noalias !15
  %164 = fdiv <8 x float> %wide.load.13, %broadcast.splat
  %165 = fdiv <8 x float> %wide.load9.13, %broadcast.splat
  %166 = fdiv <8 x float> %wide.load10.13, %broadcast.splat
  %167 = fdiv <8 x float> %wide.load11.13, %broadcast.splat
  %168 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 416
  %169 = getelementptr inbounds nuw i8, ptr %168, i64 32
  %170 = getelementptr inbounds nuw i8, ptr %168, i64 64
  %171 = getelementptr inbounds nuw i8, ptr %168, i64 96
  store <8 x float> %164, ptr %168, align 64, !alias.scope !15
  store <8 x float> %165, ptr %169, align 32, !alias.scope !15
  store <8 x float> %166, ptr %170, align 64, !alias.scope !15
  store <8 x float> %167, ptr %171, align 32, !alias.scope !15
  %172 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 448
  %173 = getelementptr inbounds nuw i8, ptr %172, i64 32
  %174 = getelementptr inbounds nuw i8, ptr %172, i64 64
  %175 = getelementptr inbounds nuw i8, ptr %172, i64 96
  %wide.load.14 = load <8 x float>, ptr %172, align 64, !invariant.load !1, !noalias !15
  %wide.load9.14 = load <8 x float>, ptr %173, align 32, !invariant.load !1, !noalias !15
  %wide.load10.14 = load <8 x float>, ptr %174, align 64, !invariant.load !1, !noalias !15
  %wide.load11.14 = load <8 x float>, ptr %175, align 32, !invariant.load !1, !noalias !15
  %176 = fdiv <8 x float> %wide.load.14, %broadcast.splat
  %177 = fdiv <8 x float> %wide.load9.14, %broadcast.splat
  %178 = fdiv <8 x float> %wide.load10.14, %broadcast.splat
  %179 = fdiv <8 x float> %wide.load11.14, %broadcast.splat
  %180 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 448
  %181 = getelementptr inbounds nuw i8, ptr %180, i64 32
  %182 = getelementptr inbounds nuw i8, ptr %180, i64 64
  %183 = getelementptr inbounds nuw i8, ptr %180, i64 96
  store <8 x float> %176, ptr %180, align 64, !alias.scope !15
  store <8 x float> %177, ptr %181, align 32, !alias.scope !15
  store <8 x float> %178, ptr %182, align 64, !alias.scope !15
  store <8 x float> %179, ptr %183, align 32, !alias.scope !15
  %184 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg0, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 480
  %185 = getelementptr inbounds nuw i8, ptr %184, i64 32
  %186 = getelementptr inbounds nuw i8, ptr %184, i64 64
  %187 = getelementptr inbounds nuw i8, ptr %184, i64 96
  %wide.load.15 = load <8 x float>, ptr %184, align 64, !invariant.load !1, !noalias !15
  %wide.load9.15 = load <8 x float>, ptr %185, align 32, !invariant.load !1, !noalias !15
  %wide.load10.15 = load <8 x float>, ptr %186, align 64, !invariant.load !1, !noalias !15
  %wide.load11.15 = load <8 x float>, ptr %187, align 32, !invariant.load !1, !noalias !15
  %188 = fdiv <8 x float> %wide.load.15, %broadcast.splat
  %189 = fdiv <8 x float> %wide.load9.15, %broadcast.splat
  %190 = fdiv <8 x float> %wide.load10.15, %broadcast.splat
  %191 = fdiv <8 x float> %wide.load11.15, %broadcast.splat
  %192 = getelementptr inbounds [32 x [16 x [512 x [512 x float]]]], ptr %arg2, i64 0, i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, i64 480
  %193 = getelementptr inbounds nuw i8, ptr %192, i64 32
  %194 = getelementptr inbounds nuw i8, ptr %192, i64 64
  %195 = getelementptr inbounds nuw i8, ptr %192, i64 96
  store <8 x float> %188, ptr %192, align 64, !alias.scope !15
  store <8 x float> %189, ptr %193, align 32, !alias.scope !15
  store <8 x float> %190, ptr %194, align 64, !alias.scope !15
  store <8 x float> %191, ptr %195, align 32, !alias.scope !15
  %invar.inc6 = add nuw nsw i64 %broadcast_divide_fusion.clone.invar_address.dim.2.02, 1
  %exitcond6 = icmp eq i64 %invar.inc6, 512
  br i1 %exitcond6, label %broadcast_divide_fusion.clone.loop_exit.dim.2, label %vector.ph, !llvm.loop !18

broadcast_divide_fusion.clone.loop_exit.dim.2:    ; preds = %vector.ph
  %invar.inc5 = add nuw nsw i64 %broadcast_divide_fusion.clone.invar_address.dim.1.03, 1
  %exitcond7 = icmp eq i64 %invar.inc5, 16
  br i1 %exitcond7, label %broadcast_divide_fusion.clone.loop_exit.dim.1, label %broadcast_divide_fusion.clone.loop_header.dim.2.preheader, !llvm.loop !19

broadcast_divide_fusion.clone.loop_exit.dim.1:    ; preds = %broadcast_divide_fusion.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %broadcast_divide_fusion.clone.invar_address.dim.0.05, 1
  %exitcond8.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond8.not, label %return, label %broadcast_divide_fusion.clone.loop_header.dim.1.preheader, !llvm.loop !20

return:                                           ; preds = %broadcast_divide_fusion.clone.loop_exit.dim.1, %1
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

!0 = !{i32 1, !"xla_dylib_index", i64 24}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 536870912}
!5 = !{!6}
!6 = !{!"result slice: {index:148, offset:536870912, size:536870912}", !7}
!7 = !{!"XLA host kernel subtract_exponential_fusion.3.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = !{!16}
!16 = !{!"result slice: {index:148, offset:0, size:536870912}", !17}
!17 = !{!"XLA host kernel broadcast_divide_fusion.clone AA domain"}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
!20 = distinct !{!20, !12}
