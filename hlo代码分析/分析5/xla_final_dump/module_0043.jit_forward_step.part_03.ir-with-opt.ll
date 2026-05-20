; ModuleID = '__compute_module_part_03'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@multiply_multiply_fusion.clone_parallel_bounds = private unnamed_addr constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 10]], [1 x [2 x i64]] [[2 x i64] [i64 10, i64 20]], [1 x [2 x i64]] [[2 x i64] [i64 20, i64 30]], [1 x [2 x i64]] [[2 x i64] [i64 30, i64 40]], [1 x [2 x i64]] [[2 x i64] [i64 40, i64 50]], [1 x [2 x i64]] [[2 x i64] [i64 50, i64 60]], [1 x [2 x i64]] [[2 x i64] [i64 60, i64 70]], [1 x [2 x i64]] [[2 x i64] [i64 70, i64 80]], [1 x [2 x i64]] [[2 x i64] [i64 80, i64 90]], [1 x [2 x i64]] [[2 x i64] [i64 90, i64 100]], [1 x [2 x i64]] [[2 x i64] [i64 100, i64 110]], [1 x [2 x i64]] [[2 x i64] [i64 110, i64 128]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @multiply_multiply_fusion.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @multiply_multiply_fusion.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %multiply_multiply_fusion.clone.loop_header.dim.1.preheader.preheader, label %return

multiply_multiply_fusion.clone.loop_header.dim.1.preheader.preheader: ; preds = %1
  %arg25 = ptrtoint ptr %arg2 to i64
  %arg17 = ptrtoint ptr %arg1 to i64
  %2 = shl i64 %lo_dim_0, 13
  %3 = add i64 %2, %arg25
  %4 = sub i64 %3, %arg17
  %diff.check = icmp eq ptr %arg2, %arg0
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %multiply_multiply_fusion.clone.loop_exit.dim.1, %multiply_multiply_fusion.clone.loop_header.dim.1.preheader.preheader
  %indvar = phi i64 [ 0, %multiply_multiply_fusion.clone.loop_header.dim.1.preheader.preheader ], [ %indvar.next, %multiply_multiply_fusion.clone.loop_exit.dim.1 ]
  %multiply_multiply_fusion.clone.invar_address.dim.0.03 = phi i64 [ %lo_dim_0, %multiply_multiply_fusion.clone.loop_header.dim.1.preheader.preheader ], [ %invar.inc, %multiply_multiply_fusion.clone.loop_exit.dim.1 ]
  %.neg = mul i64 %indvar, -8192
  %diff.check8 = icmp eq i64 %4, %.neg
  %conflict.rdx = or i1 %diff.check, %diff.check8
  br i1 %conflict.rdx, label %multiply_multiply_fusion.clone.loop_body.dim.1, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.memcheck ]
  %5 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %index
  %wide.load = load <8 x float>, ptr %5, align 32
  %6 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %index
  %wide.load9 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %7 = fadd <8 x float> %wide.load, %wide.load9
  %8 = fmul <8 x float> %7, %7
  %9 = fmul <8 x float> %7, %8
  %10 = fmul <8 x float> %9, splat (float 0x3FA6E4E260000000)
  %11 = fadd <8 x float> %7, %10
  %12 = fmul <8 x float> %11, splat (float 0x3FE9884540000000)
  %13 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %12)
  %14 = fcmp olt <8 x float> %13, splat (float 0x3F3A36E2E0000000)
  %15 = fcmp uge <8 x float> %12, splat (float 0xC01FFEC880000000)
  %16 = select <8 x i1> %15, <8 x float> %12, <8 x float> splat (float 0xC01FFEC880000000)
  %17 = fcmp ule <8 x float> %16, splat (float 0x401FFEC880000000)
  %18 = select <8 x i1> %17, <8 x float> %16, <8 x float> splat (float 0x401FFEC880000000)
  %19 = fmul <8 x float> %18, %18
  %20 = fmul <8 x float> %19, splat (float 0xBCB3E4B800000000)
  %21 = fadd <8 x float> %20, splat (float 0x3D4C266FC0000000)
  %22 = fmul <8 x float> %19, %21
  %23 = fadd <8 x float> %22, splat (float 0xBDD7A6FFE0000000)
  %24 = fmul <8 x float> %19, %23
  %25 = fadd <8 x float> %24, splat (float 0x3E6B800820000000)
  %26 = fmul <8 x float> %19, %25
  %27 = fadd <8 x float> %26, splat (float 0x3EEF286940000000)
  %28 = fmul <8 x float> %19, %27
  %29 = fadd <8 x float> %28, splat (float 0x3F44E1BDA0000000)
  %30 = fmul <8 x float> %19, %29
  %31 = fadd <8 x float> %30, splat (float 0x3F740B3B80000000)
  %32 = fmul <8 x float> %18, %31
  %33 = fmul <8 x float> %19, splat (float 0x3EB41A7B00000000)
  %34 = fadd <8 x float> %33, splat (float 0x3F1F12BAC0000000)
  %35 = fmul <8 x float> %19, %34
  %36 = fadd <8 x float> %35, splat (float 0x3F629540A0000000)
  %37 = fmul <8 x float> %19, %36
  %38 = fadd <8 x float> %37, splat (float 0x3F740B3BA0000000)
  %39 = fdiv <8 x float> %32, %38
  %40 = select <8 x i1> %14, <8 x float> %12, <8 x float> %39
  %41 = fadd <8 x float> %40, splat (float 1.000000e+00)
  %42 = fmul <8 x float> %41, splat (float 5.000000e-01)
  %43 = fmul <8 x float> %7, %42
  %44 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %index
  store <8 x float> %43, ptr %44, align 32, !alias.scope !5
  %index.next = add nuw i64 %index, 8
  %45 = icmp eq i64 %index.next, 2048
  br i1 %45, label %multiply_multiply_fusion.clone.loop_exit.dim.1, label %vector.body, !llvm.loop !8

