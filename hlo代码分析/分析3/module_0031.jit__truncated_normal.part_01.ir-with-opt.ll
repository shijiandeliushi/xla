; ModuleID = '__compute_module_part_01'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@broadcast_add_fusion.2.clone_parallel_bounds = private unnamed_addr constant [2 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 256]], [1 x [2 x i64]] [[2 x i64] [i64 256, i64 512]]]

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast_add_fusion.2.clone(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %workgroup_id_gep = getelementptr inbounds nuw i8, ptr %0, i64 8
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x = load i64, ptr %workgroup_id, align 4
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %lo_dim_0_gep = getelementptr inbounds [2 x [1 x [2 x i64]]], ptr @broadcast_add_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 0
  %up_dim_0_gep = getelementptr inbounds [2 x [1 x [2 x i64]]], ptr @broadcast_add_fusion.2.clone_parallel_bounds, i64 0, i64 %workgroup_id_x, i64 0, i64 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 16
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 8
  %.not2 = icmp ult i64 %lo_dim_0, %up_dim_0
  br i1 %.not2, label %broadcast_add_fusion.2.clone.loop_header.dim.1.preheader.lr.ph, label %return

broadcast_add_fusion.2.clone.loop_header.dim.1.preheader.lr.ph: ; preds = %1
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %2 = getelementptr inbounds nuw i8, ptr %arg0, i64 4
  %3 = load i32, ptr %2, align 4, !invariant.load !1, !noalias !5
  %broadcast.splatinsert5 = insertelement <8 x i32> poison, i32 %3, i64 0
  %broadcast.splat6 = shufflevector <8 x i32> %broadcast.splatinsert5, <8 x i32> poison, <8 x i32> zeroinitializer
  br label %vector.ph

vector.ph:                                        ; preds = %vector.ph, %broadcast_add_fusion.2.clone.loop_header.dim.1.preheader.lr.ph
  %broadcast_add_fusion.2.clone.invar_address.dim.0.03 = phi i64 [ %lo_dim_0, %broadcast_add_fusion.2.clone.loop_header.dim.1.preheader.lr.ph ], [ %invar.inc, %vector.ph ]
  %4 = shl i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, 8
  %broadcast.splatinsert = insertelement <8 x i64> poison, i64 %4, i64 0
  %broadcast.splat = shufflevector <8 x i64> %broadcast.splatinsert, <8 x i64> poison, <8 x i32> zeroinitializer
  %5 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %6 = or disjoint <8 x i32> %5, <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %7 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %8 = or disjoint <8 x i32> %7, <i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 15>
  %9 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %10 = or disjoint <8 x i32> %9, <i32 16, i32 17, i32 18, i32 19, i32 20, i32 21, i32 22, i32 23>
  %11 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %12 = or disjoint <8 x i32> %11, <i32 24, i32 25, i32 26, i32 27, i32 28, i32 29, i32 30, i32 31>
  %13 = add <8 x i32> %broadcast.splat6, %6
  %14 = add <8 x i32> %broadcast.splat6, %8
  %15 = add <8 x i32> %broadcast.splat6, %10
  %16 = add <8 x i32> %broadcast.splat6, %12
  %17 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 0
  %18 = getelementptr inbounds nuw i8, ptr %17, i64 32
  %19 = getelementptr inbounds nuw i8, ptr %17, i64 64
  %20 = getelementptr inbounds nuw i8, ptr %17, i64 96
  store <8 x i32> %13, ptr %17, align 64, !alias.scope !5
  store <8 x i32> %14, ptr %18, align 32, !alias.scope !5
  store <8 x i32> %15, ptr %19, align 64, !alias.scope !5
  store <8 x i32> %16, ptr %20, align 32, !alias.scope !5
  %21 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %22 = or disjoint <8 x i32> %21, <i32 32, i32 33, i32 34, i32 35, i32 36, i32 37, i32 38, i32 39>
  %23 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %24 = or disjoint <8 x i32> %23, <i32 40, i32 41, i32 42, i32 43, i32 44, i32 45, i32 46, i32 47>
  %25 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %26 = or disjoint <8 x i32> %25, <i32 48, i32 49, i32 50, i32 51, i32 52, i32 53, i32 54, i32 55>
  %27 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %28 = or disjoint <8 x i32> %27, <i32 56, i32 57, i32 58, i32 59, i32 60, i32 61, i32 62, i32 63>
  %29 = add <8 x i32> %broadcast.splat6, %22
  %30 = add <8 x i32> %broadcast.splat6, %24
  %31 = add <8 x i32> %broadcast.splat6, %26
  %32 = add <8 x i32> %broadcast.splat6, %28
  %33 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 32
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %33, i64 96
  store <8 x i32> %29, ptr %33, align 64, !alias.scope !5
  store <8 x i32> %30, ptr %34, align 32, !alias.scope !5
  store <8 x i32> %31, ptr %35, align 64, !alias.scope !5
  store <8 x i32> %32, ptr %36, align 32, !alias.scope !5
  %37 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %38 = or disjoint <8 x i32> %37, <i32 64, i32 65, i32 66, i32 67, i32 68, i32 69, i32 70, i32 71>
  %39 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %40 = or disjoint <8 x i32> %39, <i32 72, i32 73, i32 74, i32 75, i32 76, i32 77, i32 78, i32 79>
  %41 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %42 = or disjoint <8 x i32> %41, <i32 80, i32 81, i32 82, i32 83, i32 84, i32 85, i32 86, i32 87>
  %43 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %44 = or disjoint <8 x i32> %43, <i32 88, i32 89, i32 90, i32 91, i32 92, i32 93, i32 94, i32 95>
  %45 = add <8 x i32> %broadcast.splat6, %38
  %46 = add <8 x i32> %broadcast.splat6, %40
  %47 = add <8 x i32> %broadcast.splat6, %42
  %48 = add <8 x i32> %broadcast.splat6, %44
  %49 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 64
  %50 = getelementptr inbounds nuw i8, ptr %49, i64 32
  %51 = getelementptr inbounds nuw i8, ptr %49, i64 64
  %52 = getelementptr inbounds nuw i8, ptr %49, i64 96
  store <8 x i32> %45, ptr %49, align 64, !alias.scope !5
  store <8 x i32> %46, ptr %50, align 32, !alias.scope !5
  store <8 x i32> %47, ptr %51, align 64, !alias.scope !5
  store <8 x i32> %48, ptr %52, align 32, !alias.scope !5
  %53 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %54 = or disjoint <8 x i32> %53, <i32 96, i32 97, i32 98, i32 99, i32 100, i32 101, i32 102, i32 103>
  %55 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %56 = or disjoint <8 x i32> %55, <i32 104, i32 105, i32 106, i32 107, i32 108, i32 109, i32 110, i32 111>
  %57 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %58 = or disjoint <8 x i32> %57, <i32 112, i32 113, i32 114, i32 115, i32 116, i32 117, i32 118, i32 119>
  %59 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %60 = or disjoint <8 x i32> %59, <i32 120, i32 121, i32 122, i32 123, i32 124, i32 125, i32 126, i32 127>
  %61 = add <8 x i32> %broadcast.splat6, %54
  %62 = add <8 x i32> %broadcast.splat6, %56
  %63 = add <8 x i32> %broadcast.splat6, %58
  %64 = add <8 x i32> %broadcast.splat6, %60
  %65 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 96
  %66 = getelementptr inbounds nuw i8, ptr %65, i64 32
  %67 = getelementptr inbounds nuw i8, ptr %65, i64 64
  %68 = getelementptr inbounds nuw i8, ptr %65, i64 96
  store <8 x i32> %61, ptr %65, align 64, !alias.scope !5
  store <8 x i32> %62, ptr %66, align 32, !alias.scope !5
  store <8 x i32> %63, ptr %67, align 64, !alias.scope !5
  store <8 x i32> %64, ptr %68, align 32, !alias.scope !5
  %69 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %70 = or disjoint <8 x i32> %69, <i32 128, i32 129, i32 130, i32 131, i32 132, i32 133, i32 134, i32 135>
  %71 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %72 = or disjoint <8 x i32> %71, <i32 136, i32 137, i32 138, i32 139, i32 140, i32 141, i32 142, i32 143>
  %73 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %74 = or disjoint <8 x i32> %73, <i32 144, i32 145, i32 146, i32 147, i32 148, i32 149, i32 150, i32 151>
  %75 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %76 = or disjoint <8 x i32> %75, <i32 152, i32 153, i32 154, i32 155, i32 156, i32 157, i32 158, i32 159>
  %77 = add <8 x i32> %broadcast.splat6, %70
  %78 = add <8 x i32> %broadcast.splat6, %72
  %79 = add <8 x i32> %broadcast.splat6, %74
  %80 = add <8 x i32> %broadcast.splat6, %76
  %81 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 128
  %82 = getelementptr inbounds nuw i8, ptr %81, i64 32
  %83 = getelementptr inbounds nuw i8, ptr %81, i64 64
  %84 = getelementptr inbounds nuw i8, ptr %81, i64 96
  store <8 x i32> %77, ptr %81, align 64, !alias.scope !5
  store <8 x i32> %78, ptr %82, align 32, !alias.scope !5
  store <8 x i32> %79, ptr %83, align 64, !alias.scope !5
  store <8 x i32> %80, ptr %84, align 32, !alias.scope !5
  %85 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %86 = or disjoint <8 x i32> %85, <i32 160, i32 161, i32 162, i32 163, i32 164, i32 165, i32 166, i32 167>
  %87 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %88 = or disjoint <8 x i32> %87, <i32 168, i32 169, i32 170, i32 171, i32 172, i32 173, i32 174, i32 175>
  %89 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %90 = or disjoint <8 x i32> %89, <i32 176, i32 177, i32 178, i32 179, i32 180, i32 181, i32 182, i32 183>
  %91 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %92 = or disjoint <8 x i32> %91, <i32 184, i32 185, i32 186, i32 187, i32 188, i32 189, i32 190, i32 191>
  %93 = add <8 x i32> %broadcast.splat6, %86
  %94 = add <8 x i32> %broadcast.splat6, %88
  %95 = add <8 x i32> %broadcast.splat6, %90
  %96 = add <8 x i32> %broadcast.splat6, %92
  %97 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 160
  %98 = getelementptr inbounds nuw i8, ptr %97, i64 32
  %99 = getelementptr inbounds nuw i8, ptr %97, i64 64
  %100 = getelementptr inbounds nuw i8, ptr %97, i64 96
  store <8 x i32> %93, ptr %97, align 64, !alias.scope !5
  store <8 x i32> %94, ptr %98, align 32, !alias.scope !5
  store <8 x i32> %95, ptr %99, align 64, !alias.scope !5
  store <8 x i32> %96, ptr %100, align 32, !alias.scope !5
  %101 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %102 = or disjoint <8 x i32> %101, <i32 192, i32 193, i32 194, i32 195, i32 196, i32 197, i32 198, i32 199>
  %103 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %104 = or disjoint <8 x i32> %103, <i32 200, i32 201, i32 202, i32 203, i32 204, i32 205, i32 206, i32 207>
  %105 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %106 = or disjoint <8 x i32> %105, <i32 208, i32 209, i32 210, i32 211, i32 212, i32 213, i32 214, i32 215>
  %107 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %108 = or disjoint <8 x i32> %107, <i32 216, i32 217, i32 218, i32 219, i32 220, i32 221, i32 222, i32 223>
  %109 = add <8 x i32> %broadcast.splat6, %102
  %110 = add <8 x i32> %broadcast.splat6, %104
  %111 = add <8 x i32> %broadcast.splat6, %106
  %112 = add <8 x i32> %broadcast.splat6, %108
  %113 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 192
  %114 = getelementptr inbounds nuw i8, ptr %113, i64 32
  %115 = getelementptr inbounds nuw i8, ptr %113, i64 64
  %116 = getelementptr inbounds nuw i8, ptr %113, i64 96
  store <8 x i32> %109, ptr %113, align 64, !alias.scope !5
  store <8 x i32> %110, ptr %114, align 32, !alias.scope !5
  store <8 x i32> %111, ptr %115, align 64, !alias.scope !5
  store <8 x i32> %112, ptr %116, align 32, !alias.scope !5
  %117 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %118 = or disjoint <8 x i32> %117, <i32 224, i32 225, i32 226, i32 227, i32 228, i32 229, i32 230, i32 231>
  %119 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %120 = or disjoint <8 x i32> %119, <i32 232, i32 233, i32 234, i32 235, i32 236, i32 237, i32 238, i32 239>
  %121 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %122 = or disjoint <8 x i32> %121, <i32 240, i32 241, i32 242, i32 243, i32 244, i32 245, i32 246, i32 247>
  %123 = trunc <8 x i64> %broadcast.splat to <8 x i32>
  %124 = or disjoint <8 x i32> %123, <i32 248, i32 249, i32 250, i32 251, i32 252, i32 253, i32 254, i32 255>
  %125 = add <8 x i32> %broadcast.splat6, %118
  %126 = add <8 x i32> %broadcast.splat6, %120
  %127 = add <8 x i32> %broadcast.splat6, %122
  %128 = add <8 x i32> %broadcast.splat6, %124
  %129 = getelementptr inbounds [512 x [256 x i32]], ptr %arg1, i64 0, i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, i64 224
  %130 = getelementptr inbounds nuw i8, ptr %129, i64 32
  %131 = getelementptr inbounds nuw i8, ptr %129, i64 64
  %132 = getelementptr inbounds nuw i8, ptr %129, i64 96
  store <8 x i32> %125, ptr %129, align 64, !alias.scope !5
  store <8 x i32> %126, ptr %130, align 32, !alias.scope !5
  store <8 x i32> %127, ptr %131, align 64, !alias.scope !5
  store <8 x i32> %128, ptr %132, align 32, !alias.scope !5
  %invar.inc = add nuw nsw i64 %broadcast_add_fusion.2.clone.invar_address.dim.0.03, 1
  %exitcond4.not = icmp eq i64 %invar.inc, %up_dim_0
  br i1 %exitcond4.not, label %return, label %vector.ph, !llvm.loop !8

return:                                           ; preds = %vector.ph, %1
  ret ptr null
}

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 1}
!1 = !{}
!2 = !{i64 524288}
!3 = !{i64 64}
!4 = !{i64 8}
!5 = !{!6}
!6 = !{!"result slice: {index:9, offset:64, size:524288}", !7}
!7 = !{!"XLA host kernel broadcast_add_fusion.2.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
