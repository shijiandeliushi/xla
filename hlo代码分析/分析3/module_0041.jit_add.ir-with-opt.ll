; ModuleID = '__compute_module'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg2_gep = getelementptr i8, ptr %args, i64 32
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %2 = getelementptr inbounds nuw i8, ptr %arg1, i64 32
  %3 = getelementptr inbounds nuw i8, ptr %arg1, i64 64
  %4 = getelementptr inbounds nuw i8, ptr %arg1, i64 96
  %wide.load12 = load <8 x float>, ptr %arg1, align 64, !invariant.load !1, !noalias !5
  %wide.load13 = load <8 x float>, ptr %2, align 32, !invariant.load !1, !noalias !5
  %wide.load14 = load <8 x float>, ptr %3, align 64, !invariant.load !1, !noalias !5
  %wide.load15 = load <8 x float>, ptr %4, align 32, !invariant.load !1, !noalias !5
  %5 = getelementptr inbounds nuw i8, ptr %arg1, i64 128
  %6 = getelementptr inbounds nuw i8, ptr %arg1, i64 160
  %7 = getelementptr inbounds nuw i8, ptr %arg1, i64 192
  %8 = getelementptr inbounds nuw i8, ptr %arg1, i64 224
  %wide.load12.1 = load <8 x float>, ptr %5, align 64, !invariant.load !1, !noalias !5
  %wide.load13.1 = load <8 x float>, ptr %6, align 32, !invariant.load !1, !noalias !5
  %wide.load14.1 = load <8 x float>, ptr %7, align 64, !invariant.load !1, !noalias !5
  %wide.load15.1 = load <8 x float>, ptr %8, align 32, !invariant.load !1, !noalias !5
  %9 = getelementptr inbounds nuw i8, ptr %arg1, i64 256
  %10 = getelementptr inbounds nuw i8, ptr %arg1, i64 288
  %11 = getelementptr inbounds nuw i8, ptr %arg1, i64 320
  %12 = getelementptr inbounds nuw i8, ptr %arg1, i64 352
  %wide.load12.2 = load <8 x float>, ptr %9, align 64, !invariant.load !1, !noalias !5
  %wide.load13.2 = load <8 x float>, ptr %10, align 32, !invariant.load !1, !noalias !5
  %wide.load14.2 = load <8 x float>, ptr %11, align 64, !invariant.load !1, !noalias !5
  %wide.load15.2 = load <8 x float>, ptr %12, align 32, !invariant.load !1, !noalias !5
  %13 = getelementptr inbounds nuw i8, ptr %arg1, i64 384
  %14 = getelementptr inbounds nuw i8, ptr %arg1, i64 416
  %15 = getelementptr inbounds nuw i8, ptr %arg1, i64 448
  %16 = getelementptr inbounds nuw i8, ptr %arg1, i64 480
  %wide.load12.3 = load <8 x float>, ptr %13, align 64, !invariant.load !1, !noalias !5
  %wide.load13.3 = load <8 x float>, ptr %14, align 32, !invariant.load !1, !noalias !5
  %wide.load14.3 = load <8 x float>, ptr %15, align 64, !invariant.load !1, !noalias !5
  %wide.load15.3 = load <8 x float>, ptr %16, align 32, !invariant.load !1, !noalias !5
  %17 = getelementptr inbounds nuw i8, ptr %arg1, i64 512
  %18 = getelementptr inbounds nuw i8, ptr %arg1, i64 544
  %19 = getelementptr inbounds nuw i8, ptr %arg1, i64 576
  %20 = getelementptr inbounds nuw i8, ptr %arg1, i64 608
  %wide.load12.4 = load <8 x float>, ptr %17, align 64, !invariant.load !1, !noalias !5
  %wide.load13.4 = load <8 x float>, ptr %18, align 32, !invariant.load !1, !noalias !5
  %wide.load14.4 = load <8 x float>, ptr %19, align 64, !invariant.load !1, !noalias !5
  %wide.load15.4 = load <8 x float>, ptr %20, align 32, !invariant.load !1, !noalias !5
  %21 = getelementptr inbounds nuw i8, ptr %arg1, i64 640
  %22 = getelementptr inbounds nuw i8, ptr %arg1, i64 672
  %23 = getelementptr inbounds nuw i8, ptr %arg1, i64 704
  %24 = getelementptr inbounds nuw i8, ptr %arg1, i64 736
  %wide.load12.5 = load <8 x float>, ptr %21, align 64, !invariant.load !1, !noalias !5
  %wide.load13.5 = load <8 x float>, ptr %22, align 32, !invariant.load !1, !noalias !5
  %wide.load14.5 = load <8 x float>, ptr %23, align 64, !invariant.load !1, !noalias !5
  %wide.load15.5 = load <8 x float>, ptr %24, align 32, !invariant.load !1, !noalias !5
  %25 = getelementptr inbounds nuw i8, ptr %arg1, i64 768
  %26 = getelementptr inbounds nuw i8, ptr %arg1, i64 800
  %27 = getelementptr inbounds nuw i8, ptr %arg1, i64 832
  %28 = getelementptr inbounds nuw i8, ptr %arg1, i64 864
  %wide.load12.6 = load <8 x float>, ptr %25, align 64, !invariant.load !1, !noalias !5
  %wide.load13.6 = load <8 x float>, ptr %26, align 32, !invariant.load !1, !noalias !5
  %wide.load14.6 = load <8 x float>, ptr %27, align 64, !invariant.load !1, !noalias !5
  %wide.load15.6 = load <8 x float>, ptr %28, align 32, !invariant.load !1, !noalias !5
  %29 = getelementptr inbounds nuw i8, ptr %arg1, i64 896
  %30 = getelementptr inbounds nuw i8, ptr %arg1, i64 928
  %31 = getelementptr inbounds nuw i8, ptr %arg1, i64 960
  %32 = getelementptr inbounds nuw i8, ptr %arg1, i64 992
  %wide.load12.7 = load <8 x float>, ptr %29, align 64, !invariant.load !1, !noalias !5
  %wide.load13.7 = load <8 x float>, ptr %30, align 32, !invariant.load !1, !noalias !5
  %wide.load14.7 = load <8 x float>, ptr %31, align 64, !invariant.load !1, !noalias !5
  %wide.load15.7 = load <8 x float>, ptr %32, align 32, !invariant.load !1, !noalias !5
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %1
  %broadcast_add_fusion.invar_address.dim.0.07 = phi i64 [ 0, %1 ], [ %invar.inc, %vector.ph ]
  %33 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 0
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %33, i64 96
  %wide.load = load <8 x float>, ptr %33, align 64, !invariant.load !1, !noalias !5
  %wide.load9 = load <8 x float>, ptr %34, align 32, !invariant.load !1, !noalias !5
  %wide.load10 = load <8 x float>, ptr %35, align 64, !invariant.load !1, !noalias !5
  %wide.load11 = load <8 x float>, ptr %36, align 32, !invariant.load !1, !noalias !5
  %37 = fadd <8 x float> %wide.load, %wide.load12
  %38 = fadd <8 x float> %wide.load9, %wide.load13
  %39 = fadd <8 x float> %wide.load10, %wide.load14
  %40 = fadd <8 x float> %wide.load11, %wide.load15
  %41 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 0
  %42 = getelementptr inbounds nuw i8, ptr %41, i64 32
  %43 = getelementptr inbounds nuw i8, ptr %41, i64 64
  %44 = getelementptr inbounds nuw i8, ptr %41, i64 96
  store <8 x float> %37, ptr %41, align 64, !alias.scope !5
  store <8 x float> %38, ptr %42, align 32, !alias.scope !5
  store <8 x float> %39, ptr %43, align 64, !alias.scope !5
  store <8 x float> %40, ptr %44, align 32, !alias.scope !5
  %45 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 32
  %46 = getelementptr inbounds nuw i8, ptr %45, i64 32
  %47 = getelementptr inbounds nuw i8, ptr %45, i64 64
  %48 = getelementptr inbounds nuw i8, ptr %45, i64 96
  %wide.load.1 = load <8 x float>, ptr %45, align 64, !invariant.load !1, !noalias !5
  %wide.load9.1 = load <8 x float>, ptr %46, align 32, !invariant.load !1, !noalias !5
  %wide.load10.1 = load <8 x float>, ptr %47, align 64, !invariant.load !1, !noalias !5
  %wide.load11.1 = load <8 x float>, ptr %48, align 32, !invariant.load !1, !noalias !5
  %49 = fadd <8 x float> %wide.load.1, %wide.load12.1
  %50 = fadd <8 x float> %wide.load9.1, %wide.load13.1
  %51 = fadd <8 x float> %wide.load10.1, %wide.load14.1
  %52 = fadd <8 x float> %wide.load11.1, %wide.load15.1
  %53 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 32
  %54 = getelementptr inbounds nuw i8, ptr %53, i64 32
  %55 = getelementptr inbounds nuw i8, ptr %53, i64 64
  %56 = getelementptr inbounds nuw i8, ptr %53, i64 96
  store <8 x float> %49, ptr %53, align 64, !alias.scope !5
  store <8 x float> %50, ptr %54, align 32, !alias.scope !5
  store <8 x float> %51, ptr %55, align 64, !alias.scope !5
  store <8 x float> %52, ptr %56, align 32, !alias.scope !5
  %57 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 64
  %58 = getelementptr inbounds nuw i8, ptr %57, i64 32
  %59 = getelementptr inbounds nuw i8, ptr %57, i64 64
  %60 = getelementptr inbounds nuw i8, ptr %57, i64 96
  %wide.load.2 = load <8 x float>, ptr %57, align 64, !invariant.load !1, !noalias !5
  %wide.load9.2 = load <8 x float>, ptr %58, align 32, !invariant.load !1, !noalias !5
  %wide.load10.2 = load <8 x float>, ptr %59, align 64, !invariant.load !1, !noalias !5
  %wide.load11.2 = load <8 x float>, ptr %60, align 32, !invariant.load !1, !noalias !5
  %61 = fadd <8 x float> %wide.load.2, %wide.load12.2
  %62 = fadd <8 x float> %wide.load9.2, %wide.load13.2
  %63 = fadd <8 x float> %wide.load10.2, %wide.load14.2
  %64 = fadd <8 x float> %wide.load11.2, %wide.load15.2
  %65 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 64
  %66 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %67 = getelementptr inbounds nuw i8, ptr %65, i64 64
  %68 = getelementptr inbounds nuw i8, ptr %65, i64 96
  store <8 x float> %61, ptr %65, align 64, !alias.scope !5
  store <8 x float> %62, ptr %66, align 32, !alias.scope !5
  store <8 x float> %63, ptr %67, align 64, !alias.scope !5
  store <8 x float> %64, ptr %68, align 32, !alias.scope !5
  %69 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 96
  %70 = getelementptr inbounds nuw i8, ptr %69, i64 32
  %71 = getelementptr inbounds nuw i8, ptr %69, i64 64
  %72 = getelementptr inbounds nuw i8, ptr %69, i64 96
  %wide.load.3 = load <8 x float>, ptr %69, align 64, !invariant.load !1, !noalias !5
  %wide.load9.3 = load <8 x float>, ptr %70, align 32, !invariant.load !1, !noalias !5
  %wide.load10.3 = load <8 x float>, ptr %71, align 64, !invariant.load !1, !noalias !5
  %wide.load11.3 = load <8 x float>, ptr %72, align 32, !invariant.load !1, !noalias !5
  %73 = fadd <8 x float> %wide.load.3, %wide.load12.3
  %74 = fadd <8 x float> %wide.load9.3, %wide.load13.3
  %75 = fadd <8 x float> %wide.load10.3, %wide.load14.3
  %76 = fadd <8 x float> %wide.load11.3, %wide.load15.3
  %77 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 96
  %78 = getelementptr inbounds nuw i8, ptr %77, i64 32
  %79 = getelementptr inbounds nuw i8, ptr %77, i64 64
  %80 = getelementptr inbounds nuw i8, ptr %77, i64 96
  store <8 x float> %73, ptr %77, align 64, !alias.scope !5
  store <8 x float> %74, ptr %78, align 32, !alias.scope !5
  store <8 x float> %75, ptr %79, align 64, !alias.scope !5
  store <8 x float> %76, ptr %80, align 32, !alias.scope !5
  %81 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 128
  %82 = getelementptr inbounds nuw i8, ptr %81, i64 32
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 64
  %84 = getelementptr inbounds nuw i8, ptr %81, i64 96
  %wide.load.4 = load <8 x float>, ptr %81, align 64, !invariant.load !1, !noalias !5
  %wide.load9.4 = load <8 x float>, ptr %82, align 32, !invariant.load !1, !noalias !5
  %wide.load10.4 = load <8 x float>, ptr %83, align 64, !invariant.load !1, !noalias !5
  %wide.load11.4 = load <8 x float>, ptr %84, align 32, !invariant.load !1, !noalias !5
  %85 = fadd <8 x float> %wide.load.4, %wide.load12.4
  %86 = fadd <8 x float> %wide.load9.4, %wide.load13.4
  %87 = fadd <8 x float> %wide.load10.4, %wide.load14.4
  %88 = fadd <8 x float> %wide.load11.4, %wide.load15.4
  %89 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 128
  %90 = getelementptr inbounds nuw i8, ptr %89, i64 32
  %91 = getelementptr inbounds nuw i8, ptr %89, i64 64
  %92 = getelementptr inbounds nuw i8, ptr %89, i64 96
  store <8 x float> %85, ptr %89, align 64, !alias.scope !5
  store <8 x float> %86, ptr %90, align 32, !alias.scope !5
  store <8 x float> %87, ptr %91, align 64, !alias.scope !5
  store <8 x float> %88, ptr %92, align 32, !alias.scope !5
  %93 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 160
  %94 = getelementptr inbounds nuw i8, ptr %93, i64 32
  %95 = getelementptr inbounds nuw i8, ptr %93, i64 64
  %96 = getelementptr inbounds nuw i8, ptr %93, i64 96
  %wide.load.5 = load <8 x float>, ptr %93, align 64, !invariant.load !1, !noalias !5
  %wide.load9.5 = load <8 x float>, ptr %94, align 32, !invariant.load !1, !noalias !5
  %wide.load10.5 = load <8 x float>, ptr %95, align 64, !invariant.load !1, !noalias !5
  %wide.load11.5 = load <8 x float>, ptr %96, align 32, !invariant.load !1, !noalias !5
  %97 = fadd <8 x float> %wide.load.5, %wide.load12.5
  %98 = fadd <8 x float> %wide.load9.5, %wide.load13.5
  %99 = fadd <8 x float> %wide.load10.5, %wide.load14.5
  %100 = fadd <8 x float> %wide.load11.5, %wide.load15.5
  %101 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 160
  %102 = getelementptr inbounds nuw i8, ptr %101, i64 32
  %103 = getelementptr inbounds nuw i8, ptr %101, i64 64
  %104 = getelementptr inbounds nuw i8, ptr %101, i64 96
  store <8 x float> %97, ptr %101, align 64, !alias.scope !5
  store <8 x float> %98, ptr %102, align 32, !alias.scope !5
  store <8 x float> %99, ptr %103, align 64, !alias.scope !5
  store <8 x float> %100, ptr %104, align 32, !alias.scope !5
  %105 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 192
  %106 = getelementptr inbounds nuw i8, ptr %105, i64 32
  %107 = getelementptr inbounds nuw i8, ptr %105, i64 64
  %108 = getelementptr inbounds nuw i8, ptr %105, i64 96
  %wide.load.6 = load <8 x float>, ptr %105, align 64, !invariant.load !1, !noalias !5
  %wide.load9.6 = load <8 x float>, ptr %106, align 32, !invariant.load !1, !noalias !5
  %wide.load10.6 = load <8 x float>, ptr %107, align 64, !invariant.load !1, !noalias !5
  %wide.load11.6 = load <8 x float>, ptr %108, align 32, !invariant.load !1, !noalias !5
  %109 = fadd <8 x float> %wide.load.6, %wide.load12.6
  %110 = fadd <8 x float> %wide.load9.6, %wide.load13.6
  %111 = fadd <8 x float> %wide.load10.6, %wide.load14.6
  %112 = fadd <8 x float> %wide.load11.6, %wide.load15.6
  %113 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 192
  %114 = getelementptr inbounds nuw i8, ptr %113, i64 32
  %115 = getelementptr inbounds nuw i8, ptr %113, i64 64
  %116 = getelementptr inbounds nuw i8, ptr %113, i64 96
  store <8 x float> %109, ptr %113, align 64, !alias.scope !5
  store <8 x float> %110, ptr %114, align 32, !alias.scope !5
  store <8 x float> %111, ptr %115, align 64, !alias.scope !5
  store <8 x float> %112, ptr %116, align 32, !alias.scope !5
  %117 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 224
  %118 = getelementptr inbounds nuw i8, ptr %117, i64 32
  %119 = getelementptr inbounds nuw i8, ptr %117, i64 64
  %120 = getelementptr inbounds nuw i8, ptr %117, i64 96
  %wide.load.7 = load <8 x float>, ptr %117, align 64, !invariant.load !1, !noalias !5
  %wide.load9.7 = load <8 x float>, ptr %118, align 32, !invariant.load !1, !noalias !5
  %wide.load10.7 = load <8 x float>, ptr %119, align 64, !invariant.load !1, !noalias !5
  %wide.load11.7 = load <8 x float>, ptr %120, align 32, !invariant.load !1, !noalias !5
  %121 = fadd <8 x float> %wide.load.7, %wide.load12.7
  %122 = fadd <8 x float> %wide.load9.7, %wide.load13.7
  %123 = fadd <8 x float> %wide.load10.7, %wide.load14.7
  %124 = fadd <8 x float> %wide.load11.7, %wide.load15.7
  %125 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_add_fusion.invar_address.dim.0.07, i64 224
  %126 = getelementptr inbounds nuw i8, ptr %125, i64 32
  %127 = getelementptr inbounds nuw i8, ptr %125, i64 64
  %128 = getelementptr inbounds nuw i8, ptr %125, i64 96
  store <8 x float> %121, ptr %125, align 64, !alias.scope !5
  store <8 x float> %122, ptr %126, align 32, !alias.scope !5
  store <8 x float> %123, ptr %127, align 64, !alias.scope !5
  store <8 x float> %124, ptr %128, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.invar_address.dim.0.07, 1
  %exitcond8 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond8, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 65536}
!3 = !{i64 64}
!4 = !{i64 1024}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:65536}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
