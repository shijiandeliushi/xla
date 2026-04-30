; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_maximum_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg010 = ptrtoint ptr %arg0 to i64
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg111 = ptrtoint ptr %arg1 to i64
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg29 = ptrtoint ptr %arg2 to i64
  %2 = sub i64 %arg29, %arg010
  %3 = sub i64 %arg29, %arg111
  %diff.check = icmp ult i64 %2, 128
  %4 = getelementptr inbounds nuw i8, ptr %arg1, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %arg1, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %arg1, i64 96
  %wide.load16 = load <8 x float>, ptr %arg1, align 64
  %wide.load17 = load <8 x float>, ptr %4, align 32
  %wide.load18 = load <8 x float>, ptr %5, align 64
  %wide.load19 = load <8 x float>, ptr %6, align 32
  %7 = getelementptr inbounds nuw i8, ptr %arg1, i64 128
  %8 = getelementptr inbounds nuw i8, ptr %arg1, i64 160
  %9 = getelementptr inbounds nuw i8, ptr %arg1, i64 192
  %10 = getelementptr inbounds nuw i8, ptr %arg1, i64 224
  %wide.load16.1 = load <8 x float>, ptr %7, align 64
  %wide.load17.1 = load <8 x float>, ptr %8, align 32
  %wide.load18.1 = load <8 x float>, ptr %9, align 64
  %wide.load19.1 = load <8 x float>, ptr %10, align 32
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %broadcast_maximum_fusion.loop_exit.dim.1, %1
  %broadcast_maximum_fusion.invar_address.dim.0.07 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast_maximum_fusion.loop_exit.dim.1 ]
  %11 = shl nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.0.07, 8
  %12 = add i64 %3, %11
  %diff.check12 = icmp ult i64 %12, 128
  %conflict.rdx = or i1 %diff.check, %diff.check12
  br i1 %conflict.rdx, label %broadcast_maximum_fusion.loop_body.dim.1, label %vector.body

vector.body:                                      ; preds = %vector.memcheck
  %13 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 0
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 32
  %15 = getelementptr inbounds nuw i8, ptr %13, i64 64
  %16 = getelementptr inbounds nuw i8, ptr %13, i64 96
  %wide.load = load <8 x float>, ptr %13, align 64
  %wide.load13 = load <8 x float>, ptr %14, align 32
  %wide.load14 = load <8 x float>, ptr %15, align 64
  %wide.load15 = load <8 x float>, ptr %16, align 32
  %17 = fadd <8 x float> %wide.load, %wide.load16
  %18 = fadd <8 x float> %wide.load13, %wide.load17
  %19 = fadd <8 x float> %wide.load14, %wide.load18
  %20 = fadd <8 x float> %wide.load15, %wide.load19
  %21 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %17, <8 x float> zeroinitializer)
  %22 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %18, <8 x float> zeroinitializer)
  %23 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %19, <8 x float> zeroinitializer)
  %24 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %20, <8 x float> zeroinitializer)
  %25 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 0
  %26 = getelementptr inbounds nuw i8, ptr %25, i64 32
  %27 = getelementptr inbounds nuw i8, ptr %25, i64 64
  %28 = getelementptr inbounds nuw i8, ptr %25, i64 96
  store <8 x float> %21, ptr %25, align 64, !alias.scope !5
  store <8 x float> %22, ptr %26, align 32, !alias.scope !5
  store <8 x float> %23, ptr %27, align 64, !alias.scope !5
  store <8 x float> %24, ptr %28, align 32, !alias.scope !5
  %29 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 32
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 32
  %31 = getelementptr inbounds nuw i8, ptr %29, i64 64
  %32 = getelementptr inbounds nuw i8, ptr %29, i64 96
  %wide.load.1 = load <8 x float>, ptr %29, align 64
  %wide.load13.1 = load <8 x float>, ptr %30, align 32
  %wide.load14.1 = load <8 x float>, ptr %31, align 64
  %wide.load15.1 = load <8 x float>, ptr %32, align 32
  %33 = fadd <8 x float> %wide.load.1, %wide.load16.1
  %34 = fadd <8 x float> %wide.load13.1, %wide.load17.1
  %35 = fadd <8 x float> %wide.load14.1, %wide.load18.1
  %36 = fadd <8 x float> %wide.load15.1, %wide.load19.1
  %37 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %33, <8 x float> zeroinitializer)
  %38 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %34, <8 x float> zeroinitializer)
  %39 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %35, <8 x float> zeroinitializer)
  %40 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %36, <8 x float> zeroinitializer)
  %41 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 32
  %42 = getelementptr inbounds nuw i8, ptr %41, i64 32
  %43 = getelementptr inbounds nuw i8, ptr %41, i64 64
  %44 = getelementptr inbounds nuw i8, ptr %41, i64 96
  store <8 x float> %37, ptr %41, align 64, !alias.scope !5
  store <8 x float> %38, ptr %42, align 32, !alias.scope !5
  store <8 x float> %39, ptr %43, align 64, !alias.scope !5
  store <8 x float> %40, ptr %44, align 32, !alias.scope !5
  br label %broadcast_maximum_fusion.loop_exit.dim.1

