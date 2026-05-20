; ModuleID = '__compute_module_part_01'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #0

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_maximum_fusion(ptr readonly captures(none) %0) local_unnamed_addr #1 {
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
  %19 = getelementptr inbounds nuw i8, ptr %arg1, i64 512
  %20 = getelementptr inbounds nuw i8, ptr %arg1, i64 544
  %21 = getelementptr inbounds nuw i8, ptr %arg1, i64 576
  %22 = getelementptr inbounds nuw i8, ptr %arg1, i64 608
  %wide.load11.4 = load <8 x float>, ptr %19, align 64
  %wide.load12.4 = load <8 x float>, ptr %20, align 32
  %wide.load13.4 = load <8 x float>, ptr %21, align 64
  %wide.load14.4 = load <8 x float>, ptr %22, align 32
  %23 = getelementptr inbounds nuw i8, ptr %arg1, i64 640
  %24 = getelementptr inbounds nuw i8, ptr %arg1, i64 672
  %25 = getelementptr inbounds nuw i8, ptr %arg1, i64 704
  %26 = getelementptr inbounds nuw i8, ptr %arg1, i64 736
  %wide.load11.5 = load <8 x float>, ptr %23, align 64
  %wide.load12.5 = load <8 x float>, ptr %24, align 32
  %wide.load13.5 = load <8 x float>, ptr %25, align 64
  %wide.load14.5 = load <8 x float>, ptr %26, align 32
  %27 = getelementptr inbounds nuw i8, ptr %arg1, i64 768
  %28 = getelementptr inbounds nuw i8, ptr %arg1, i64 800
  %29 = getelementptr inbounds nuw i8, ptr %arg1, i64 832
  %30 = getelementptr inbounds nuw i8, ptr %arg1, i64 864
  %wide.load11.6 = load <8 x float>, ptr %27, align 64
  %wide.load12.6 = load <8 x float>, ptr %28, align 32
  %wide.load13.6 = load <8 x float>, ptr %29, align 64
  %wide.load14.6 = load <8 x float>, ptr %30, align 32
  %31 = getelementptr inbounds nuw i8, ptr %arg1, i64 896
  %32 = getelementptr inbounds nuw i8, ptr %arg1, i64 928
  %33 = getelementptr inbounds nuw i8, ptr %arg1, i64 960
  %34 = getelementptr inbounds nuw i8, ptr %arg1, i64 992
  %wide.load11.7 = load <8 x float>, ptr %31, align 64
  %wide.load12.7 = load <8 x float>, ptr %32, align 32
  %wide.load13.7 = load <8 x float>, ptr %33, align 64
  %wide.load14.7 = load <8 x float>, ptr %34, align 32
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %broadcast_maximum_fusion.loop_exit.dim.1, %1
  %broadcast_maximum_fusion.invar_address.dim.0.02 = phi i64 [ 0, %1 ], [ %invar.inc, %broadcast_maximum_fusion.loop_exit.dim.1 ]
  %35 = shl nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.0.02, 10
  %36 = add i64 %3, %35
  %diff.check7 = icmp ult i64 %36, 128
  %conflict.rdx = or i1 %diff.check, %diff.check7
  br i1 %conflict.rdx, label %broadcast_maximum_fusion.loop_body.dim.1, label %vector.body

