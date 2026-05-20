; ModuleID = '__compute_module_part_00'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_maximum_fusion.1(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg05 = ptrtoint ptr %arg0 to i64
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg16 = ptrtoint ptr %arg1 to i64
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg24 = ptrtoint ptr %arg2 to i64
  %2 = sub i64 %arg24, %arg05
  %3 = sub i64 %arg24, %arg16
  %diff.check = icmp ult i64 %2, 128
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %broadcast_maximum_fusion.1.loop_exit.dim.1, %1
  %broadcast_maximum_fusion.1.invar_address.dim.0.02 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast_maximum_fusion.1.loop_exit.dim.1 ]
  %4 = shl nuw nsw i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, 11
  %5 = add i64 %3, %4
  %diff.check7 = icmp ult i64 %5, 128
  %conflict.rdx = or i1 %diff.check, %diff.check7
  br i1 %conflict.rdx, label %broadcast_maximum_fusion.1.loop_body.dim.1, label %vector.body

vector.body:                                      ; preds = %vector.memcheck, %vector.body
  %index = phi i64 [ %index.next.1, %vector.body ], [ 0, %vector.memcheck ]
  %6 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %index
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  %wide.load = load <8 x float>, ptr %6, align 64
  %wide.load8 = load <8 x float>, ptr %7, align 32
  %wide.load9 = load <8 x float>, ptr %8, align 64
  %wide.load10 = load <8 x float>, ptr %9, align 32
  %10 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %index
  %11 = getelementptr inbounds nuw i8, ptr %10, i64 32
  %12 = getelementptr inbounds nuw i8, ptr %10, i64 64
  %13 = getelementptr inbounds nuw i8, ptr %10, i64 96
  %wide.load11 = load <8 x float>, ptr %10, align 64, !invariant.load !1, !noalias !5
  %wide.load12 = load <8 x float>, ptr %11, align 32, !invariant.load !1, !noalias !5
  %wide.load13 = load <8 x float>, ptr %12, align 64, !invariant.load !1, !noalias !5
  %wide.load14 = load <8 x float>, ptr %13, align 32, !invariant.load !1, !noalias !5
  %14 = fadd <8 x float> %wide.load, %wide.load11
  %15 = fadd <8 x float> %wide.load8, %wide.load12
  %16 = fadd <8 x float> %wide.load9, %wide.load13
  %17 = fadd <8 x float> %wide.load10, %wide.load14
  %18 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %14, <8 x float> zeroinitializer)
  %19 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %15, <8 x float> zeroinitializer)
  %20 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %16, <8 x float> zeroinitializer)
  %21 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %17, <8 x float> zeroinitializer)
  %22 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %index
  %23 = getelementptr inbounds nuw i8, ptr %22, i64 32
  %24 = getelementptr inbounds nuw i8, ptr %22, i64 64
  %25 = getelementptr inbounds nuw i8, ptr %22, i64 96
  store <8 x float> %18, ptr %22, align 64, !alias.scope !5
  store <8 x float> %19, ptr %23, align 32, !alias.scope !5
  store <8 x float> %20, ptr %24, align 64, !alias.scope !5
  store <8 x float> %21, ptr %25, align 32, !alias.scope !5
  %index.next = or disjoint i64 %index, 32
  %26 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %index.next
  %27 = getelementptr inbounds nuw i8, ptr %26, i64 32
  %28 = getelementptr inbounds nuw i8, ptr %26, i64 64
  %29 = getelementptr inbounds nuw i8, ptr %26, i64 96
  %wide.load.1 = load <8 x float>, ptr %26, align 64
  %wide.load8.1 = load <8 x float>, ptr %27, align 32
  %wide.load9.1 = load <8 x float>, ptr %28, align 64
  %wide.load10.1 = load <8 x float>, ptr %29, align 32
  %30 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %index.next
  %31 = getelementptr inbounds nuw i8, ptr %30, i64 32
  %32 = getelementptr inbounds nuw i8, ptr %30, i64 64
  %33 = getelementptr inbounds nuw i8, ptr %30, i64 96
  %wide.load11.1 = load <8 x float>, ptr %30, align 64, !invariant.load !1, !noalias !5
  %wide.load12.1 = load <8 x float>, ptr %31, align 32, !invariant.load !1, !noalias !5
  %wide.load13.1 = load <8 x float>, ptr %32, align 64, !invariant.load !1, !noalias !5
  %wide.load14.1 = load <8 x float>, ptr %33, align 32, !invariant.load !1, !noalias !5
  %34 = fadd <8 x float> %wide.load.1, %wide.load11.1
  %35 = fadd <8 x float> %wide.load8.1, %wide.load12.1
  %36 = fadd <8 x float> %wide.load9.1, %wide.load13.1
  %37 = fadd <8 x float> %wide.load10.1, %wide.load14.1
  %38 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %34, <8 x float> zeroinitializer)
  %39 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %35, <8 x float> zeroinitializer)
  %40 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %36, <8 x float> zeroinitializer)
  %41 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %37, <8 x float> zeroinitializer)
  %42 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %index.next
  %43 = getelementptr inbounds nuw i8, ptr %42, i64 32
  %44 = getelementptr inbounds nuw i8, ptr %42, i64 64
  %45 = getelementptr inbounds nuw i8, ptr %42, i64 96
  store <8 x float> %38, ptr %42, align 64, !alias.scope !5
  store <8 x float> %39, ptr %43, align 32, !alias.scope !5
  store <8 x float> %40, ptr %44, align 64, !alias.scope !5
  store <8 x float> %41, ptr %45, align 32, !alias.scope !5
  %index.next.1 = add nuw nsw i64 %index, 64
  %46 = icmp eq i64 %index.next.1, 512
  br i1 %46, label %broadcast_maximum_fusion.1.loop_exit.dim.1, label %vector.body, !llvm.loop !8

