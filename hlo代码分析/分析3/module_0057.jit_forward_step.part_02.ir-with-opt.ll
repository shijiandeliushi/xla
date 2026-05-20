; ModuleID = '__compute_module_part_02'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  %4 = getelementptr inbounds nuw i8, ptr %arg1, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %arg1, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %arg1, i64 96
  %wide.load11 = load <8 x float>, ptr %arg1, align 64
  %wide.load12 = load <8 x float>, ptr %4, align 32
  %wide.load13 = load <8 x float>, ptr %5, align 64
  %wide.load14 = load <8 x float>, ptr %6, align 32
  %7 = getelementptr inbounds nuw i8, ptr %arg1, i64 128
  %8 = getelementptr inbounds nuw i8, ptr %arg1, i64 160
  %9 = getelementptr inbounds nuw i8, ptr %arg1, i64 192
  %10 = getelementptr inbounds nuw i8, ptr %arg1, i64 224
  %wide.load11.1 = load <8 x float>, ptr %7, align 64
  %wide.load12.1 = load <8 x float>, ptr %8, align 32
  %wide.load13.1 = load <8 x float>, ptr %9, align 64
  %wide.load14.1 = load <8 x float>, ptr %10, align 32
  %11 = getelementptr inbounds nuw i8, ptr %arg1, i64 256
  %12 = getelementptr inbounds nuw i8, ptr %arg1, i64 288
  %13 = getelementptr inbounds nuw i8, ptr %arg1, i64 320
  %14 = getelementptr inbounds nuw i8, ptr %arg1, i64 352
  %wide.load11.2 = load <8 x float>, ptr %11, align 64
  %wide.load12.2 = load <8 x float>, ptr %12, align 32
  %wide.load13.2 = load <8 x float>, ptr %13, align 64
  %wide.load14.2 = load <8 x float>, ptr %14, align 32
  %15 = getelementptr inbounds nuw i8, ptr %arg1, i64 384
  %16 = getelementptr inbounds nuw i8, ptr %arg1, i64 416
  %17 = getelementptr inbounds nuw i8, ptr %arg1, i64 448
  %18 = getelementptr inbounds nuw i8, ptr %arg1, i64 480
  %wide.load11.3 = load <8 x float>, ptr %15, align 64
  %wide.load12.3 = load <8 x float>, ptr %16, align 32
  %wide.load13.3 = load <8 x float>, ptr %17, align 64
  %wide.load14.3 = load <8 x float>, ptr %18, align 32
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %broadcast_add_fusion.loop_exit.dim.1, %1
  %broadcast_add_fusion.invar_address.dim.0.02 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast_add_fusion.loop_exit.dim.1 ]
  %19 = shl nuw nsw i64 %broadcast_add_fusion.invar_address.dim.0.02, 9
  %20 = add i64 %3, %19
  %diff.check7 = icmp ult i64 %20, 128
  %conflict.rdx = or i1 %diff.check, %diff.check7
  br i1 %conflict.rdx, label %broadcast_add_fusion.loop_body.dim.1, label %vector.body