vector.body:                                      ; preds = %vector.memcheck
  %37 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 0
  %38 = getelementptr inbounds nuw i8, ptr %37, i64 32
  %39 = getelementptr inbounds nuw i8, ptr %37, i64 64
  %40 = getelementptr inbounds nuw i8, ptr %37, i64 96
  %wide.load = load <8 x float>, ptr %37, align 64
  %wide.load8 = load <8 x float>, ptr %38, align 32
  %wide.load9 = load <8 x float>, ptr %39, align 64
  %wide.load10 = load <8 x float>, ptr %40, align 32
  %41 = fadd <8 x float> %wide.load, %wide.load11
  %42 = fadd <8 x float> %wide.load8, %wide.load12
  %43 = fadd <8 x float> %wide.load9, %wide.load13
  %44 = fadd <8 x float> %wide.load10, %wide.load14
  %45 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %41, <8 x float> zeroinitializer)
  %46 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %42, <8 x float> zeroinitializer)
  %47 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %43, <8 x float> zeroinitializer)
  %48 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %44, <8 x float> zeroinitializer)
  %49 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 0
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 32
  %51 = getelementptr inbounds nuw i8, ptr %49, i64 64
  %52 = getelementptr inbounds nuw i8, ptr %49, i64 96
  store <8 x float> %45, ptr %49, align 64, !alias.scope !5
  store <8 x float> %46, ptr %50, align 32, !alias.scope !5
  store <8 x float> %47, ptr %51, align 64, !alias.scope !5
  store <8 x float> %48, ptr %52, align 32, !alias.scope !5
  %53 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 32
  %54 = getelementptr inbounds nuw i8, ptr %53, i64 32
  %55 = getelementptr inbounds nuw i8, ptr %53, i64 64
  %56 = getelementptr inbounds nuw i8, ptr %53, i64 96
  %wide.load.1 = load <8 x float>, ptr %53, align 64
  %wide.load8.1 = load <8 x float>, ptr %54, align 32
  %wide.load9.1 = load <8 x float>, ptr %55, align 64
  %wide.load10.1 = load <8 x float>, ptr %56, align 32
  %57 = fadd <8 x float> %wide.load.1, %wide.load11.1
  %58 = fadd <8 x float> %wide.load8.1, %wide.load12.1
  %59 = fadd <8 x float> %wide.load9.1, %wide.load13.1
  %60 = fadd <8 x float> %wide.load10.1, %wide.load14.1
  %61 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %57, <8 x float> zeroinitializer)
  %62 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %58, <8 x float> zeroinitializer)
  %63 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %59, <8 x float> zeroinitializer)
  %64 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %60, <8 x float> zeroinitializer)
  %65 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 32
  %66 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %67 = getelementptr inbounds nuw i8, ptr %65, i64 64
  %68 = getelementptr inbounds nuw i8, ptr %65, i64 96
  store <8 x float> %61, ptr %65, align 64, !alias.scope !5
  store <8 x float> %62, ptr %66, align 32, !alias.scope !5
  store <8 x float> %63, ptr %67, align 64, !alias.scope !5
  store <8 x float> %64, ptr %68, align 32, !alias.scope !5
  %69 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 64
  %70 = getelementptr inbounds nuw i8, ptr %69, i64 32
  %71 = getelementptr inbounds nuw i8, ptr %69, i64 64
  %72 = getelementptr inbounds nuw i8, ptr %69, i64 96
  %wide.load.2 = load <8 x float>, ptr %69, align 64
  %wide.load8.2 = load <8 x float>, ptr %70, align 32
  %wide.load9.2 = load <8 x float>, ptr %71, align 64
  %wide.load10.2 = load <8 x float>, ptr %72, align 32
  %73 = fadd <8 x float> %wide.load.2, %wide.load11.2
  %74 = fadd <8 x float> %wide.load8.2, %wide.load12.2
  %75 = fadd <8 x float> %wide.load9.2, %wide.load13.2
  %76 = fadd <8 x float> %wide.load10.2, %wide.load14.2
  %77 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %73, <8 x float> zeroinitializer)
  %78 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %74, <8 x float> zeroinitializer)
  %79 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %75, <8 x float> zeroinitializer)
  %80 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %76, <8 x float> zeroinitializer)
  %81 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 64
  %82 = getelementptr inbounds nuw i8, ptr %81, i64 32
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 64
  %84 = getelementptr inbounds nuw i8, ptr %81, i64 96
  store <8 x float> %77, ptr %81, align 64, !alias.scope !5
  store <8 x float> %78, ptr %82, align 32, !alias.scope !5
  store <8 x float> %79, ptr %83, align 64, !alias.scope !5
  store <8 x float> %80, ptr %84, align 32, !alias.scope !5
  %85 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 96
  %86 = getelementptr inbounds nuw i8, ptr %85, i64 32
  %87 = getelementptr inbounds nuw i8, ptr %85, i64 64
  %88 = getelementptr inbounds nuw i8, ptr %85, i64 96
  %wide.load.3 = load <8 x float>, ptr %85, align 64
  %wide.load8.3 = load <8 x float>, ptr %86, align 32
  %wide.load9.3 = load <8 x float>, ptr %87, align 64
  %wide.load10.3 = load <8 x float>, ptr %88, align 32
  %89 = fadd <8 x float> %wide.load.3, %wide.load11.3
  %90 = fadd <8 x float> %wide.load8.3, %wide.load12.3
  %91 = fadd <8 x float> %wide.load9.3, %wide.load13.3
  %92 = fadd <8 x float> %wide.load10.3, %wide.load14.3
  %93 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %89, <8 x float> zeroinitializer)
  %94 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %90, <8 x float> zeroinitializer)
  %95 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %91, <8 x float> zeroinitializer)
  %96 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %92, <8 x float> zeroinitializer)
  %97 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 96
  %98 = getelementptr inbounds nuw i8, ptr %97, i64 32
  %99 = getelementptr inbounds nuw i8, ptr %97, i64 64
  %100 = getelementptr inbounds nuw i8, ptr %97, i64 96
  store <8 x float> %93, ptr %97, align 64, !alias.scope !5
  store <8 x float> %94, ptr %98, align 32, !alias.scope !5
  store <8 x float> %95, ptr %99, align 64, !alias.scope !5
  store <8 x float> %96, ptr %100, align 32, !alias.scope !5
  %101 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 128
  %102 = getelementptr inbounds nuw i8, ptr %101, i64 32
  %103 = getelementptr inbounds nuw i8, ptr %101, i64 64
  %104 = getelementptr inbounds nuw i8, ptr %101, i64 96
  %wide.load.4 = load <8 x float>, ptr %101, align 64
  %wide.load8.4 = load <8 x float>, ptr %102, align 32
  %wide.load9.4 = load <8 x float>, ptr %103, align 64
  %wide.load10.4 = load <8 x float>, ptr %104, align 32
  %105 = fadd <8 x float> %wide.load.4, %wide.load11.4
  %106 = fadd <8 x float> %wide.load8.4, %wide.load12.4
  %107 = fadd <8 x float> %wide.load9.4, %wide.load13.4
  %108 = fadd <8 x float> %wide.load10.4, %wide.load14.4
  %109 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %105, <8 x float> zeroinitializer)
  %110 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %106, <8 x float> zeroinitializer)
  %111 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %107, <8 x float> zeroinitializer)
  %112 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %108, <8 x float> zeroinitializer)
  %113 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 128
  %114 = getelementptr inbounds nuw i8, ptr %113, i64 32
  %115 = getelementptr inbounds nuw i8, ptr %113, i64 64
  %116 = getelementptr inbounds nuw i8, ptr %113, i64 96
  store <8 x float> %109, ptr %113, align 64, !alias.scope !5
  store <8 x float> %110, ptr %114, align 32, !alias.scope !5
  store <8 x float> %111, ptr %115, align 64, !alias.scope !5
  store <8 x float> %112, ptr %116, align 32, !alias.scope !5
  %117 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 160
  %118 = getelementptr inbounds nuw i8, ptr %117, i64 32
  %119 = getelementptr inbounds nuw i8, ptr %117, i64 64
  %120 = getelementptr inbounds nuw i8, ptr %117, i64 96
  %wide.load.5 = load <8 x float>, ptr %117, align 64
  %wide.load8.5 = load <8 x float>, ptr %118, align 32
  %wide.load9.5 = load <8 x float>, ptr %119, align 64
  %wide.load10.5 = load <8 x float>, ptr %120, align 32
  %121 = fadd <8 x float> %wide.load.5, %wide.load11.5
  %122 = fadd <8 x float> %wide.load8.5, %wide.load12.5
  %123 = fadd <8 x float> %wide.load9.5, %wide.load13.5
  %124 = fadd <8 x float> %wide.load10.5, %wide.load14.5
  %125 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %121, <8 x float> zeroinitializer)
  %126 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %122, <8 x float> zeroinitializer)
  %127 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %123, <8 x float> zeroinitializer)
  %128 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %124, <8 x float> zeroinitializer)
  %129 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 160
  %130 = getelementptr inbounds nuw i8, ptr %129, i64 32
  %131 = getelementptr inbounds nuw i8, ptr %129, i64 64
  %132 = getelementptr inbounds nuw i8, ptr %129, i64 96
  store <8 x float> %125, ptr %129, align 64, !alias.scope !5
  store <8 x float> %126, ptr %130, align 32, !alias.scope !5
  store <8 x float> %127, ptr %131, align 64, !alias.scope !5
  store <8 x float> %128, ptr %132, align 32, !alias.scope !5
  %133 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 192
  %134 = getelementptr inbounds nuw i8, ptr %133, i64 32
  %135 = getelementptr inbounds nuw i8, ptr %133, i64 64
  %136 = getelementptr inbounds nuw i8, ptr %133, i64 96
  %wide.load.6 = load <8 x float>, ptr %133, align 64
  %wide.load8.6 = load <8 x float>, ptr %134, align 32
  %wide.load9.6 = load <8 x float>, ptr %135, align 64
  %wide.load10.6 = load <8 x float>, ptr %136, align 32
  %137 = fadd <8 x float> %wide.load.6, %wide.load11.6
  %138 = fadd <8 x float> %wide.load8.6, %wide.load12.6
  %139 = fadd <8 x float> %wide.load9.6, %wide.load13.6
  %140 = fadd <8 x float> %wide.load10.6, %wide.load14.6
  %141 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %137, <8 x float> zeroinitializer)
  %142 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %138, <8 x float> zeroinitializer)
  %143 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %139, <8 x float> zeroinitializer)
  %144 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %140, <8 x float> zeroinitializer)
  %145 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 192
  %146 = getelementptr inbounds nuw i8, ptr %145, i64 32
  %147 = getelementptr inbounds nuw i8, ptr %145, i64 64
  %148 = getelementptr inbounds nuw i8, ptr %145, i64 96
  store <8 x float> %141, ptr %145, align 64, !alias.scope !5
  store <8 x float> %142, ptr %146, align 32, !alias.scope !5
  store <8 x float> %143, ptr %147, align 64, !alias.scope !5
  store <8 x float> %144, ptr %148, align 32, !alias.scope !5
  %149 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 224
  %150 = getelementptr inbounds nuw i8, ptr %149, i64 32
  %151 = getelementptr inbounds nuw i8, ptr %149, i64 64
  %152 = getelementptr inbounds nuw i8, ptr %149, i64 96
  %wide.load.7 = load <8 x float>, ptr %149, align 64
  %wide.load8.7 = load <8 x float>, ptr %150, align 32
  %wide.load9.7 = load <8 x float>, ptr %151, align 64
  %wide.load10.7 = load <8 x float>, ptr %152, align 32
  %153 = fadd <8 x float> %wide.load.7, %wide.load11.7
  %154 = fadd <8 x float> %wide.load8.7, %wide.load12.7
  %155 = fadd <8 x float> %wide.load9.7, %wide.load13.7
  %156 = fadd <8 x float> %wide.load10.7, %wide.load14.7
  %157 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %153, <8 x float> zeroinitializer)
  %158 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %154, <8 x float> zeroinitializer)
  %159 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %155, <8 x float> zeroinitializer)
  %160 = tail call <8 x float> @llvm.maximum.v8f32(<8 x float> %156, <8 x float> zeroinitializer)
  %161 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 224
  %162 = getelementptr inbounds nuw i8, ptr %161, i64 32
  %163 = getelementptr inbounds nuw i8, ptr %161, i64 64
  %164 = getelementptr inbounds nuw i8, ptr %161, i64 96
  store <8 x float> %157, ptr %161, align 64, !alias.scope !5
  store <8 x float> %158, ptr %162, align 32, !alias.scope !5
  store <8 x float> %159, ptr %163, align 64, !alias.scope !5
  store <8 x float> %160, ptr %164, align 32, !alias.scope !5
  br label %broadcast_maximum_fusion.loop_exit.dim.1

