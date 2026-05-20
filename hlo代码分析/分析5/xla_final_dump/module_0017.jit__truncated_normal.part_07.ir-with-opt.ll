; ModuleID = '__compute_module_part_07'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@maximum_minimum_fusion.clone_parallel_bounds = private unnamed_addr constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 170]], [1 x [2 x i64]] [[2 x i64] [i64 170, i64 340]], [1 x [2 x i64]] [[2 x i64] [i64 340, i64 510]], [1 x [2 x i64]] [[2 x i64] [i64 510, i64 680]], [1 x [2 x i64]] [[2 x i64] [i64 680, i64 850]], [1 x [2 x i64]] [[2 x i64] [i64 850, i64 1020]], [1 x [2 x i64]] [[2 x i64] [i64 1020, i64 1190]], [1 x [2 x i64]] [[2 x i64] [i64 1190, i64 1360]], [1 x [2 x i64]] [[2 x i64] [i64 1360, i64 1530]], [1 x [2 x i64]] [[2 x i64] [i64 1530, i64 1700]], [1 x [2 x i64]] [[2 x i64] [i64 1700, i64 1870]], [1 x [2 x i64]] [[2 x i64] [i64 1870, i64 2048]]]

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #0

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @maximum_minimum_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #1 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg3_gep = getelementptr i8, ptr %args, i64 48
  %arg3 = load ptr, ptr %arg3_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg6_gep = getelementptr i8, ptr %args, i64 96
  %arg6 = load ptr, ptr %arg6_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @maximum_minimum_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @maximum_minimum_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %maximum_minimum_fusion.clone.loop_header.dim.1.preheader.lr.ph, label %return

