; ModuleID = '__compute_module_part_04'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fma.f32(float, float, float) #0

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.copysign.f32(float, float) #0

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @multiply_erf_fusion(ptr readonly captures(none) %0) local_unnamed_addr #1 {
return:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg0 = load ptr, ptr %args, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg1_gep = getelementptr i8, ptr %args, i64 16
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %1 = load i32, ptr %arg0, align 64, !invariant.load !1, !noalias !4
  %2 = sitofp i32 %1 to float
  %multiply.22 = fmul float %2, 0x3FE6A09E60000000
  %3 = tail call float @llvm.fabs.f32(float %multiply.22)
  %4 = fcmp oge float %3, 0x400EA8F960000000
  %5 = fmul float %multiply.22, %multiply.22
  %6 = tail call float @llvm.fma.f32(float %5, float 0x3F2E05AA20000000, float 0x3F6BEBB440000000)
  %7 = tail call float @llvm.fma.f32(float %5, float %6, float 0x3FAA16DD60000000)
  %8 = tail call float @llvm.fma.f32(float %5, float %7, float 0x3FC7B4E800000000)
  %9 = tail call float @llvm.fma.f32(float %5, float %8, float 0x3FF20DD740000000)
  %10 = fmul float %multiply.22, %9
  %11 = tail call float @llvm.fma.f32(float %5, float 0xBE7FA720C0000000, float 0x3EF8B11BE0000000)
  %12 = tail call float @llvm.fma.f32(float %5, float %11, float 0x3F50ADA500000000)
  %13 = tail call float @llvm.fma.f32(float %5, float %12, float 0x3F8CD0FA80000000)
  %14 = tail call float @llvm.fma.f32(float %5, float %13, float 0x3FBC698420000000)
  %15 = tail call float @llvm.fma.f32(float %5, float %14, float 0x3FDFD68940000000)
  %16 = tail call float @llvm.fma.f32(float %5, float %15, float 1.000000e+00)
  %17 = tail call float @llvm.copysign.f32(float 1.000000e+00, float %multiply.22)
  %18 = fdiv float %10, %16
  %19 = select i1 %4, float %17, float %18
  store float %19, ptr %arg1, align 64, !alias.scope !4
  ret ptr null
}

attributes #0 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 4}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{!5}
!5 = !{!"result slice: {index:9, offset:393536, size:4}", !6}
!6 = !{!"XLA host kernel multiply_erf_fusion AA domain"}