vector.body:                                      ; preds = %vector.memcheck
  %21 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 0
  %22 = getelementptr inbounds nuw i8, ptr %21, i64 32
  %23 = getelementptr inbounds nuw i8, ptr %21, i64 64
  %24 = getelementptr inbounds nuw i8, ptr %21, i64 96
  %wide.load = load <8 x float>, ptr %21, align 64
  %wide.load8 = load <8 x float>, ptr %22, align 32
  %wide.load9 = load <8 x float>, ptr %23, align 64
  %wide.load10 = load <8 x float>, ptr %24, align 32
  %25 = fadd <8 x float> %wide.load, %wide.load11
  %26 = fadd <8 x float> %wide.load8, %wide.load12
  %27 = fadd <8 x float> %wide.load9, %wide.load13
  %28 = fadd <8 x float> %wide.load10, %wide.load14
  %29 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 0
  %30 = getelementptr inbounds nuw i8, ptr %29, i64 32
  %31 = getelementptr inbounds nuw i8, ptr %29, i64 64
  %32 = getelementptr inbounds nuw i8, ptr %29, i64 96
  store <8 x float> %25, ptr %29, align 64, !alias.scope !5
  store <8 x float> %26, ptr %30, align 32, !alias.scope !5
  store <8 x float> %27, ptr %31, align 64, !alias.scope !5
  store <8 x float> %28, ptr %32, align 32, !alias.scope !5
  %33 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 32
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %33, i64 96
  %wide.load.1 = load <8 x float>, ptr %33, align 64
  %wide.load8.1 = load <8 x float>, ptr %34, align 32
  %wide.load9.1 = load <8 x float>, ptr %35, align 64
  %wide.load10.1 = load <8 x float>, ptr %36, align 32
  %37 = fadd <8 x float> %wide.load.1, %wide.load11.1
  %38 = fadd <8 x float> %wide.load8.1, %wide.load12.1
  %39 = fadd <8 x float> %wide.load9.1, %wide.load13.1
  %40 = fadd <8 x float> %wide.load10.1, %wide.load14.1
  %41 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 32
  %42 = getelementptr inbounds nuw i8, ptr %41, i64 32
  %43 = getelementptr inbounds nuw i8, ptr %41, i64 64
  %44 = getelementptr inbounds nuw i8, ptr %41, i64 96
  store <8 x float> %37, ptr %41, align 64, !alias.scope !5
  store <8 x float> %38, ptr %42, align 32, !alias.scope !5
  store <8 x float> %39, ptr %43, align 64, !alias.scope !5
  store <8 x float> %40, ptr %44, align 32, !alias.scope !5
  %45 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 64
  %46 = getelementptr inbounds nuw i8, ptr %45, i64 32
  %47 = getelementptr inbounds nuw i8, ptr %45, i64 64
  %48 = getelementptr inbounds nuw i8, ptr %45, i64 96
  %wide.load.2 = load <8 x float>, ptr %45, align 64
  %wide.load8.2 = load <8 x float>, ptr %46, align 32
  %wide.load9.2 = load <8 x float>, ptr %47, align 64
  %wide.load10.2 = load <8 x float>, ptr %48, align 32
  %49 = fadd <8 x float> %wide.load.2, %wide.load11.2
  %50 = fadd <8 x float> %wide.load8.2, %wide.load12.2
  %51 = fadd <8 x float> %wide.load9.2, %wide.load13.2
  %52 = fadd <8 x float> %wide.load10.2, %wide.load14.2
  %53 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 64
  %54 = getelementptr inbounds nuw i8, ptr %53, i64 32
  %55 = getelementptr inbounds nuw i8, ptr %53, i64 64
  %56 = getelementptr inbounds nuw i8, ptr %53, i64 96
  store <8 x float> %49, ptr %53, align 64, !alias.scope !5
  store <8 x float> %50, ptr %54, align 32, !alias.scope !5
  store <8 x float> %51, ptr %55, align 64, !alias.scope !5
  store <8 x float> %52, ptr %56, align 32, !alias.scope !5
  %57 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 96
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 32
  %59 = getelementptr inbounds nuw i8, ptr %57, i64 64
  %60 = getelementptr inbounds nuw i8, ptr %57, i64 96
  %wide.load.3 = load <8 x float>, ptr %57, align 64
  %wide.load8.3 = load <8 x float>, ptr %58, align 32
  %wide.load9.3 = load <8 x float>, ptr %59, align 64
  %wide.load10.3 = load <8 x float>, ptr %60, align 32
  %61 = fadd <8 x float> %wide.load.3, %wide.load11.3
  %62 = fadd <8 x float> %wide.load8.3, %wide.load12.3
  %63 = fadd <8 x float> %wide.load9.3, %wide.load13.3
  %64 = fadd <8 x float> %wide.load10.3, %wide.load14.3
  %65 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 96
  %66 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %67 = getelementptr inbounds nuw i8, ptr %65, i64 64
  %68 = getelementptr inbounds nuw i8, ptr %65, i64 96
  store <8 x float> %61, ptr %65, align 64, !alias.scope !5
  store <8 x float> %62, ptr %66, align 32, !alias.scope !5
  store <8 x float> %63, ptr %67, align 64, !alias.scope !5
  store <8 x float> %64, ptr %68, align 32, !alias.scope !5
  br label %broadcast_add_fusion.loop_exit.dim.1