broadcast_maximum_fusion.loop_body.dim.1:         ; preds = %vector.memcheck, %broadcast_maximum_fusion.loop_body.dim.1
  %broadcast_maximum_fusion.invar_address.dim.1.06 = phi i64 [ %invar.inc5.7, %broadcast_maximum_fusion.loop_body.dim.1 ], [ 0, %vector.memcheck ]
  %45 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %broadcast_maximum_fusion.invar_address.dim.1.06
  %46 = load float, ptr %45, align 32
  %47 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.1.06
  %48 = load float, ptr %47, align 32, !invariant.load !1, !noalias !5
  %add.0 = fadd float %46, %48
  %49 = tail call float @llvm.maximum.f32(float %add.0, float 0.000000e+00)
  %50 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %broadcast_maximum_fusion.invar_address.dim.1.06
  store float %49, ptr %50, align 32, !alias.scope !5
  %invar.inc5 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 1
  %51 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5
  %52 = load float, ptr %51, align 4
  %53 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5
  %54 = load float, ptr %53, align 4, !invariant.load !1, !noalias !5
  %add.0.1 = fadd float %52, %54
  %55 = tail call float @llvm.maximum.f32(float %add.0.1, float 0.000000e+00)
  %56 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5
  store float %55, ptr %56, align 4, !alias.scope !5
  %invar.inc5.1 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 2
  %57 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.1
  %58 = load float, ptr %57, align 8
  %59 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5.1
  %60 = load float, ptr %59, align 8, !invariant.load !1, !noalias !5
  %add.0.2 = fadd float %58, %60
  %61 = tail call float @llvm.maximum.f32(float %add.0.2, float 0.000000e+00)
  %62 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.1
  store float %61, ptr %62, align 8, !alias.scope !5
  %invar.inc5.2 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 3
  %63 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.2
  %64 = load float, ptr %63, align 4
  %65 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5.2
  %66 = load float, ptr %65, align 4, !invariant.load !1, !noalias !5
  %add.0.3 = fadd float %64, %66
  %67 = tail call float @llvm.maximum.f32(float %add.0.3, float 0.000000e+00)
  %68 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.2
  store float %67, ptr %68, align 4, !alias.scope !5
  %invar.inc5.3 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 4
  %69 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.3
  %70 = load float, ptr %69, align 16
  %71 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5.3
  %72 = load float, ptr %71, align 16, !invariant.load !1, !noalias !5
  %add.0.4 = fadd float %70, %72
  %73 = tail call float @llvm.maximum.f32(float %add.0.4, float 0.000000e+00)
  %74 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.3
  store float %73, ptr %74, align 16, !alias.scope !5
  %invar.inc5.4 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 5
  %75 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.4
  %76 = load float, ptr %75, align 4
  %77 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5.4
  %78 = load float, ptr %77, align 4, !invariant.load !1, !noalias !5
  %add.0.5 = fadd float %76, %78
  %79 = tail call float @llvm.maximum.f32(float %add.0.5, float 0.000000e+00)
  %80 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.4
  store float %79, ptr %80, align 4, !alias.scope !5
  %invar.inc5.5 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 6
  %81 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.5
  %82 = load float, ptr %81, align 8
  %83 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5.5
  %84 = load float, ptr %83, align 8, !invariant.load !1, !noalias !5
  %add.0.6 = fadd float %82, %84
  %85 = tail call float @llvm.maximum.f32(float %add.0.6, float 0.000000e+00)
  %86 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.5
  store float %85, ptr %86, align 8, !alias.scope !5
  %invar.inc5.6 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 7
  %87 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.6
  %88 = load float, ptr %87, align 4
  %89 = getelementptr inbounds nuw [64 x float], ptr %arg1, i64 0, i64 %invar.inc5.6
  %90 = load float, ptr %89, align 4, !invariant.load !1, !noalias !5
  %add.0.7 = fadd float %88, %90
  %91 = tail call float @llvm.maximum.f32(float %add.0.7, float 0.000000e+00)
  %92 = getelementptr inbounds nuw [10 x [64 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.07, i64 %invar.inc5.6
  store float %91, ptr %92, align 4, !alias.scope !5
  %invar.inc5.7 = add nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.1.06, 8
  %exitcond.7 = icmp eq i64 %invar.inc5.7, 64
  br i1 %exitcond.7, label %broadcast_maximum_fusion.loop_exit.dim.1, label %broadcast_maximum_fusion.loop_body.dim.1, !llvm.loop !8

broadcast_maximum_fusion.loop_exit.dim.1:         ; preds = %broadcast_maximum_fusion.loop_body.dim.1, %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.0.07, 1
  %exitcond8 = icmp eq i64 %invar.inc, 10
  br i1 %exitcond8, label %return, label %vector.memcheck, !llvm.loop !10

return:                                           ; preds = %broadcast_maximum_fusion.loop_exit.dim.1
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximum.v8f32(<8 x float>, <8 x float>) #2

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 2560}
!3 = !{i64 64}
!4 = !{i64 256}
!5 = !{!6}
!6 = !{!"result slice: {index:1, offset:0, size:2560}", !7}
!7 = !{!"XLA host kernel broadcast_maximum_fusion AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