broadcast_maximum_fusion.1.loop_body.dim.1:       ; preds = %vector.memcheck, %broadcast_maximum_fusion.1.loop_body.dim.1
  %broadcast_maximum_fusion.1.invar_address.dim.1.01 = phi i64 [ %invar.inc5.7, %broadcast_maximum_fusion.1.loop_body.dim.1 ], [ 0, %vector.memcheck ]
  %47 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01
  %48 = load float, ptr %47, align 32
  %49 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01
  %50 = load float, ptr %49, align 32, !invariant.load !1, !noalias !5
  %add.2 = fadd float %48, %50
  %51 = tail call float @llvm.maximum.f32(float %add.2, float 0.000000e+00)
  %52 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01
  store float %51, ptr %52, align 32, !alias.scope !5
  %invar.inc5 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 1
  %53 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5
  %54 = load float, ptr %53, align 4
  %55 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5
  %56 = load float, ptr %55, align 4, !invariant.load !1, !noalias !5
  %add.2.1 = fadd float %54, %56
  %57 = tail call float @llvm.maximum.f32(float %add.2.1, float 0.000000e+00)
  %58 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5
  store float %57, ptr %58, align 4, !alias.scope !5
  %invar.inc5.1 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 2
  %59 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.1
  %60 = load float, ptr %59, align 8
  %61 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5.1
  %62 = load float, ptr %61, align 8, !invariant.load !1, !noalias !5
  %add.2.2 = fadd float %60, %62
  %63 = tail call float @llvm.maximum.f32(float %add.2.2, float 0.000000e+00)
  %64 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.1
  store float %63, ptr %64, align 8, !alias.scope !5
  %invar.inc5.2 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 3
  %65 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.2
  %66 = load float, ptr %65, align 4
  %67 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5.2
  %68 = load float, ptr %67, align 4, !invariant.load !1, !noalias !5
  %add.2.3 = fadd float %66, %68
  %69 = tail call float @llvm.maximum.f32(float %add.2.3, float 0.000000e+00)
  %70 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.2
  store float %69, ptr %70, align 4, !alias.scope !5
  %invar.inc5.3 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 4
  %71 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.3
  %72 = load float, ptr %71, align 16
  %73 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5.3
  %74 = load float, ptr %73, align 16, !invariant.load !1, !noalias !5
  %add.2.4 = fadd float %72, %74
  %75 = tail call float @llvm.maximum.f32(float %add.2.4, float 0.000000e+00)
  %76 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.3
  store float %75, ptr %76, align 16, !alias.scope !5
  %invar.inc5.4 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 5
  %77 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.4
  %78 = load float, ptr %77, align 4
  %79 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5.4
  %80 = load float, ptr %79, align 4, !invariant.load !1, !noalias !5
  %add.2.5 = fadd float %78, %80
  %81 = tail call float @llvm.maximum.f32(float %add.2.5, float 0.000000e+00)
  %82 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.4
  store float %81, ptr %82, align 4, !alias.scope !5
  %invar.inc5.5 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 6
  %83 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.5
  %84 = load float, ptr %83, align 8
  %85 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5.5
  %86 = load float, ptr %85, align 8, !invariant.load !1, !noalias !5
  %add.2.6 = fadd float %84, %86
  %87 = tail call float @llvm.maximum.f32(float %add.2.6, float 0.000000e+00)
  %88 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.5
  store float %87, ptr %88, align 8, !alias.scope !5
  %invar.inc5.6 = or disjoint i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 7
  %89 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.6
  %90 = load float, ptr %89, align 4
  %91 = getelementptr inbounds nuw [512 x float], ptr %arg1, i64 0, i64 %invar.inc5.6
  %92 = load float, ptr %91, align 4, !invariant.load !1, !noalias !5
  %add.2.7 = fadd float %90, %92
  %93 = tail call float @llvm.maximum.f32(float %add.2.7, float 0.000000e+00)
  %94 = getelementptr inbounds nuw [64 x [512 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, i64 %invar.inc5.6
  store float %93, ptr %94, align 4, !alias.scope !5
  %invar.inc5.7 = add nuw nsw i64 %broadcast_maximum_fusion.1.invar_address.dim.1.01, 8
  %exitcond.7 = icmp eq i64 %invar.inc5.7, 512
  br i1 %exitcond.7, label %broadcast_maximum_fusion.1.loop_exit.dim.1, label %broadcast_maximum_fusion.1.loop_body.dim.1, !llvm.loop !11

broadcast_maximum_fusion.1.loop_exit.dim.1:       ; preds = %vector.body, %broadcast_maximum_fusion.1.loop_body.dim.1
  %invar.inc = add nuw nsw i64 %broadcast_maximum_fusion.1.invar_address.dim.0.02, 1
  %exitcond3 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond3, label %return, label %vector.memcheck, !llvm.loop !12

return:                                           ; preds = %broadcast_maximum_fusion.1.loop_exit.dim.1
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
!2 = !{i64 131072}
!3 = !{i64 64}
!4 = !{i64 2048}
!5 = !{!6}
!6 = !{!"result slice: {index:8, offset:0, size:131072}", !7}
!7 = !{!"XLA host kernel broadcast_maximum_fusion.1 AA domain"}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = !{!"llvm.loop.unroll.runtime.disable"}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