broadcast_maximum_fusion.loop_body.dim.1:         ; preds = %vector.memcheck, %broadcast_maximum_fusion.loop_body.dim.1
  %broadcast_maximum_fusion.invar_address.dim.1.01 = phi i64 [ %invar.inc5.7, %broadcast_maximum_fusion.loop_body.dim.1 ], [ 0, %vector.memcheck ]
  %165 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %broadcast_maximum_fusion.invar_address.dim.1.01
  %166 = load float, ptr %165, align 32
  %167 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.1.01
  %168 = load float, ptr %167, align 32, !invariant.load !1, !noalias !5
  %add.1 = fadd float %166, %168
  %169 = tail call float @llvm.maximum.f32(float %add.1, float 0.000000e+00)
  %170 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %broadcast_maximum_fusion.invar_address.dim.1.01
  store float %169, ptr %170, align 32, !alias.scope !5
  %invar.inc5 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 1
  %171 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5
  %172 = load float, ptr %171, align 4
  %173 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5
  %174 = load float, ptr %173, align 4, !invariant.load !1, !noalias !5
  %add.1.1 = fadd float %172, %174
  %175 = tail call float @llvm.maximum.f32(float %add.1.1, float 0.000000e+00)
  %176 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5
  store float %175, ptr %176, align 4, !alias.scope !5
  %invar.inc5.1 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 2
  %177 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.1
  %178 = load float, ptr %177, align 8
  %179 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5.1
  %180 = load float, ptr %179, align 8, !invariant.load !1, !noalias !5
  %add.1.2 = fadd float %178, %180
  %181 = tail call float @llvm.maximum.f32(float %add.1.2, float 0.000000e+00)
  %182 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.1
  store float %181, ptr %182, align 8, !alias.scope !5
  %invar.inc5.2 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 3
  %183 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.2
  %184 = load float, ptr %183, align 4
  %185 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5.2
  %186 = load float, ptr %185, align 4, !invariant.load !1, !noalias !5
  %add.1.3 = fadd float %184, %186
  %187 = tail call float @llvm.maximum.f32(float %add.1.3, float 0.000000e+00)
  %188 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.2
  store float %187, ptr %188, align 4, !alias.scope !5
  %invar.inc5.3 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 4
  %189 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.3
  %190 = load float, ptr %189, align 16
  %191 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5.3
  %192 = load float, ptr %191, align 16, !invariant.load !1, !noalias !5
  %add.1.4 = fadd float %190, %192
  %193 = tail call float @llvm.maximum.f32(float %add.1.4, float 0.000000e+00)
  %194 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.3
  store float %193, ptr %194, align 16, !alias.scope !5
  %invar.inc5.4 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 5
  %195 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.4
  %196 = load float, ptr %195, align 4
  %197 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5.4
  %198 = load float, ptr %197, align 4, !invariant.load !1, !noalias !5
  %add.1.5 = fadd float %196, %198
  %199 = tail call float @llvm.maximum.f32(float %add.1.5, float 0.000000e+00)
  %200 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.4
  store float %199, ptr %200, align 4, !alias.scope !5
  %invar.inc5.5 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 6
  %201 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.5
  %202 = load float, ptr %201, align 8
  %203 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5.5
  %204 = load float, ptr %203, align 8, !invariant.load !1, !noalias !5
  %add.1.6 = fadd float %202, %204
  %205 = tail call float @llvm.maximum.f32(float %add.1.6, float 0.000000e+00)
  %206 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.5
  store float %205, ptr %206, align 8, !alias.scope !5
  %invar.inc5.6 = or disjoint i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 7
  %207 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg0, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.6
  %208 = load float, ptr %207, align 4
  %209 = getelementptr inbounds nuw [256 x float], ptr %arg1, i64 0, i64 %invar.inc5.6
  %210 = load float, ptr %209, align 4, !invariant.load !1, !noalias !5
  %add.1.7 = fadd float %208, %210
  %211 = tail call float @llvm.maximum.f32(float %add.1.7, float 0.000000e+00)
  %212 = getelementptr inbounds nuw [64 x [256 x float]], ptr %arg2, i64 0, i64 %broadcast_maximum_fusion.invar_address.dim.0.02, i64 %invar.inc5.6
  store float %211, ptr %212, align 4, !alias.scope !5
  %invar.inc5.7 = add nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.1.01, 8
  %exitcond.7 = icmp eq i64 %invar.inc5.7, 256
  br i1 %exitcond.7, label %broadcast_maximum_fusion.loop_exit.dim.1, label %broadcast_maximum_fusion.loop_body.dim.1, !llvm.loop !8

broadcast_maximum_fusion.loop_exit.dim.1:         ; preds = %broadcast_maximum_fusion.loop_body.dim.1, %vector.body
  %invar.inc = add nuw nsw i64 %broadcast_maximum_fusion.invar_address.dim.0.02, 1
  %exitcond3 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond3, label %return, label %vector.memcheck, !llvm.loop !10

return:                                           ; preds = %broadcast_maximum_fusion.loop_exit.dim.1
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <8 x float> @llvm.maximum.v8f32(<8 x float>, <8 x float>) #2

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 1}
!1 = !{}
!2 = !{i64 65536}
!3 = !{i64 64}
!4 = !{i64 1024}
!5 = !{!6}
!6 = !{!"result slice: {index:8, offset:131072, size:65536}", !7}
!7 = !{!"XLA host kernel broadcast_maximum_fusion AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.isvectorized", i32 1}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