multiply_multiply_fusion.clone.loop_body.dim.1:   ; preds = %vector.memcheck, %multiply_multiply_fusion.clone.loop_body.dim.1
  %multiply_multiply_fusion.clone.invar_address.dim.1.01 = phi i64 [ %invar.inc5.3, %multiply_multiply_fusion.clone.loop_body.dim.1 ], [ 0, %vector.memcheck ]
  %46 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01
  %47 = load float, ptr %46, align 16
  %48 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01
  %49 = load float, ptr %48, align 16, !invariant.load !1, !noalias !5
  %add.14 = fadd float %47, %49
  %multiply.35 = fmul float %add.14, %add.14
  %multiply.34 = fmul float %add.14, %multiply.35
  %multiply.33 = fmul float %multiply.34, 0x3FA6E4E260000000
  %add.13 = fadd float %add.14, %multiply.33
  %multiply.30 = fmul float %add.13, 0x3FE9884540000000
  %50 = insertelement <1 x float> undef, float %multiply.30, i64 0
  %51 = call <1 x float> @llvm.fabs.v1f32(<1 x float> %50)
  %52 = fcmp olt <1 x float> %51, splat (float 0x3F3A36E2E0000000)
  %53 = fcmp uge <1 x float> %50, splat (float 0xC01FFEC880000000)
  %54 = select <1 x i1> %53, <1 x float> %50, <1 x float> splat (float 0xC01FFEC880000000)
  %55 = fcmp ule <1 x float> %54, splat (float 0x401FFEC880000000)
  %56 = select <1 x i1> %55, <1 x float> %54, <1 x float> splat (float 0x401FFEC880000000)
  %57 = fmul <1 x float> %56, %56
  %58 = fmul <1 x float> %57, splat (float 0xBCB3E4B800000000)
  %59 = fadd <1 x float> %58, splat (float 0x3D4C266FC0000000)
  %60 = fmul <1 x float> %57, %59
  %61 = fadd <1 x float> %60, splat (float 0xBDD7A6FFE0000000)
  %62 = fmul <1 x float> %57, %61
  %63 = fadd <1 x float> %62, splat (float 0x3E6B800820000000)
  %64 = fmul <1 x float> %57, %63
  %65 = fadd <1 x float> %64, splat (float 0x3EEF286940000000)
  %66 = fmul <1 x float> %57, %65
  %67 = fadd <1 x float> %66, splat (float 0x3F44E1BDA0000000)
  %68 = fmul <1 x float> %57, %67
  %69 = fadd <1 x float> %68, splat (float 0x3F740B3B80000000)
  %70 = fmul <1 x float> %56, %69
  %71 = fmul <1 x float> %57, splat (float 0x3EB41A7B00000000)
  %72 = fadd <1 x float> %71, splat (float 0x3F1F12BAC0000000)
  %73 = fmul <1 x float> %57, %72
  %74 = fadd <1 x float> %73, splat (float 0x3F629540A0000000)
  %75 = fmul <1 x float> %57, %74
  %76 = fadd <1 x float> %75, splat (float 0x3F740B3BA0000000)
  %77 = fdiv <1 x float> %70, %76
  %78 = select <1 x i1> %52, <1 x float> %50, <1 x float> %77
  %79 = extractelement <1 x float> %78, i64 0
  %add.12 = fadd float %79, 1.000000e+00
  %multiply.29 = fmul float %add.12, 5.000000e-01
  %multiply.27 = fmul float %add.14, %multiply.29
  %80 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01
  store float %multiply.27, ptr %80, align 16, !alias.scope !5
  %invar.inc5 = or disjoint i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01, 1
  %81 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %invar.inc5
  %82 = load float, ptr %81, align 4
  %83 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %invar.inc5
  %84 = load float, ptr %83, align 4, !invariant.load !1, !noalias !5
  %add.14.1 = fadd float %82, %84
  %multiply.35.1 = fmul float %add.14.1, %add.14.1
  %multiply.34.1 = fmul float %add.14.1, %multiply.35.1
  %multiply.33.1 = fmul float %multiply.34.1, 0x3FA6E4E260000000
  %add.13.1 = fadd float %add.14.1, %multiply.33.1
  %multiply.30.1 = fmul float %add.13.1, 0x3FE9884540000000
  %85 = insertelement <1 x float> undef, float %multiply.30.1, i64 0
  %86 = call <1 x float> @llvm.fabs.v1f32(<1 x float> %85)
  %87 = fcmp olt <1 x float> %86, splat (float 0x3F3A36E2E0000000)
  %88 = fcmp uge <1 x float> %85, splat (float 0xC01FFEC880000000)
  %89 = select <1 x i1> %88, <1 x float> %85, <1 x float> splat (float 0xC01FFEC880000000)
  %90 = fcmp ule <1 x float> %89, splat (float 0x401FFEC880000000)
  %91 = select <1 x i1> %90, <1 x float> %89, <1 x float> splat (float 0x401FFEC880000000)
  %92 = fmul <1 x float> %91, %91
  %93 = fmul <1 x float> %92, splat (float 0xBCB3E4B800000000)
  %94 = fadd <1 x float> %93, splat (float 0x3D4C266FC0000000)
  %95 = fmul <1 x float> %92, %94
  %96 = fadd <1 x float> %95, splat (float 0xBDD7A6FFE0000000)
  %97 = fmul <1 x float> %92, %96
  %98 = fadd <1 x float> %97, splat (float 0x3E6B800820000000)
  %99 = fmul <1 x float> %92, %98
  %100 = fadd <1 x float> %99, splat (float 0x3EEF286940000000)
  %101 = fmul <1 x float> %92, %100
  %102 = fadd <1 x float> %101, splat (float 0x3F44E1BDA0000000)
  %103 = fmul <1 x float> %92, %102
  %104 = fadd <1 x float> %103, splat (float 0x3F740B3B80000000)
  %105 = fmul <1 x float> %91, %104
  %106 = fmul <1 x float> %92, splat (float 0x3EB41A7B00000000)
  %107 = fadd <1 x float> %106, splat (float 0x3F1F12BAC0000000)
  %108 = fmul <1 x float> %92, %107
  %109 = fadd <1 x float> %108, splat (float 0x3F629540A0000000)
  %110 = fmul <1 x float> %92, %109
  %111 = fadd <1 x float> %110, splat (float 0x3F740B3BA0000000)
  %112 = fdiv <1 x float> %105, %111
  %113 = select <1 x i1> %87, <1 x float> %85, <1 x float> %112
  %114 = extractelement <1 x float> %113, i64 0
  %add.12.1 = fadd float %114, 1.000000e+00
  %multiply.29.1 = fmul float %add.12.1, 5.000000e-01
  %multiply.27.1 = fmul float %add.14.1, %multiply.29.1
  %115 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %invar.inc5
  store float %multiply.27.1, ptr %115, align 4, !alias.scope !5
  %invar.inc5.1 = or disjoint i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01, 2
  %116 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %invar.inc5.1
  %117 = load float, ptr %116, align 8
  %118 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %invar.inc5.1
  %119 = load float, ptr %118, align 8, !invariant.load !1, !noalias !5
  %add.14.2 = fadd float %117, %119
  %multiply.35.2 = fmul float %add.14.2, %add.14.2
  %multiply.34.2 = fmul float %add.14.2, %multiply.35.2
  %multiply.33.2 = fmul float %multiply.34.2, 0x3FA6E4E260000000
  %add.13.2 = fadd float %add.14.2, %multiply.33.2
  %multiply.30.2 = fmul float %add.13.2, 0x3FE9884540000000
  %120 = insertelement <1 x float> undef, float %multiply.30.2, i64 0
  %121 = call <1 x float> @llvm.fabs.v1f32(<1 x float> %120)
  %122 = fcmp olt <1 x float> %121, splat (float 0x3F3A36E2E0000000)
  %123 = fcmp uge <1 x float> %120, splat (float 0xC01FFEC880000000)
  %124 = select <1 x i1> %123, <1 x float> %120, <1 x float> splat (float 0xC01FFEC880000000)
  %125 = fcmp ule <1 x float> %124, splat (float 0x401FFEC880000000)
  %126 = select <1 x i1> %125, <1 x float> %124, <1 x float> splat (float 0x401FFEC880000000)
  %127 = fmul <1 x float> %126, %126
  %128 = fmul <1 x float> %127, splat (float 0xBCB3E4B800000000)
  %129 = fadd <1 x float> %128, splat (float 0x3D4C266FC0000000)
  %130 = fmul <1 x float> %127, %129
  %131 = fadd <1 x float> %130, splat (float 0xBDD7A6FFE0000000)
  %132 = fmul <1 x float> %127, %131
  %133 = fadd <1 x float> %132, splat (float 0x3E6B800820000000)
  %134 = fmul <1 x float> %127, %133
  %135 = fadd <1 x float> %134, splat (float 0x3EEF286940000000)
  %136 = fmul <1 x float> %127, %135
  %137 = fadd <1 x float> %136, splat (float 0x3F44E1BDA0000000)
  %138 = fmul <1 x float> %127, %137
  %139 = fadd <1 x float> %138, splat (float 0x3F740B3B80000000)
  %140 = fmul <1 x float> %126, %139
  %141 = fmul <1 x float> %127, splat (float 0x3EB41A7B00000000)
  %142 = fadd <1 x float> %141, splat (float 0x3F1F12BAC0000000)
  %143 = fmul <1 x float> %127, %142
  %144 = fadd <1 x float> %143, splat (float 0x3F629540A0000000)
  %145 = fmul <1 x float> %127, %144
  %146 = fadd <1 x float> %145, splat (float 0x3F740B3BA0000000)
  %147 = fdiv <1 x float> %140, %146
  %148 = select <1 x i1> %122, <1 x float> %120, <1 x float> %147
  %149 = extractelement <1 x float> %148, i64 0
  %add.12.2 = fadd float %149, 1.000000e+00
  %multiply.29.2 = fmul float %add.12.2, 5.000000e-01
  %multiply.27.2 = fmul float %add.14.2, %multiply.29.2
  %150 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %invar.inc5.1
  store float %multiply.27.2, ptr %150, align 8, !alias.scope !5
  %invar.inc5.2 = or disjoint i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01, 3
  %151 = getelementptr inbounds [128 x [2048 x float]], ptr %arg0, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %invar.inc5.2
  %152 = load float, ptr %151, align 4
  %153 = getelementptr inbounds nuw [2048 x float], ptr %arg1, i64 0, i64 %invar.inc5.2
  %154 = load float, ptr %153, align 4, !invariant.load !1, !noalias !5
  %add.14.3 = fadd float %152, %154
  %multiply.35.3 = fmul float %add.14.3, %add.14.3
  %multiply.34.3 = fmul float %add.14.3, %multiply.35.3
  %multiply.33.3 = fmul float %multiply.34.3, 0x3FA6E4E260000000
  %add.13.3 = fadd float %add.14.3, %multiply.33.3
  %multiply.30.3 = fmul float %add.13.3, 0x3FE9884540000000
  %155 = insertelement <1 x float> undef, float %multiply.30.3, i64 0
  %156 = call <1 x float> @llvm.fabs.v1f32(<1 x float> %155)
  %157 = fcmp olt <1 x float> %156, splat (float 0x3F3A36E2E0000000)
  %158 = fcmp uge <1 x float> %155, splat (float 0xC01FFEC880000000)
  %159 = select <1 x i1> %158, <1 x float> %155, <1 x float> splat (float 0xC01FFEC880000000)
  %160 = fcmp ule <1 x float> %159, splat (float 0x401FFEC880000000)
  %161 = select <1 x i1> %160, <1 x float> %159, <1 x float> splat (float 0x401FFEC880000000)
  %162 = fmul <1 x float> %161, %161
  %163 = fmul <1 x float> %162, splat (float 0xBCB3E4B800000000)
  %164 = fadd <1 x float> %163, splat (float 0x3D4C266FC0000000)
  %165 = fmul <1 x float> %162, %164
  %166 = fadd <1 x float> %165, splat (float 0xBDD7A6FFE0000000)
  %167 = fmul <1 x float> %162, %166
  %168 = fadd <1 x float> %167, splat (float 0x3E6B800820000000)
  %169 = fmul <1 x float> %162, %168
  %170 = fadd <1 x float> %169, splat (float 0x3EEF286940000000)
  %171 = fmul <1 x float> %162, %170
  %172 = fadd <1 x float> %171, splat (float 0x3F44E1BDA0000000)
  %173 = fmul <1 x float> %162, %172
  %174 = fadd <1 x float> %173, splat (float 0x3F740B3B80000000)
  %175 = fmul <1 x float> %161, %174
  %176 = fmul <1 x float> %162, splat (float 0x3EB41A7B00000000)
  %177 = fadd <1 x float> %176, splat (float 0x3F1F12BAC0000000)
  %178 = fmul <1 x float> %162, %177
  %179 = fadd <1 x float> %178, splat (float 0x3F629540A0000000)
  %180 = fmul <1 x float> %162, %179
  %181 = fadd <1 x float> %180, splat (float 0x3F740B3BA0000000)
  %182 = fdiv <1 x float> %175, %181
  %183 = select <1 x i1> %157, <1 x float> %155, <1 x float> %182
  %184 = extractelement <1 x float> %183, i64 0
  %add.12.3 = fadd float %184, 1.000000e+00
  %multiply.29.3 = fmul float %add.12.3, 5.000000e-01
  %multiply.27.3 = fmul float %add.14.3, %multiply.29.3
  %185 = getelementptr inbounds [128 x [2048 x float]], ptr %arg2, i64 0, i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, i64 %invar.inc5.2
  store float %multiply.27.3, ptr %185, align 4, !alias.scope !5
  %invar.inc5.3 = add nuw nsw i64 %multiply_multiply_fusion.clone.invar_address.dim.1.01, 4
  %exitcond.3 = icmp eq i64 %invar.inc5.3, 2048
  br i1 %exitcond.3, label %multiply_multiply_fusion.clone.loop_exit.dim.1, label %multiply_multiply_fusion.clone.loop_body.dim.1, !llvm.loop !11

multiply_multiply_fusion.clone.loop_exit.dim.1:   ; preds = %vector.body, %multiply_multiply_fusion.clone.loop_body.dim.1
  %invar.inc = add nuw nsw i64 %multiply_multiply_fusion.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond4.not, label %return, label %vector.memcheck, !llvm.loop !12

return:                                           ; preds = %multiply_multiply_fusion.clone.loop_exit.dim.1, %1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <1 x float> @llvm.fabs.v1f32(<1 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x float> @llvm.fabs.v4f32(<4 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.fabs.v8f32(<8 x float>) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <16 x float> @llvm.fabs.v16f32(<16 x float>) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 3}
!1 = !{}
!2 = !{i64 1048576}
!3 = !{i64 64}
!4 = !{i64 8192}
!5 = !{!6}
!6 = !{!"result slice: {index:4, offset:0, size:1048576}", !7}
!7 = !{!"XLA host kernel multiply_multiply_fusion.clone AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
