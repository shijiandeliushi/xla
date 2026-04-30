; ModuleID = '__compute_module_broadcast_maximum_fusion_kernel_module'
source_filename = "__compute_module_broadcast_maximum_fusion_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind uwtable
define noalias noundef ptr @broadcast_maximum_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %6 = load ptr, ptr %5, align 8, !invariant.load !3, !dereferenceable !5
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  %7 = getelementptr inbounds nuw i8, ptr %6, i64 32
  %8 = getelementptr inbounds nuw i8, ptr %6, i64 64
  %9 = getelementptr inbounds nuw i8, ptr %6, i64 96
  %wide.load5 = load <8 x float>, ptr %6, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6 = load <8 x float>, ptr %7, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7 = load <8 x float>, ptr %8, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8 = load <8 x float>, ptr %9, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %10 = getelementptr inbounds nuw i8, ptr %6, i64 128
  %11 = getelementptr inbounds nuw i8, ptr %6, i64 160
  %12 = getelementptr inbounds nuw i8, ptr %6, i64 192
  %13 = getelementptr inbounds nuw i8, ptr %6, i64 224
  %wide.load5.1 = load <8 x float>, ptr %10, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.1 = load <8 x float>, ptr %11, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.1 = load <8 x float>, ptr %12, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.1 = load <8 x float>, ptr %13, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %14 = getelementptr inbounds nuw i8, ptr %6, i64 256
  %15 = getelementptr inbounds nuw i8, ptr %6, i64 288
  %16 = getelementptr inbounds nuw i8, ptr %6, i64 320
  %17 = getelementptr inbounds nuw i8, ptr %6, i64 352
  %wide.load5.2 = load <8 x float>, ptr %14, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.2 = load <8 x float>, ptr %15, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.2 = load <8 x float>, ptr %16, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.2 = load <8 x float>, ptr %17, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %18 = getelementptr inbounds nuw i8, ptr %6, i64 384
  %19 = getelementptr inbounds nuw i8, ptr %6, i64 416
  %20 = getelementptr inbounds nuw i8, ptr %6, i64 448
  %21 = getelementptr inbounds nuw i8, ptr %6, i64 480
  %wide.load5.3 = load <8 x float>, ptr %18, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.3 = load <8 x float>, ptr %19, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.3 = load <8 x float>, ptr %20, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.3 = load <8 x float>, ptr %21, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %22 = getelementptr inbounds nuw i8, ptr %6, i64 512
  %23 = getelementptr inbounds nuw i8, ptr %6, i64 544
  %24 = getelementptr inbounds nuw i8, ptr %6, i64 576
  %25 = getelementptr inbounds nuw i8, ptr %6, i64 608
  %wide.load5.4 = load <8 x float>, ptr %22, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.4 = load <8 x float>, ptr %23, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.4 = load <8 x float>, ptr %24, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.4 = load <8 x float>, ptr %25, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %26 = getelementptr inbounds nuw i8, ptr %6, i64 640
  %27 = getelementptr inbounds nuw i8, ptr %6, i64 672
  %28 = getelementptr inbounds nuw i8, ptr %6, i64 704
  %29 = getelementptr inbounds nuw i8, ptr %6, i64 736
  %wide.load5.5 = load <8 x float>, ptr %26, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.5 = load <8 x float>, ptr %27, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.5 = load <8 x float>, ptr %28, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.5 = load <8 x float>, ptr %29, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %30 = getelementptr inbounds nuw i8, ptr %6, i64 768
  %31 = getelementptr inbounds nuw i8, ptr %6, i64 800
  %32 = getelementptr inbounds nuw i8, ptr %6, i64 832
  %33 = getelementptr inbounds nuw i8, ptr %6, i64 864
  %wide.load5.6 = load <8 x float>, ptr %30, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.6 = load <8 x float>, ptr %31, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.6 = load <8 x float>, ptr %32, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.6 = load <8 x float>, ptr %33, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %34 = getelementptr inbounds nuw i8, ptr %6, i64 896
  %35 = getelementptr inbounds nuw i8, ptr %6, i64 928
  %36 = getelementptr inbounds nuw i8, ptr %6, i64 960
  %37 = getelementptr inbounds nuw i8, ptr %6, i64 992
  %wide.load5.7 = load <8 x float>, ptr %34, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.7 = load <8 x float>, ptr %35, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.7 = load <8 x float>, ptr %36, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.7 = load <8 x float>, ptr %37, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  br label %.preheader

