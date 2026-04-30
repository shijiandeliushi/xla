; ModuleID = '__compute_module_tanh.2.clone_elemental_kernel_module'
source_filename = "__compute_module_tanh.2.clone_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@tanh.2.clone_parallel_bounds = private unnamed_addr constant [4 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 8]], [1 x [2 x i64]] [[2 x i64] [i64 8, i64 16]], [1 x [2 x i64]] [[2 x i64] [i64 16, i64 24]], [1 x [2 x i64]] [[2 x i64] [i64 24, i64 32]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @tanh.2.clone_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @tanh.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [4 x [1 x [2 x i64]]], ptr @tanh.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not7 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not7, label %tanh.2.clone.loop_header.dim.1.preheader, label %return

tanh.2.clone.loop_header.dim.1.preheader:         ; preds = %1, %tanh.2.clone.loop_exit.dim.1
  %tanh.2.clone.invar_address.dim.0.08 = phi i64 [ %invar.inc, %tanh.2.clone.loop_exit.dim.1 ], [ %lo_dim_0, %1 ]
  br label %vector.ph

vector.ph:                                        ; preds = %tanh.2.clone.loop_exit.dim.2, %tanh.2.clone.loop_header.dim.1.preheader
  %tanh.2.clone.invar_address.dim.1.06 = phi i64 [ 0, %tanh.2.clone.loop_header.dim.1.preheader ], [ %invar.inc3, %tanh.2.clone.loop_exit.dim.2 ]
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %2 = getelementptr inbounds [32 x [512 x [4096 x float]]], ptr %arg0, i64 0, i64 %tanh.2.clone.invar_address.dim.0.08, i64 %tanh.2.clone.invar_address.dim.1.06, i64 %index
  %3 = getelementptr inbounds nuw i8, ptr %2, i64 32
  %4 = getelementptr inbounds nuw i8, ptr %2, i64 64
  %5 = getelementptr inbounds nuw i8, ptr %2, i64 96
  %wide.load = load <8 x float>, ptr %2, align 64, !invariant.load !1, !noalias !4
  %wide.load11 = load <8 x float>, ptr %3, align 32, !invariant.load !1, !noalias !4
  %wide.load12 = load <8 x float>, ptr %4, align 64, !invariant.load !1, !noalias !4
  %wide.load13 = load <8 x float>, ptr %5, align 32, !invariant.load !1, !noalias !4
  %6 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %wide.load)
  %7 = fcmp olt <8 x float> %6, splat (float 0x3F3A36E2E0000000)
  %8 = fcmp uge <8 x float> %wide.load, splat (float 0xC01FFEC880000000)
  %9 = select <8 x i1> %8, <8 x float> %wide.load, <8 x float> splat (float 0xC01FFEC880000000)
  %10 = fcmp ule <8 x float> %9, splat (float 0x401FFEC880000000)
  %11 = select <8 x i1> %10, <8 x float> %9, <8 x float> splat (float 0x401FFEC880000000)
  %12 = fmul <8 x float> %11, %11
  %13 = fmul <8 x float> %12, splat (float 0xBCB3E4B800000000)
  %14 = fadd <8 x float> %13, splat (float 0x3D4C266FC0000000)
  %15 = fmul <8 x float> %12, %14
  %16 = fadd <8 x float> %15, splat (float 0xBDD7A6FFE0000000)
  %17 = fmul <8 x float> %12, %16
  %18 = fadd <8 x float> %17, splat (float 0x3E6B800820000000)
  %19 = fmul <8 x float> %12, %18
  %20 = fadd <8 x float> %19, splat (float 0x3EEF286940000000)
  %21 = fmul <8 x float> %12, %20
  %22 = fadd <8 x float> %21, splat (float 0x3F44E1BDA0000000)
  %23 = fmul <8 x float> %12, %22
  %24 = fadd <8 x float> %23, splat (float 0x3F740B3B80000000)
  %25 = fmul <8 x float> %11, %24
  %26 = fmul <8 x float> %12, splat (float 0x3EB41A7B00000000)
  %27 = fadd <8 x float> %26, splat (float 0x3F1F12BAC0000000)
  %28 = fmul <8 x float> %12, %27
  %29 = fadd <8 x float> %28, splat (float 0x3F629540A0000000)
  %30 = fmul <8 x float> %12, %29
  %31 = fadd <8 x float> %30, splat (float 0x3F740B3BA0000000)
  %32 = fdiv <8 x float> %25, %31
  %33 = select <8 x i1> %7, <8 x float> %wide.load, <8 x float> %32
  %34 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %wide.load11)
  %35 = fcmp olt <8 x float> %34, splat (float 0x3F3A36E2E0000000)
  %36 = fcmp uge <8 x float> %wide.load11, splat (float 0xC01FFEC880000000)
  %37 = select <8 x i1> %36, <8 x float> %wide.load11, <8 x float> splat (float 0xC01FFEC880000000)
  %38 = fcmp ule <8 x float> %37, splat (float 0x401FFEC880000000)
  %39 = select <8 x i1> %38, <8 x float> %37, <8 x float> splat (float 0x401FFEC880000000)
  %40 = fmul <8 x float> %39, %39
  %41 = fmul <8 x float> %40, splat (float 0xBCB3E4B800000000)
  %42 = fadd <8 x float> %41, splat (float 0x3D4C266FC0000000)
  %43 = fmul <8 x float> %40, %42
  %44 = fadd <8 x float> %43, splat (float 0xBDD7A6FFE0000000)
  %45 = fmul <8 x float> %40, %44
  %46 = fadd <8 x float> %45, splat (float 0x3E6B800820000000)
  %47 = fmul <8 x float> %40, %46
  %48 = fadd <8 x float> %47, splat (float 0x3EEF286940000000)
  %49 = fmul <8 x float> %40, %48
  %50 = fadd <8 x float> %49, splat (float 0x3F44E1BDA0000000)
  %51 = fmul <8 x float> %40, %50
  %52 = fadd <8 x float> %51, splat (float 0x3F740B3B80000000)
  %53 = fmul <8 x float> %39, %52
  %54 = fmul <8 x float> %40, splat (float 0x3EB41A7B00000000)
  %55 = fadd <8 x float> %54, splat (float 0x3F1F12BAC0000000)
  %56 = fmul <8 x float> %40, %55
  %57 = fadd <8 x float> %56, splat (float 0x3F629540A0000000)
  %58 = fmul <8 x float> %40, %57
  %59 = fadd <8 x float> %58, splat (float 0x3F740B3BA0000000)
  %60 = fdiv <8 x float> %53, %59
  %61 = select <8 x i1> %35, <8 x float> %wide.load11, <8 x float> %60
  %62 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %wide.load12)
  %63 = fcmp olt <8 x float> %62, splat (float 0x3F3A36E2E0000000)
  %64 = fcmp uge <8 x float> %wide.load12, splat (float 0xC01FFEC880000000)
  %65 = select <8 x i1> %64, <8 x float> %wide.load12, <8 x float> splat (float 0xC01FFEC880000000)
  %66 = fcmp ule <8 x float> %65, splat (float 0x401FFEC880000000)
  %67 = select <8 x i1> %66, <8 x float> %65, <8 x float> splat (float 0x401FFEC880000000)
  %68 = fmul <8 x float> %67, %67
  %69 = fmul <8 x float> %68, splat (float 0xBCB3E4B800000000)
  %70 = fadd <8 x float> %69, splat (float 0x3D4C266FC0000000)
  %71 = fmul <8 x float> %68, %70
  %72 = fadd <8 x float> %71, splat (float 0xBDD7A6FFE0000000)
  %73 = fmul <8 x float> %68, %72
  %74 = fadd <8 x float> %73, splat (float 0x3E6B800820000000)
  %75 = fmul <8 x float> %68, %74
  %76 = fadd <8 x float> %75, splat (float 0x3EEF286940000000)
  %77 = fmul <8 x float> %68, %76
  %78 = fadd <8 x float> %77, splat (float 0x3F44E1BDA0000000)
  %79 = fmul <8 x float> %68, %78
  %80 = fadd <8 x float> %79, splat (float 0x3F740B3B80000000)
  %81 = fmul <8 x float> %67, %80
  %82 = fmul <8 x float> %68, splat (float 0x3EB41A7B00000000)
  %83 = fadd <8 x float> %82, splat (float 0x3F1F12BAC0000000)
  %84 = fmul <8 x float> %68, %83
  %85 = fadd <8 x float> %84, splat (float 0x3F629540A0000000)
  %86 = fmul <8 x float> %68, %85
  %87 = fadd <8 x float> %86, splat (float 0x3F740B3BA0000000)
  %88 = fdiv <8 x float> %81, %87
  %89 = select <8 x i1> %63, <8 x float> %wide.load12, <8 x float> %88
  %90 = call <8 x float> @llvm.fabs.v8f32(<8 x float> %wide.load13)
  %91 = fcmp olt <8 x float> %90, splat (float 0x3F3A36E2E0000000)
  %92 = fcmp uge <8 x float> %wide.load13, splat (float 0xC01FFEC880000000)
  %93 = select <8 x i1> %92, <8 x float> %wide.load13, <8 x float> splat (float 0xC01FFEC880000000)
  %94 = fcmp ule <8 x float> %93, splat (float 0x401FFEC880000000)
  %95 = select <8 x i1> %94, <8 x float> %93, <8 x float> splat (float 0x401FFEC880000000)
  %96 = fmul <8 x float> %95, %95
  %97 = fmul <8 x float> %96, splat (float 0xBCB3E4B800000000)
  %98 = fadd <8 x float> %97, splat (float 0x3D4C266FC0000000)
  %99 = fmul <8 x float> %96, %98
  %100 = fadd <8 x float> %99, splat (float 0xBDD7A6FFE0000000)
  %101 = fmul <8 x float> %96, %100
  %102 = fadd <8 x float> %101, splat (float 0x3E6B800820000000)
  %103 = fmul <8 x float> %96, %102
  %104 = fadd <8 x float> %103, splat (float 0x3EEF286940000000)
  %105 = fmul <8 x float> %96, %104
  %106 = fadd <8 x float> %105, splat (float 0x3F44E1BDA0000000)
  %107 = fmul <8 x float> %96, %106
  %108 = fadd <8 x float> %107, splat (float 0x3F740B3B80000000)
  %109 = fmul <8 x float> %95, %108
  %110 = fmul <8 x float> %96, splat (float 0x3EB41A7B00000000)
  %111 = fadd <8 x float> %110, splat (float 0x3F1F12BAC0000000)
  %112 = fmul <8 x float> %96, %111
  %113 = fadd <8 x float> %112, splat (float 0x3F629540A0000000)
  %114 = fmul <8 x float> %96, %113
  %115 = fadd <8 x float> %114, splat (float 0x3F740B3BA0000000)
  %116 = fdiv <8 x float> %109, %115
  %117 = select <8 x i1> %91, <8 x float> %wide.load13, <8 x float> %116
  %118 = getelementptr inbounds [32 x [512 x [4096 x float]]], ptr %arg1, i64 0, i64 %tanh.2.clone.invar_address.dim.0.08, i64 %tanh.2.clone.invar_address.dim.1.06, i64 %index
  %119 = getelementptr inbounds nuw i8, ptr %118, i64 32
  %120 = getelementptr inbounds nuw i8, ptr %118, i64 64
  %121 = getelementptr inbounds nuw i8, ptr %118, i64 96
  store <8 x float> %33, ptr %118, align 64, !alias.scope !4
  store <8 x float> %61, ptr %119, align 32, !alias.scope !4
  store <8 x float> %89, ptr %120, align 64, !alias.scope !4
  store <8 x float> %117, ptr %121, align 32, !alias.scope !4
  %index.next = add nuw i64 %index, 32
  %122 = icmp eq i64 %index.next, 4096
  br i1 %122, label %tanh.2.clone.loop_exit.dim.2, label %vector.body, !llvm.loop !7

tanh.2.clone.loop_exit.dim.2:                     ; preds = %vector.body
  %invar.inc3 = add nuw nsw i64 %tanh.2.clone.invar_address.dim.1.06, 1
  %exitcond9 = icmp eq i64 %invar.inc3, 512
  br i1 %exitcond9, label %tanh.2.clone.loop_exit.dim.1, label %vector.ph, !llvm.loop !10

tanh.2.clone.loop_exit.dim.1:                     ; preds = %tanh.2.clone.loop_exit.dim.2
  %invar.inc = add nuw nsw i64 %tanh.2.clone.invar_address.dim.0.08, 1
  %exitcond10.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond10.not, label %return, label %tanh.2.clone.loop_header.dim.1.preheader, !llvm.loop !12

return:                                           ; preds = %tanh.2.clone.loop_exit.dim.1, %1
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
!2 = !{i64 268435456}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:0, offset:0, size:268435456}", !6}
!6 = !{!"XLA host kernel tanh.2.clone_kernel AA domain"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.isvectorized", i32 1}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = distinct !{!12, !11}