maximum_minimum_fusion.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg5_gep = getelementptr i8, ptr %args, i64 80
  %arg5 = load ptr, ptr %arg5_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg4_gep = getelementptr i8, ptr %args, i64 64
  %arg4 = load ptr, ptr %arg4_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load i32, ptr %arg5, align 64, !invariant.load !1, !noalias !5
  %3 = sitofp i32 %2 to float
  %4 = bitcast float %3 to i32
  %5 = tail call float @llvm.fabs.f32(float %3)
  %6 = bitcast float %5 to i32
  %7 = icmp eq i32 %6, 0
  %8 = icmp samesign ugt i32 %6, 2139095040
  %9 = icmp sgt i32 %2, -1
  %10 = or i1 %9, %8
  %11 = select i1 %10, i32 -1, i32 1
  %12 = add i32 %11, %4
  %13 = select i1 %7, i32 -2147483647, i32 %12
  %14 = load i32, ptr %arg4, align 64, !invariant.load !1, !noalias !5
  %15 = sitofp i32 %14 to float
  %16 = bitcast float %15 to i32
  %17 = tail call float @llvm.fabs.f32(float %15)
  %18 = bitcast float %17 to i32
  %19 = icmp eq i32 %18, 0
  %20 = icmp samesign ugt i32 %18, 2139095040
  %21 = icmp slt i32 %14, 0
  %22 = or i1 %21, %20
  %23 = select i1 %22, i32 -1, i32 1
  %24 = add i32 %23, %16
  %25 = select i1 %19, i32 1, i32 %24
  %26 = load float, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %27 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  %subtract.34 = fsub float %27, %26
  %broadcast.splatinsert = insertelement <8 x float> poison, float %subtract.34, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  %broadcast.splatinsert5 = insertelement <8 x float> poison, float %26, i64 0
  %broadcast.splat6 = shufflevector <8 x float> %broadcast.splatinsert5, <8 x float> poison, <8 x i32> zeroinitializer
  %28 = insertelement <8 x i32> poison, i32 %25, i64 0
  %broadcast.splatinsert7 = bitcast <8 x i32> %28 to <8 x float>
  %broadcast.splat8 = shufflevector <8 x float> %broadcast.splatinsert7, <8 x float> poison, <8 x i32> zeroinitializer
  %29 = insertelement <8 x i32> poison, i32 %13, i64 0
  %broadcast.splatinsert9 = bitcast <8 x i32> %29 to <8 x float>
  %broadcast.splat10 = shufflevector <8 x float> %broadcast.splatinsert9, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %maximum_minimum_fusion.clone.loop_exit.dim.1, %maximum_minimum_fusion.clone.loop_header.dim.1.preheader.lr.ph
  %maximum_minimum_fusion.clone.invar_address.dim.0.03 = phi i64 [ %lo_dim_0, %maximum_minimum_fusion.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %maximum_minimum_fusion.clone.loop_exit.dim.1 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %30 = getelementptr inbounds [2048 x [2048 x i32]], ptr %arg2, i64 0, i64 %maximum_minimum_fusion.clone.invar_address.dim.0.03, i64 %index
  %wide.load = load <8 x i32>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %31 = getelementptr inbounds [2048 x [2048 x i32]], ptr %arg3, i64 0, i64 %maximum_minimum_fusion.clone.invar_address.dim.0.03, i64 %index
  %wide.load11 = load <8 x i32>, ptr %31, align 32, !invariant.load !1, !noalias !5
  %32 = xor <8 x i32> %wide.load11, %wide.load
  %33 = lshr <8 x i32> %32, splat (i32 9)
  %34 = or disjoint <8 x i32> %33, splat (i32 1065353216)
  %35 = bitcast <8 x i32> %34 to <8 x float>
  %36 = fadd <8 x float> %35, splat (float -1.000000e+00)
  %37 = fmul <8 x float> %broadcast.splat, %36
  %38 = fadd <8 x float> %broadcast.splat6, %37
  %39 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %broadcast.splat6, <8 x float> %38)
  %40 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %39)
  %41 = fcmp oeq <8 x float> %40, splat (float 1.000000e+00)
  %42 = fneg <8 x float> %39
  %43 = fmul <8 x float> %39, %42
  %44 = fadd <8 x float> %43, splat (float 1.000000e+00)
  %log_f32.i = fcmp ule <8 x float> %44, zeroinitializer
  %log_f321.i = sext <8 x i1> %log_f32.i to <8 x i32>
  %log_f322.i = bitcast <8 x i32> %log_f321.i to <8 x float>
  %log_f323.i = fcmp oeq <8 x float> %44, zeroinitializer
  %log_f324.i = sext <8 x i1> %log_f323.i to <8 x i32>
  %log_f325.i = bitcast <8 x i32> %log_f324.i to <8 x float>
  %log_f326.i = fcmp oeq <8 x float> %44, splat (float 0x7FF0000000000000)
  %log_f327.i = sext <8 x i1> %log_f326.i to <8 x i32>
  %log_f328.i = bitcast <8 x i32> %log_f327.i to <8 x float>
  %45 = fcmp uge <8 x float> splat (float 0x3810000000000000), %44
  %46 = select <8 x i1> %45, <8 x float> splat (float 0x3810000000000000), <8 x float> %44
  %47 = bitcast <8 x float> %46 to <8 x i32>
  %48 = lshr <8 x i32> %47, splat (i32 23)
  %log_f329.i = bitcast <8 x float> %46 to <8 x i32>
  %log_f3210.i = and <8 x i32> %log_f329.i, splat (i32 -2139095041)
  %49 = bitcast <8 x i32> %log_f3210.i to <8 x float>
  %log_f3212.i = or <8 x i32> %log_f3210.i, splat (i32 1056964608)
  %log_f3213.i = bitcast <8 x i32> %log_f3212.i to <8 x float>
  %50 = sub <8 x i32> %48, splat (i32 127)
  %51 = sitofp <8 x i32> %50 to <8 x float>
  %log_f3214.i = fadd <8 x float> splat (float 1.000000e+00), %51
  %log_f3215.i = fcmp olt <8 x float> %log_f3213.i, splat (float 0x3FE6A09E60000000)
  %log_f3216.i = sext <8 x i1> %log_f3215.i to <8 x i32>
  %log_f3217.i = bitcast <8 x i32> %log_f3216.i to <8 x float>
  %log_f3220.i = and <8 x i32> %log_f3212.i, %log_f3216.i
  %52 = bitcast <8 x i32> %log_f3220.i to <8 x float>
  %53 = fsub <8 x float> %log_f3213.i, splat (float 1.000000e+00)
  %log_f3222.i = and <8 x i32> %log_f3216.i, splat (i32 1065353216)
  %54 = bitcast <8 x i32> %log_f3222.i to <8 x float>
  %55 = fsub <8 x float> %log_f3214.i, %54
  %log_f3223.i = fadd <8 x float> %53, %52
  %log_f3224.i = fmul <8 x float> %log_f3223.i, %log_f3223.i
  %log_f3225.i = fmul <8 x float> %log_f3224.i, %log_f3223.i
  %log_f3226.i = fmul <8 x float> %log_f3223.i, splat (float 0x3FB2043760000000)
  %log_f3227.i = fadd <8 x float> splat (float 0xBFBD7A3700000000), %log_f3226.i
  %log_f3228.i = fmul <8 x float> %log_f3223.i, splat (float 0xBFBFCBA9E0000000)
  %log_f3229.i = fadd <8 x float> splat (float 0x3FC23D37E0000000), %log_f3228.i
  %log_f3230.i = fmul <8 x float> %log_f3223.i, splat (float 0x3FC999D580000000)
  %log_f3231.i = fadd <8 x float> splat (float 0xBFCFFFFF80000000), %log_f3230.i
  %log_f3232.i = fmul <8 x float> %log_f3227.i, %log_f3223.i
  %log_f3233.i = fadd <8 x float> splat (float 0x3FBDE4A340000000), %log_f3232.i
  %log_f3234.i = fmul <8 x float> %log_f3229.i, %log_f3223.i
  %log_f3235.i = fadd <8 x float> splat (float 0xBFC555CA00000000), %log_f3234.i
  %log_f3236.i = fmul <8 x float> %log_f3231.i, %log_f3223.i
  %log_f3237.i = fadd <8 x float> splat (float 0x3FD5555540000000), %log_f3236.i
  %log_f3238.i = fmul <8 x float> %log_f3233.i, %log_f3225.i
  %log_f3239.i = fadd <8 x float> %log_f3235.i, %log_f3238.i
  %log_f3240.i = fmul <8 x float> %log_f3239.i, %log_f3225.i
  %log_f3241.i = fadd <8 x float> %log_f3237.i, %log_f3240.i
  %log_f3242.i = fmul <8 x float> %log_f3241.i, %log_f3225.i
  %log_f3243.i = fmul <8 x float> splat (float 0xBF2BD01060000000), %55
  %log_f3244.i = fmul <8 x float> splat (float 5.000000e-01), %log_f3224.i
  %log_f3245.i = fadd <8 x float> %log_f3242.i, %log_f3243.i
  %56 = fsub <8 x float> %log_f3223.i, %log_f3244.i
  %log_f3246.i = fmul <8 x float> splat (float 0x3FE6300000000000), %55
  %log_f3247.i = fadd <8 x float> %56, %log_f3245.i
  %log_f3248.i = fadd <8 x float> %log_f3247.i, %log_f3246.i
  %log_f3250.i = and <8 x i32> %log_f324.i, splat (i32 -8388608)
  %57 = bitcast <8 x i32> %log_f3250.i to <8 x float>
  %log_f3252.i = and <8 x i32> %log_f327.i, splat (i32 2139095040)
  %58 = bitcast <8 x i32> %log_f3252.i to <8 x float>
  %log_f3255.i = or <8 x i32> %log_f3250.i, %log_f3252.i
  %log_f3256.i = bitcast <8 x i32> %log_f3255.i to <8 x float>
  %log_f3257.i = bitcast <8 x float> %log_f3248.i to <8 x i32>
  %log_f3259.i = or <8 x i32> %log_f3257.i, %log_f321.i
  %log_f3260.i = bitcast <8 x i32> %log_f3259.i to <8 x float>
  %log_f3263.i = or <8 x i32> %log_f324.i, %log_f327.i
  %log_f3264.i = bitcast <8 x i32> %log_f3263.i to <8 x float>
  %log_f3266.i = xor <8 x i32> %log_f3263.i, splat (i32 -1)
  %59 = bitcast <8 x i32> %log_f3266.i to <8 x float>
  %log_f3269.i = and <8 x i32> %log_f3266.i, %log_f3259.i
  %60 = bitcast <8 x i32> %log_f3269.i to <8 x float>
  %log_f3272.i = or <8 x i32> %log_f3255.i, %log_f3269.i
  %log_f3273.i = bitcast <8 x i32> %log_f3272.i to <8 x float>
  %61 = fmul <8 x float> %43, %43
  %62 = fmul <8 x float> %43, zeroinitializer
  %63 = fadd <8 x float> %62, splat (float 1.000000e+00)
  %64 = fmul <8 x float> %43, %63
  %65 = fadd <8 x float> %64, splat (float 0x402E2035A0000000)
  %66 = fmul <8 x float> %43, %65
  %67 = fadd <8 x float> %66, splat (float 0x4054C30B60000000)
  %68 = fmul <8 x float> %43, %67
  %69 = fadd <8 x float> %68, splat (float 0x406BB865A0000000)
  %70 = fmul <8 x float> %43, %69
  %71 = fadd <8 x float> %70, splat (float 0x4073519460000000)
  %72 = fmul <8 x float> %43, %71
  %73 = fadd <8 x float> %72, splat (float 0x406B0DB140000000)
  %74 = fmul <8 x float> %43, %73
  %75 = fadd <8 x float> %74, splat (float 0x404E0F3040000000)
  %76 = fadd <8 x float> %62, splat (float 0x3F07BC0960000000)
  %77 = fmul <8 x float> %43, %76
  %78 = fadd <8 x float> %77, splat (float 0x3FDFE818A0000000)
  %79 = fmul <8 x float> %43, %78
  %80 = fadd <8 x float> %79, splat (float 0x401A509F40000000)
  %81 = fmul <8 x float> %43, %80
  %82 = fadd <8 x float> %81, splat (float 0x403DE97380000000)
  %83 = fmul <8 x float> %43, %82
  %84 = fadd <8 x float> %83, splat (float 0x404E798EC0000000)
  %85 = fmul <8 x float> %43, %84
  %86 = fadd <8 x float> %85, splat (float 0x404C8E75A0000000)
  %87 = fmul <8 x float> %43, %86
  %88 = fadd <8 x float> %87, splat (float 0x40340A2020000000)
  %89 = fdiv <8 x float> %88, %75
  %90 = fmul <8 x float> %43, %61
  %91 = fmul <8 x float> %90, %89
  %92 = fmul <8 x float> %61, splat (float 5.000000e-01)
  %93 = fsub <8 x float> %91, %92
  %94 = fadd <8 x float> %43, %93
  %95 = tail call <8 x float> @llvm.fabs.v8f32(<8 x float> %43)
  %96 = fcmp olt <8 x float> %95, splat (float 0x3FDA8279A0000000)
  %97 = select <8 x i1> %96, <8 x float> %94, <8 x float> %log_f3273.i
  %98 = fneg <8 x float> %97
  %99 = fcmp ogt <8 x float> %97, splat (float -5.000000e+00)
  %100 = select <8 x i1> %99, <8 x float> splat (float 0x3FF805C5E0000000), <8 x float> splat (float 0x4006A9EFC0000000)
  %101 = select <8 x i1> %99, <8 x float> splat (float 0x3FCF91EC60000000), <8 x float> splat (float 0x3FF006DB60000000)
  %102 = select <8 x i1> %99, <8 x float> splat (float 0xBF711C9DE0000000), <8 x float> splat (float 0x3F8354AFC0000000)
  %103 = select <8 x i1> %99, <8 x float> splat (float 0xBF548A8100000000), <8 x float> splat (float 0xBF7F38BAE0000000)
  %104 = select <8 x i1> %99, <8 x float> splat (float 0x3F2CA65B60000000), <8 x float> splat (float 0x3F77824F60000000)
  %105 = select <8 x i1> %99, <8 x float> splat (float 0xBED26B5820000000), <8 x float> splat (float 0xBF6E17BCE0000000)
  %106 = select <8 x i1> %99, <8 x float> splat (float 0xBECD8E6AE0000000), <8 x float> splat (float 0x3F561B8E40000000)
  %107 = select <8 x i1> %99, <8 x float> splat (float 0x3E970966C0000000), <8 x float> splat (float 0x3F1A76AD60000000)
  %108 = select <8 x i1> %99, <8 x float> splat (float 0x3E5E2CB100000000), <8 x float> splat (float 0xBF2A3E1360000000)
  %109 = fsub <8 x float> splat (float -2.500000e+00), %97
  %110 = tail call <8 x float> @llvm.sqrt.v8f32(<8 x float> %98)
  %111 = fadd <8 x float> %110, splat (float -3.000000e+00)
  %112 = select <8 x i1> %99, <8 x float> %109, <8 x float> %111
  %113 = fmul <8 x float> %108, %112
  %114 = fadd <8 x float> %107, %113
  %115 = fmul <8 x float> %112, %114
  %116 = fadd <8 x float> %106, %115
  %117 = fmul <8 x float> %112, %116
  %118 = fadd <8 x float> %105, %117
  %119 = fmul <8 x float> %112, %118
  %120 = fadd <8 x float> %104, %119
  %121 = fmul <8 x float> %112, %120
  %122 = fadd <8 x float> %103, %121
  %123 = fmul <8 x float> %112, %122
  %124 = fadd <8 x float> %102, %123
  %125 = fmul <8 x float> %112, %124
  %126 = fadd <8 x float> %101, %125
  %127 = fmul <8 x float> %112, %126
  %128 = fadd <8 x float> %100, %127
  %129 = select <8 x i1> %41, <8 x float> splat (float 0x7FF0000000000000), <8 x float> %128
  %130 = fmul <8 x float> %39, %129
  %131 = fmul <8 x float> %130, splat (float 0x3FF6A09E60000000)
  %132 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %broadcast.splat8, <8 x float> %131)
  %133 = tail call <8 x float> @llvm.minimum.v8f32(<8 x float> %broadcast.splat10, <8 x float> %132)
  %134 = getelementptr inbounds [2048 x [2048 x float]], ptr %arg6, i64 0, i64 %maximum_minimum_fusion.clone.invar_address.dim.0.03, i64 %index
  store <8 x float> %133, ptr %134, align 32, !alias.scope !5
  %index.next = add nuw i64 %index, 8
  %135 = icmp eq i64 %index.next, 2048
  br i1 %135, label %maximum_minimum_fusion.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !8

maximum_minimum_fusion.clone.loop_exit.dim.1:     ; preds = %vector.body
  %invar.inc = add nuw nsw i64 %maximum_minimum_fusion.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %vector.ph, !llvm.loop !11

return:                                           ; preds = %maximum_minimum_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximum.v8f32(<8 x float>, <8 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.sqrt.v8f32(<8 x float>) #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.minimum.v8f32(<8 x float>, <8 x float>) #2

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 7}
!1 = !{}
!2 = !{i64 16777216}
!3 = !{i64 64}
!4 = !{i64 4}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:16777216}", !7}
!7 = !{!"XLA host kernel maximum_minimum_fusion.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