.preheader:                                       ; preds = %1, %.preheader
  %38 = phi i64 [ 0, %1 ], [ %167, %.preheader ]
  %.idx = shl i64 %38, 10
  %39 = getelementptr i8, ptr %4, i64 %.idx
  %40 = getelementptr i8, ptr %39, i64 32
  %41 = getelementptr i8, ptr %39, i64 64
  %42 = getelementptr i8, ptr %39, i64 96
  %wide.load = load <8 x float>, ptr %39, align 4, !alias.scope !6, !noalias !9
  %wide.load2 = load <8 x float>, ptr %40, align 4, !alias.scope !6, !noalias !9
  %wide.load3 = load <8 x float>, ptr %41, align 4, !alias.scope !6, !noalias !9
  %wide.load4 = load <8 x float>, ptr %42, align 4, !alias.scope !6, !noalias !9
  %43 = fadd <8 x float> %wide.load, %wide.load5
  %44 = fadd <8 x float> %wide.load2, %wide.load6
  %45 = fadd <8 x float> %wide.load3, %wide.load7
  %46 = fadd <8 x float> %wide.load4, %wide.load8
  %47 = fcmp olt <8 x float> %43, zeroinitializer
  %48 = fcmp olt <8 x float> %44, zeroinitializer
  %49 = fcmp olt <8 x float> %45, zeroinitializer
  %50 = fcmp olt <8 x float> %46, zeroinitializer
  %51 = select <8 x i1> %47, <8 x float> zeroinitializer, <8 x float> %43
  %52 = select <8 x i1> %48, <8 x float> zeroinitializer, <8 x float> %44
  %53 = select <8 x i1> %49, <8 x float> zeroinitializer, <8 x float> %45
  %54 = select <8 x i1> %50, <8 x float> zeroinitializer, <8 x float> %46
  store <8 x float> %51, ptr %39, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %52, ptr %40, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %53, ptr %41, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %54, ptr %42, align 4, !alias.scope !6, !noalias !9
  %55 = getelementptr i8, ptr %39, i64 128
  %56 = getelementptr i8, ptr %39, i64 160
  %57 = getelementptr i8, ptr %39, i64 192
  %58 = getelementptr i8, ptr %39, i64 224
  %wide.load.1 = load <8 x float>, ptr %55, align 4, !alias.scope !6, !noalias !9
  %wide.load2.1 = load <8 x float>, ptr %56, align 4, !alias.scope !6, !noalias !9
  %wide.load3.1 = load <8 x float>, ptr %57, align 4, !alias.scope !6, !noalias !9
  %wide.load4.1 = load <8 x float>, ptr %58, align 4, !alias.scope !6, !noalias !9
  %59 = fadd <8 x float> %wide.load.1, %wide.load5.1
  %60 = fadd <8 x float> %wide.load2.1, %wide.load6.1
  %61 = fadd <8 x float> %wide.load3.1, %wide.load7.1
  %62 = fadd <8 x float> %wide.load4.1, %wide.load8.1
  %63 = fcmp olt <8 x float> %59, zeroinitializer
  %64 = fcmp olt <8 x float> %60, zeroinitializer
  %65 = fcmp olt <8 x float> %61, zeroinitializer
  %66 = fcmp olt <8 x float> %62, zeroinitializer
  %67 = select <8 x i1> %63, <8 x float> zeroinitializer, <8 x float> %59
  %68 = select <8 x i1> %64, <8 x float> zeroinitializer, <8 x float> %60
  %69 = select <8 x i1> %65, <8 x float> zeroinitializer, <8 x float> %61
  %70 = select <8 x i1> %66, <8 x float> zeroinitializer, <8 x float> %62
  store <8 x float> %67, ptr %55, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %68, ptr %56, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %69, ptr %57, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %70, ptr %58, align 4, !alias.scope !6, !noalias !9
  %71 = getelementptr i8, ptr %39, i64 256
  %72 = getelementptr i8, ptr %39, i64 288
  %73 = getelementptr i8, ptr %39, i64 320
  %74 = getelementptr i8, ptr %39, i64 352
  %wide.load.2 = load <8 x float>, ptr %71, align 4, !alias.scope !6, !noalias !9
  %wide.load2.2 = load <8 x float>, ptr %72, align 4, !alias.scope !6, !noalias !9
  %wide.load3.2 = load <8 x float>, ptr %73, align 4, !alias.scope !6, !noalias !9
  %wide.load4.2 = load <8 x float>, ptr %74, align 4, !alias.scope !6, !noalias !9
  %75 = fadd <8 x float> %wide.load.2, %wide.load5.2
  %76 = fadd <8 x float> %wide.load2.2, %wide.load6.2
  %77 = fadd <8 x float> %wide.load3.2, %wide.load7.2
  %78 = fadd <8 x float> %wide.load4.2, %wide.load8.2
  %79 = fcmp olt <8 x float> %75, zeroinitializer
  %80 = fcmp olt <8 x float> %76, zeroinitializer
  %81 = fcmp olt <8 x float> %77, zeroinitializer
  %82 = fcmp olt <8 x float> %78, zeroinitializer
  %83 = select <8 x i1> %79, <8 x float> zeroinitializer, <8 x float> %75
  %84 = select <8 x i1> %80, <8 x float> zeroinitializer, <8 x float> %76
  %85 = select <8 x i1> %81, <8 x float> zeroinitializer, <8 x float> %77
  %86 = select <8 x i1> %82, <8 x float> zeroinitializer, <8 x float> %78
  store <8 x float> %83, ptr %71, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %84, ptr %72, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %85, ptr %73, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %86, ptr %74, align 4, !alias.scope !6, !noalias !9
  %87 = getelementptr i8, ptr %39, i64 384
  %88 = getelementptr i8, ptr %39, i64 416
  %89 = getelementptr i8, ptr %39, i64 448
  %90 = getelementptr i8, ptr %39, i64 480
  %wide.load.3 = load <8 x float>, ptr %87, align 4, !alias.scope !6, !noalias !9
  %wide.load2.3 = load <8 x float>, ptr %88, align 4, !alias.scope !6, !noalias !9
  %wide.load3.3 = load <8 x float>, ptr %89, align 4, !alias.scope !6, !noalias !9
  %wide.load4.3 = load <8 x float>, ptr %90, align 4, !alias.scope !6, !noalias !9
  %91 = fadd <8 x float> %wide.load.3, %wide.load5.3
  %92 = fadd <8 x float> %wide.load2.3, %wide.load6.3
  %93 = fadd <8 x float> %wide.load3.3, %wide.load7.3
  %94 = fadd <8 x float> %wide.load4.3, %wide.load8.3
  %95 = fcmp olt <8 x float> %91, zeroinitializer
  %96 = fcmp olt <8 x float> %92, zeroinitializer
  %97 = fcmp olt <8 x float> %93, zeroinitializer
  %98 = fcmp olt <8 x float> %94, zeroinitializer
  %99 = select <8 x i1> %95, <8 x float> zeroinitializer, <8 x float> %91
  %100 = select <8 x i1> %96, <8 x float> zeroinitializer, <8 x float> %92
  %101 = select <8 x i1> %97, <8 x float> zeroinitializer, <8 x float> %93
  %102 = select <8 x i1> %98, <8 x float> zeroinitializer, <8 x float> %94
  store <8 x float> %99, ptr %87, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %100, ptr %88, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %101, ptr %89, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %102, ptr %90, align 4, !alias.scope !6, !noalias !9
  %103 = getelementptr i8, ptr %39, i64 512
  %104 = getelementptr i8, ptr %39, i64 544
  %105 = getelementptr i8, ptr %39, i64 576
  %106 = getelementptr i8, ptr %39, i64 608
  %wide.load.4 = load <8 x float>, ptr %103, align 4, !alias.scope !6, !noalias !9
  %wide.load2.4 = load <8 x float>, ptr %104, align 4, !alias.scope !6, !noalias !9
  %wide.load3.4 = load <8 x float>, ptr %105, align 4, !alias.scope !6, !noalias !9
  %wide.load4.4 = load <8 x float>, ptr %106, align 4, !alias.scope !6, !noalias !9
  %107 = fadd <8 x float> %wide.load.4, %wide.load5.4
  %108 = fadd <8 x float> %wide.load2.4, %wide.load6.4
  %109 = fadd <8 x float> %wide.load3.4, %wide.load7.4
  %110 = fadd <8 x float> %wide.load4.4, %wide.load8.4
  %111 = fcmp olt <8 x float> %107, zeroinitializer
  %112 = fcmp olt <8 x float> %108, zeroinitializer
  %113 = fcmp olt <8 x float> %109, zeroinitializer
  %114 = fcmp olt <8 x float> %110, zeroinitializer
  %115 = select <8 x i1> %111, <8 x float> zeroinitializer, <8 x float> %107
  %116 = select <8 x i1> %112, <8 x float> zeroinitializer, <8 x float> %108
  %117 = select <8 x i1> %113, <8 x float> zeroinitializer, <8 x float> %109
  %118 = select <8 x i1> %114, <8 x float> zeroinitializer, <8 x float> %110
  store <8 x float> %115, ptr %103, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %116, ptr %104, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %117, ptr %105, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %118, ptr %106, align 4, !alias.scope !6, !noalias !9
  %119 = getelementptr i8, ptr %39, i64 640
  %120 = getelementptr i8, ptr %39, i64 672
  %121 = getelementptr i8, ptr %39, i64 704
  %122 = getelementptr i8, ptr %39, i64 736
  %wide.load.5 = load <8 x float>, ptr %119, align 4, !alias.scope !6, !noalias !9
  %wide.load2.5 = load <8 x float>, ptr %120, align 4, !alias.scope !6, !noalias !9
  %wide.load3.5 = load <8 x float>, ptr %121, align 4, !alias.scope !6, !noalias !9
  %wide.load4.5 = load <8 x float>, ptr %122, align 4, !alias.scope !6, !noalias !9
  %123 = fadd <8 x float> %wide.load.5, %wide.load5.5
  %124 = fadd <8 x float> %wide.load2.5, %wide.load6.5
  %125 = fadd <8 x float> %wide.load3.5, %wide.load7.5
  %126 = fadd <8 x float> %wide.load4.5, %wide.load8.5
  %127 = fcmp olt <8 x float> %123, zeroinitializer
  %128 = fcmp olt <8 x float> %124, zeroinitializer
  %129 = fcmp olt <8 x float> %125, zeroinitializer
  %130 = fcmp olt <8 x float> %126, zeroinitializer
  %131 = select <8 x i1> %127, <8 x float> zeroinitializer, <8 x float> %123
  %132 = select <8 x i1> %128, <8 x float> zeroinitializer, <8 x float> %124
  %133 = select <8 x i1> %129, <8 x float> zeroinitializer, <8 x float> %125
  %134 = select <8 x i1> %130, <8 x float> zeroinitializer, <8 x float> %126
  store <8 x float> %131, ptr %119, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %132, ptr %120, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %133, ptr %121, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %134, ptr %122, align 4, !alias.scope !6, !noalias !9
  %135 = getelementptr i8, ptr %39, i64 768
  %136 = getelementptr i8, ptr %39, i64 800
  %137 = getelementptr i8, ptr %39, i64 832
  %138 = getelementptr i8, ptr %39, i64 864
  %wide.load.6 = load <8 x float>, ptr %135, align 4, !alias.scope !6, !noalias !9
  %wide.load2.6 = load <8 x float>, ptr %136, align 4, !alias.scope !6, !noalias !9
  %wide.load3.6 = load <8 x float>, ptr %137, align 4, !alias.scope !6, !noalias !9
  %wide.load4.6 = load <8 x float>, ptr %138, align 4, !alias.scope !6, !noalias !9
  %139 = fadd <8 x float> %wide.load.6, %wide.load5.6
  %140 = fadd <8 x float> %wide.load2.6, %wide.load6.6
  %141 = fadd <8 x float> %wide.load3.6, %wide.load7.6
  %142 = fadd <8 x float> %wide.load4.6, %wide.load8.6
  %143 = fcmp olt <8 x float> %139, zeroinitializer
  %144 = fcmp olt <8 x float> %140, zeroinitializer
  %145 = fcmp olt <8 x float> %141, zeroinitializer
  %146 = fcmp olt <8 x float> %142, zeroinitializer
  %147 = select <8 x i1> %143, <8 x float> zeroinitializer, <8 x float> %139
  %148 = select <8 x i1> %144, <8 x float> zeroinitializer, <8 x float> %140
  %149 = select <8 x i1> %145, <8 x float> zeroinitializer, <8 x float> %141
  %150 = select <8 x i1> %146, <8 x float> zeroinitializer, <8 x float> %142
  store <8 x float> %147, ptr %135, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %148, ptr %136, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %149, ptr %137, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %150, ptr %138, align 4, !alias.scope !6, !noalias !9
  %151 = getelementptr i8, ptr %39, i64 896
  %152 = getelementptr i8, ptr %39, i64 928
  %153 = getelementptr i8, ptr %39, i64 960
  %154 = getelementptr i8, ptr %39, i64 992
  %wide.load.7 = load <8 x float>, ptr %151, align 4, !alias.scope !6, !noalias !9
  %wide.load2.7 = load <8 x float>, ptr %152, align 4, !alias.scope !6, !noalias !9
  %wide.load3.7 = load <8 x float>, ptr %153, align 4, !alias.scope !6, !noalias !9
  %wide.load4.7 = load <8 x float>, ptr %154, align 4, !alias.scope !6, !noalias !9
  %155 = fadd <8 x float> %wide.load.7, %wide.load5.7
  %156 = fadd <8 x float> %wide.load2.7, %wide.load6.7
  %157 = fadd <8 x float> %wide.load3.7, %wide.load7.7
  %158 = fadd <8 x float> %wide.load4.7, %wide.load8.7
  %159 = fcmp olt <8 x float> %155, zeroinitializer
  %160 = fcmp olt <8 x float> %156, zeroinitializer
  %161 = fcmp olt <8 x float> %157, zeroinitializer
  %162 = fcmp olt <8 x float> %158, zeroinitializer
  %163 = select <8 x i1> %159, <8 x float> zeroinitializer, <8 x float> %155
  %164 = select <8 x i1> %160, <8 x float> zeroinitializer, <8 x float> %156
  %165 = select <8 x i1> %161, <8 x float> zeroinitializer, <8 x float> %157
  %166 = select <8 x i1> %162, <8 x float> zeroinitializer, <8 x float> %158
  store <8 x float> %163, ptr %151, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %164, ptr %152, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %165, ptr %153, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %166, ptr %154, align 4, !alias.scope !6, !noalias !9
  %167 = add nuw nsw i64 %38, 1
  %exitcond1.not = icmp eq i64 %167, 64
  br i1 %exitcond1.not, label %broadcast_maximum_fusion_wrapped.exit, label %.preheader, !llvm.loop !11

broadcast_maximum_fusion_wrapped.exit:            ; preds = %.preheader
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 1}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 65536}
!5 = !{i64 1024}
!6 = !{!7}
!7 = distinct !{!7, !8, !"broadcast_maximum_fusion_wrapped: argument 0"}
!8 = distinct !{!8, !"broadcast_maximum_fusion_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"broadcast_maximum_fusion_wrapped: argument 1"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
