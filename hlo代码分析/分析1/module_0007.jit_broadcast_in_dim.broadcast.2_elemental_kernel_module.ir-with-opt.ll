; ModuleID = '__compute_module_broadcast.2_elemental_kernel_module'
source_filename = "__compute_module_broadcast.2_elemental_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @broadcast.2_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
broadcast.2.loop_body.dim.0:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %1 = load float, ptr %arg0, align 64, !invariant.load !1, !noalias !5
  store float %1, ptr %arg1, align 64, !alias.scope !5
  %2 = getelementptr inbounds nuw i8, ptr %arg1, i64 4
  store float %1, ptr %2, align 4, !alias.scope !5
  %3 = getelementptr inbounds nuw i8, ptr %arg1, i64 8
  store float %1, ptr %3, align 8, !alias.scope !5
  %4 = getelementptr inbounds nuw i8, ptr %arg1, i64 12
  store float %1, ptr %4, align 4, !alias.scope !5
  %5 = getelementptr inbounds nuw i8, ptr %arg1, i64 16
  store float %1, ptr %5, align 16, !alias.scope !5
  %6 = getelementptr inbounds nuw i8, ptr %arg1, i64 20
  store float %1, ptr %6, align 4, !alias.scope !5
  %7 = getelementptr inbounds nuw i8, ptr %arg1, i64 24
  store float %1, ptr %7, align 8, !alias.scope !5
  %8 = getelementptr inbounds nuw i8, ptr %arg1, i64 28
  store float %1, ptr %8, align 4, !alias.scope !5
  %9 = getelementptr inbounds nuw i8, ptr %arg1, i64 32
  store float %1, ptr %9, align 32, !alias.scope !5
  %10 = getelementptr inbounds nuw i8, ptr %arg1, i64 36
  store float %1, ptr %10, align 4, !alias.scope !5
  %11 = getelementptr inbounds nuw i8, ptr %arg1, i64 40
  store float %1, ptr %11, align 8, !alias.scope !5
  %12 = getelementptr inbounds nuw i8, ptr %arg1, i64 44
  store float %1, ptr %12, align 4, !alias.scope !5
  %13 = getelementptr inbounds nuw i8, ptr %arg1, i64 48
  store float %1, ptr %13, align 16, !alias.scope !5
  %14 = getelementptr inbounds nuw i8, ptr %arg1, i64 52
  store float %1, ptr %14, align 4, !alias.scope !5
  %15 = getelementptr inbounds nuw i8, ptr %arg1, i64 56
  store float %1, ptr %15, align 8, !alias.scope !5
  %16 = getelementptr inbounds nuw i8, ptr %arg1, i64 60
  store float %1, ptr %16, align 4, !alias.scope !5
  %17 = getelementptr inbounds nuw i8, ptr %arg1, i64 64
  store float %1, ptr %17, align 64, !alias.scope !5
  %18 = getelementptr inbounds nuw i8, ptr %arg1, i64 68
  store float %1, ptr %18, align 4, !alias.scope !5
  %19 = getelementptr inbounds nuw i8, ptr %arg1, i64 72
  store float %1, ptr %19, align 8, !alias.scope !5
  %20 = getelementptr inbounds nuw i8, ptr %arg1, i64 76
  store float %1, ptr %20, align 4, !alias.scope !5
  %21 = getelementptr inbounds nuw i8, ptr %arg1, i64 80
  store float %1, ptr %21, align 16, !alias.scope !5
  %22 = getelementptr inbounds nuw i8, ptr %arg1, i64 84
  store float %1, ptr %22, align 4, !alias.scope !5
  %23 = getelementptr inbounds nuw i8, ptr %arg1, i64 88
  store float %1, ptr %23, align 8, !alias.scope !5
  %24 = getelementptr inbounds nuw i8, ptr %arg1, i64 92
  store float %1, ptr %24, align 4, !alias.scope !5
  %25 = getelementptr inbounds nuw i8, ptr %arg1, i64 96
  store float %1, ptr %25, align 32, !alias.scope !5
  %26 = getelementptr inbounds nuw i8, ptr %arg1, i64 100
  store float %1, ptr %26, align 4, !alias.scope !5
  %27 = getelementptr inbounds nuw i8, ptr %arg1, i64 104
  store float %1, ptr %27, align 8, !alias.scope !5
  %28 = getelementptr inbounds nuw i8, ptr %arg1, i64 108
  store float %1, ptr %28, align 4, !alias.scope !5
  %29 = getelementptr inbounds nuw i8, ptr %arg1, i64 112
  store float %1, ptr %29, align 16, !alias.scope !5
  %30 = getelementptr inbounds nuw i8, ptr %arg1, i64 116
  store float %1, ptr %30, align 4, !alias.scope !5
  %31 = getelementptr inbounds nuw i8, ptr %arg1, i64 120
  store float %1, ptr %31, align 8, !alias.scope !5
  %32 = getelementptr inbounds nuw i8, ptr %arg1, i64 124
  store float %1, ptr %32, align 4, !alias.scope !5
  %33 = getelementptr inbounds nuw i8, ptr %arg1, i64 128
  store float %1, ptr %33, align 64, !alias.scope !5
  %34 = getelementptr inbounds nuw i8, ptr %arg1, i64 132
  store float %1, ptr %34, align 4, !alias.scope !5
  %35 = getelementptr inbounds nuw i8, ptr %arg1, i64 136
  store float %1, ptr %35, align 8, !alias.scope !5
  %36 = getelementptr inbounds nuw i8, ptr %arg1, i64 140
  store float %1, ptr %36, align 4, !alias.scope !5
  %37 = getelementptr inbounds nuw i8, ptr %arg1, i64 144
  store float %1, ptr %37, align 16, !alias.scope !5
  %38 = getelementptr inbounds nuw i8, ptr %arg1, i64 148
  store float %1, ptr %38, align 4, !alias.scope !5
  %39 = getelementptr inbounds nuw i8, ptr %arg1, i64 152
  store float %1, ptr %39, align 8, !alias.scope !5
  %40 = getelementptr inbounds nuw i8, ptr %arg1, i64 156
  store float %1, ptr %40, align 4, !alias.scope !5
  %41 = getelementptr inbounds nuw i8, ptr %arg1, i64 160
  store float %1, ptr %41, align 32, !alias.scope !5
  %42 = getelementptr inbounds nuw i8, ptr %arg1, i64 164
  store float %1, ptr %42, align 4, !alias.scope !5
  %43 = getelementptr inbounds nuw i8, ptr %arg1, i64 168
  store float %1, ptr %43, align 8, !alias.scope !5
  %44 = getelementptr inbounds nuw i8, ptr %arg1, i64 172
  store float %1, ptr %44, align 4, !alias.scope !5
  %45 = getelementptr inbounds nuw i8, ptr %arg1, i64 176
  store float %1, ptr %45, align 16, !alias.scope !5
  %46 = getelementptr inbounds nuw i8, ptr %arg1, i64 180
  store float %1, ptr %46, align 4, !alias.scope !5
  %47 = getelementptr inbounds nuw i8, ptr %arg1, i64 184
  store float %1, ptr %47, align 8, !alias.scope !5
  %48 = getelementptr inbounds nuw i8, ptr %arg1, i64 188
  store float %1, ptr %48, align 4, !alias.scope !5
  %49 = getelementptr inbounds nuw i8, ptr %arg1, i64 192
  store float %1, ptr %49, align 64, !alias.scope !5
  %50 = getelementptr inbounds nuw i8, ptr %arg1, i64 196
  store float %1, ptr %50, align 4, !alias.scope !5
  %51 = getelementptr inbounds nuw i8, ptr %arg1, i64 200
  store float %1, ptr %51, align 8, !alias.scope !5
  %52 = getelementptr inbounds nuw i8, ptr %arg1, i64 204
  store float %1, ptr %52, align 4, !alias.scope !5
  %53 = getelementptr inbounds nuw i8, ptr %arg1, i64 208
  store float %1, ptr %53, align 16, !alias.scope !5
  %54 = getelementptr inbounds nuw i8, ptr %arg1, i64 212
  store float %1, ptr %54, align 4, !alias.scope !5
  %55 = getelementptr inbounds nuw i8, ptr %arg1, i64 216
  store float %1, ptr %55, align 8, !alias.scope !5
  %56 = getelementptr inbounds nuw i8, ptr %arg1, i64 220
  store float %1, ptr %56, align 4, !alias.scope !5
  %57 = getelementptr inbounds nuw i8, ptr %arg1, i64 224
  store float %1, ptr %57, align 32, !alias.scope !5
  %58 = getelementptr inbounds nuw i8, ptr %arg1, i64 228
  store float %1, ptr %58, align 4, !alias.scope !5
  %59 = getelementptr inbounds nuw i8, ptr %arg1, i64 232
  store float %1, ptr %59, align 8, !alias.scope !5
  %60 = getelementptr inbounds nuw i8, ptr %arg1, i64 236
  store float %1, ptr %60, align 4, !alias.scope !5
  %61 = getelementptr inbounds nuw i8, ptr %arg1, i64 240
  store float %1, ptr %61, align 16, !alias.scope !5
  %62 = getelementptr inbounds nuw i8, ptr %arg1, i64 244
  store float %1, ptr %62, align 4, !alias.scope !5
  %63 = getelementptr inbounds nuw i8, ptr %arg1, i64 248
  store float %1, ptr %63, align 8, !alias.scope !5
  %64 = getelementptr inbounds nuw i8, ptr %arg1, i64 252
  store float %1, ptr %64, align 4, !alias.scope !5
  ret ptr null
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 256}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:256}", !7}
!7 = !{!"XLA host kernel broadcast.2_kernel AA domain"}