broadcast_add_fusion.loop_body.dim.1:             ; preds = %vector.memcheck, %broadcast_add_fusion.loop_body.dim.1
  %broadcast_add_fusion.invar_address.dim.1.01 = phi i64 [ %invar.inc5.7, %broadcast_add_fusion.loop_body.dim.1 ], [ 0, %vector.memcheck ]
  %69 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %broadcast_add_fusion.invar_address.dim.1.01
  %70 = load float, ptr %69, align 32
  %71 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %broadcast_add_fusion.invar_address.dim.1.01
  %72 = load float, ptr %71, align 32, !invariant.load !1, !noalias !5
  %add.0 = fadd float %70, %72
  %73 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %broadcast_add_fusion.invar_address.dim.1.01
  store float %add.0, ptr %73, align 32, !alias.scope !5
  %invar.inc5 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 1
  %74 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5
  %75 = load float, ptr %74, align 4
  %76 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5
  %77 = load float, ptr %76, align 4, !invariant.load !1, !noalias !5
  %add.0.1 = fadd float %75, %77
  %78 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5
  store float %add.0.1, ptr %78, align 4, !alias.scope !5
  %invar.inc5.1 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 2
  %79 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.1
  %80 = load float, ptr %79, align 8
  %81 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5.1
  %82 = load float, ptr %81, align 8, !invariant.load !1, !noalias !5
  %add.0.2 = fadd float %80, %82
  %83 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.1
  store float %add.0.2, ptr %83, align 8, !alias.scope !5
  %invar.inc5.2 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 3
  %84 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.2
  %85 = load float, ptr %84, align 4
  %86 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5.2
  %87 = load float, ptr %86, align 4, !invariant.load !1, !noalias !5
  %add.0.3 = fadd float %85, %87
  %88 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.2
  store float %add.0.3, ptr %88, align 4, !alias.scope !5
  %invar.inc5.3 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 4
  %89 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.3
  %90 = load float, ptr %89, align 16
  %91 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5.3
  %92 = load float, ptr %91, align 16, !invariant.load !1, !noalias !5
  %add.0.4 = fadd float %90, %92
  %93 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.3
  store float %add.0.4, ptr %93, align 16, !alias.scope !5
  %invar.inc5.4 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 5
  %94 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.4
  %95 = load float, ptr %94, align 4
  %96 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5.4
  %97 = load float, ptr %96, align 4, !invariant.load !1, !noalias !5
  %add.0.5 = fadd float %95, %97
  %98 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.4
  store float %add.0.5, ptr %98, align 4, !alias.scope !5
  %invar.inc5.5 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 6
  %99 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.5
  %100 = load float, ptr %99, align 8
  %101 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5.5
  %102 = load float, ptr %101, align 8, !invariant.load !1, !noalias !5
  %add.0.6 = fadd float %100, %102
  %103 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.5
  store float %add.0.6, ptr %103, align 8, !alias.scope !5
  %invar.inc5.6 = or disjoint i64 %broadcast_add_fusion.invar_address.dim.1.01, 7
  %104 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.6
  %105 = load float, ptr %104, align 4
  %106 = getelementptr inbounds nuw [128 x float], ptr %arg1, i64 0, i64 %invar.inc5.6
  %107 = load float, ptr %106, align 4, !invariant.load !1, !noalias !5
  %add.0.7 = fadd float %105, %107
  %108 = getelementptr inbounds nuw [64 x [128 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.02, i64 %invar.inc5.6
  store float %add.0.7, ptr %108, align 4, !alias.scope !5
  %invar.inc5.7 = add nuw nsw i64 %broadcast_add_fusion.invar_address.dim.1.01, 8
  %exitcond.7 = icmp eq i64 %invar.inc5.7, 128
  br i1 %exitcond.7, label %broadcast_add_fusion.loop_exit.dim.1, label %broadcast_add_fusion.loop_body.dim.1, !llvm.loop !8

broadcast_add_fusion.loop_exit.dim.1:             ; preds = %broadcast_add_fusion.loop_body.dim.1, %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.invar_address.dim.0.02, 1
  %exitcond3 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond3, label %return, label %vector.memcheck, !llvm.loop !10

return:                                           ; preds = %broadcast_add_fusion.loop_exit.dim.1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 2}
!1 = !{}
!2 = !{i64 32768}
!3 = !{i64 64}
!4 = !{i64 512}
!5 = !{!6}
!6 = !{!"result slice: {index:4, offset:0, size:32768}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
