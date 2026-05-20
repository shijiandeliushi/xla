; ModuleID = '__compute_module_broadcast.2_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast.2_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  %broadcast.splatinsert = insertelement <8 x float> poison, float %2, i64 0
  %broadcast.splat = shufflevector <8 x float> %broadcast.splatinsert, <8 x float> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %1
  %broadcast.2.invar_address.dim.0.05 = phi i64 [ 0, %1 ], [ %invar.inc, %vector.ph ]
  %3 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 0
  %4 = getelementptr inbounds nuw i8, ptr %3, i64 32
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 64
  %6 = getelementptr inbounds nuw i8, ptr %3, i64 96
  store <8 x float> %broadcast.splat, ptr %3, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %4, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %5, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %6, align 32, !alias.scope !5
  %7 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %7, i64 32
  %9 = getelementptr inbounds nuw i8, ptr %7, i64 64
  %10 = getelementptr inbounds nuw i8, ptr %7, i64 96
  store <8 x float> %broadcast.splat, ptr %7, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %8, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %9, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %10, align 32, !alias.scope !5
  %11 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 64
  %12 = getelementptr inbounds nuw i8, ptr %11, i64 32
  %13 = getelementptr inbounds nuw i8, ptr %11, i64 64
  %14 = getelementptr inbounds nuw i8, ptr %11, i64 96
  store <8 x float> %broadcast.splat, ptr %11, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %12, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %13, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %14, align 32, !alias.scope !5
  %15 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 96
  %16 = getelementptr inbounds nuw i8, ptr %15, i64 32
  %17 = getelementptr inbounds nuw i8, ptr %15, i64 64
  %18 = getelementptr inbounds nuw i8, ptr %15, i64 96
  store <8 x float> %broadcast.splat, ptr %15, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %16, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %17, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %18, align 32, !alias.scope !5
  %19 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 128
  %20 = getelementptr inbounds nuw i8, ptr %19, i64 32
  %21 = getelementptr inbounds nuw i8, ptr %19, i64 64
  %22 = getelementptr inbounds nuw i8, ptr %19, i64 96
  store <8 x float> %broadcast.splat, ptr %19, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %20, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %21, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %22, align 32, !alias.scope !5
  %23 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 160
  %24 = getelementptr inbounds nuw i8, ptr %23, i64 32
  %25 = getelementptr inbounds nuw i8, ptr %23, i64 64
  %26 = getelementptr inbounds nuw i8, ptr %23, i64 96
  store <8 x float> %broadcast.splat, ptr %23, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %24, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %25, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %26, align 32, !alias.scope !5
  %27 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 192
  %28 = getelementptr inbounds nuw i8, ptr %27, i64 32
  %29 = getelementptr inbounds nuw i8, ptr %27, i64 64
  %30 = getelementptr inbounds nuw i8, ptr %27, i64 96
  store <8 x float> %broadcast.splat, ptr %27, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %28, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %29, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %30, align 32, !alias.scope !5
  %31 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 224
  %32 = getelementptr inbounds nuw i8, ptr %31, i64 32
  %33 = getelementptr inbounds nuw i8, ptr %31, i64 64
  %34 = getelementptr inbounds nuw i8, ptr %31, i64 96
  store <8 x float> %broadcast.splat, ptr %31, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %32, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %33, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %34, align 32, !alias.scope !5
  %35 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 256
  %36 = getelementptr inbounds nuw i8, ptr %35, i64 32
  %37 = getelementptr inbounds nuw i8, ptr %35, i64 64
  %38 = getelementptr inbounds nuw i8, ptr %35, i64 96
  store <8 x float> %broadcast.splat, ptr %35, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %36, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %37, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %38, align 32, !alias.scope !5
  %39 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 288
  %40 = getelementptr inbounds nuw i8, ptr %39, i64 32
  %41 = getelementptr inbounds nuw i8, ptr %39, i64 64
  %42 = getelementptr inbounds nuw i8, ptr %39, i64 96
  store <8 x float> %broadcast.splat, ptr %39, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %40, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %41, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %42, align 32, !alias.scope !5
  %43 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 320
  %44 = getelementptr inbounds nuw i8, ptr %43, i64 32
  %45 = getelementptr inbounds nuw i8, ptr %43, i64 64
  %46 = getelementptr inbounds nuw i8, ptr %43, i64 96
  store <8 x float> %broadcast.splat, ptr %43, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %44, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %45, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %46, align 32, !alias.scope !5
  %47 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 352
  %48 = getelementptr inbounds nuw i8, ptr %47, i64 32
  %49 = getelementptr inbounds nuw i8, ptr %47, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %47, i64 96
  store <8 x float> %broadcast.splat, ptr %47, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %48, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %49, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %50, align 32, !alias.scope !5
  %51 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 384
  %52 = getelementptr inbounds nuw i8, ptr %51, i64 32
  %53 = getelementptr inbounds nuw i8, ptr %51, i64 64
  %54 = getelementptr inbounds nuw i8, ptr %51, i64 96
  store <8 x float> %broadcast.splat, ptr %51, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %52, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %53, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %54, align 32, !alias.scope !5
  %55 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 416
  %56 = getelementptr inbounds nuw i8, ptr %55, i64 32
  %57 = getelementptr inbounds nuw i8, ptr %55, i64 64
  %58 = getelementptr inbounds nuw i8, ptr %55, i64 96
  store <8 x float> %broadcast.splat, ptr %55, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %56, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %57, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %58, align 32, !alias.scope !5
  %59 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 448
  %60 = getelementptr inbounds nuw i8, ptr %59, i64 32
  %61 = getelementptr inbounds nuw i8, ptr %59, i64 64
  %62 = getelementptr inbounds nuw i8, ptr %59, i64 96
  store <8 x float> %broadcast.splat, ptr %59, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %60, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %61, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %62, align 32, !alias.scope !5
  %63 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 480
  %64 = getelementptr inbounds nuw i8, ptr %63, i64 32
  %65 = getelementptr inbounds nuw i8, ptr %63, i64 64
  %66 = getelementptr inbounds nuw i8, ptr %63, i64 96
  store <8 x float> %broadcast.splat, ptr %63, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %64, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %65, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %66, align 32, !alias.scope !5
  %67 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 512
  %68 = getelementptr inbounds nuw i8, ptr %67, i64 32
  %69 = getelementptr inbounds nuw i8, ptr %67, i64 64
  %70 = getelementptr inbounds nuw i8, ptr %67, i64 96
  store <8 x float> %broadcast.splat, ptr %67, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %68, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %69, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %70, align 32, !alias.scope !5
  %71 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 544
  %72 = getelementptr inbounds nuw i8, ptr %71, i64 32
  %73 = getelementptr inbounds nuw i8, ptr %71, i64 64
  %74 = getelementptr inbounds nuw i8, ptr %71, i64 96
  store <8 x float> %broadcast.splat, ptr %71, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %72, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %73, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %74, align 32, !alias.scope !5
  %75 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 576
  %76 = getelementptr inbounds nuw i8, ptr %75, i64 32
  %77 = getelementptr inbounds nuw i8, ptr %75, i64 64
  %78 = getelementptr inbounds nuw i8, ptr %75, i64 96
  store <8 x float> %broadcast.splat, ptr %75, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %76, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %77, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %78, align 32, !alias.scope !5
  %79 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 608
  %80 = getelementptr inbounds nuw i8, ptr %79, i64 32
  %81 = getelementptr inbounds nuw i8, ptr %79, i64 64
  %82 = getelementptr inbounds nuw i8, ptr %79, i64 96
  store <8 x float> %broadcast.splat, ptr %79, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %80, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %81, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %82, align 32, !alias.scope !5
  %83 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 640
  %84 = getelementptr inbounds nuw i8, ptr %83, i64 32
  %85 = getelementptr inbounds nuw i8, ptr %83, i64 64
  %86 = getelementptr inbounds nuw i8, ptr %83, i64 96
  store <8 x float> %broadcast.splat, ptr %83, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %84, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %85, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %86, align 32, !alias.scope !5
  %87 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 672
  %88 = getelementptr inbounds nuw i8, ptr %87, i64 32
  %89 = getelementptr inbounds nuw i8, ptr %87, i64 64
  %90 = getelementptr inbounds nuw i8, ptr %87, i64 96
  store <8 x float> %broadcast.splat, ptr %87, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %88, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %89, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %90, align 32, !alias.scope !5
  %91 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 704
  %92 = getelementptr inbounds nuw i8, ptr %91, i64 32
  %93 = getelementptr inbounds nuw i8, ptr %91, i64 64
  %94 = getelementptr inbounds nuw i8, ptr %91, i64 96
  store <8 x float> %broadcast.splat, ptr %91, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %92, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %93, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %94, align 32, !alias.scope !5
  %95 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 736
  %96 = getelementptr inbounds nuw i8, ptr %95, i64 32
  %97 = getelementptr inbounds nuw i8, ptr %95, i64 64
  %98 = getelementptr inbounds nuw i8, ptr %95, i64 96
  store <8 x float> %broadcast.splat, ptr %95, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %96, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %97, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %98, align 32, !alias.scope !5
  %99 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 768
  %100 = getelementptr inbounds nuw i8, ptr %99, i64 32
  %101 = getelementptr inbounds nuw i8, ptr %99, i64 64
  %102 = getelementptr inbounds nuw i8, ptr %99, i64 96
  store <8 x float> %broadcast.splat, ptr %99, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %100, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %101, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %102, align 32, !alias.scope !5
  %103 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 800
  %104 = getelementptr inbounds nuw i8, ptr %103, i64 32
  %105 = getelementptr inbounds nuw i8, ptr %103, i64 64
  %106 = getelementptr inbounds nuw i8, ptr %103, i64 96
  store <8 x float> %broadcast.splat, ptr %103, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %104, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %105, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %106, align 32, !alias.scope !5
  %107 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 832
  %108 = getelementptr inbounds nuw i8, ptr %107, i64 32
  %109 = getelementptr inbounds nuw i8, ptr %107, i64 64
  %110 = getelementptr inbounds nuw i8, ptr %107, i64 96
  store <8 x float> %broadcast.splat, ptr %107, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %108, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %109, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %110, align 32, !alias.scope !5
  %111 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 864
  %112 = getelementptr inbounds nuw i8, ptr %111, i64 32
  %113 = getelementptr inbounds nuw i8, ptr %111, i64 64
  %114 = getelementptr inbounds nuw i8, ptr %111, i64 96
  store <8 x float> %broadcast.splat, ptr %111, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %112, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %113, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %114, align 32, !alias.scope !5
  %115 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 896
  %116 = getelementptr inbounds nuw i8, ptr %115, i64 32
  %117 = getelementptr inbounds nuw i8, ptr %115, i64 64
  %118 = getelementptr inbounds nuw i8, ptr %115, i64 96
  store <8 x float> %broadcast.splat, ptr %115, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %116, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %117, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %118, align 32, !alias.scope !5
  %119 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 928
  %120 = getelementptr inbounds nuw i8, ptr %119, i64 32
  %121 = getelementptr inbounds nuw i8, ptr %119, i64 64
  %122 = getelementptr inbounds nuw i8, ptr %119, i64 96
  store <8 x float> %broadcast.splat, ptr %119, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %120, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %121, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %122, align 32, !alias.scope !5
  %123 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 960
  %124 = getelementptr inbounds nuw i8, ptr %123, i64 32
  %125 = getelementptr inbounds nuw i8, ptr %123, i64 64
  %126 = getelementptr inbounds nuw i8, ptr %123, i64 96
  store <8 x float> %broadcast.splat, ptr %123, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %124, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %125, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %126, align 32, !alias.scope !5
  %127 = getelementptr inbounds nuw [64 x [1024 x float]], ptr %arg1, i64 0, i64 %broadcast.2.invar_address.dim.0.05, i64 992
  %128 = getelementptr inbounds nuw i8, ptr %127, i64 32
  %129 = getelementptr inbounds nuw i8, ptr %127, i64 64
  %130 = getelementptr inbounds nuw i8, ptr %127, i64 96
  store <8 x float> %broadcast.splat, ptr %127, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %128, align 32, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %129, align 64, !alias.scope !5
  store <8 x float> %broadcast.splat, ptr %130, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast.2.invar_address.dim.0.05, 1
  %exitcond6 = icmp eq i64 %invar.inc, 64
  br i1 %exitcond6, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 262144}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:262144}", !7}
!7 = !{!"XLA host kernel broadcast.2_kernel AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
