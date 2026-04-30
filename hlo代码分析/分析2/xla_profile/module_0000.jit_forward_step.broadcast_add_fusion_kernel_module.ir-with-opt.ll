; ModuleID = '__compute_module_broadcast_add_fusion_kernel_module'
source_filename = "__compute_module_broadcast_add_fusion_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind uwtable
define noalias noundef ptr @broadcast_add_fusion(ptr readonly captures(none) %0) local_unnamed_addr #0 {
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
  br label %.preheader

.preheader:                                       ; preds = %1, %.preheader
  %22 = phi i64 [ 0, %1 ], [ %55, %.preheader ]
  %.idx = shl i64 %22, 9
  %23 = getelementptr i8, ptr %4, i64 %.idx
  %24 = getelementptr i8, ptr %23, i64 32
  %25 = getelementptr i8, ptr %23, i64 64
  %26 = getelementptr i8, ptr %23, i64 96
  %wide.load = load <8 x float>, ptr %23, align 4, !alias.scope !6, !noalias !9
  %wide.load2 = load <8 x float>, ptr %24, align 4, !alias.scope !6, !noalias !9
  %wide.load3 = load <8 x float>, ptr %25, align 4, !alias.scope !6, !noalias !9
  %wide.load4 = load <8 x float>, ptr %26, align 4, !alias.scope !6, !noalias !9
  %27 = fadd <8 x float> %wide.load, %wide.load5
  %28 = fadd <8 x float> %wide.load2, %wide.load6
  %29 = fadd <8 x float> %wide.load3, %wide.load7
  %30 = fadd <8 x float> %wide.load4, %wide.load8
  store <8 x float> %27, ptr %23, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %28, ptr %24, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %29, ptr %25, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %30, ptr %26, align 4, !alias.scope !6, !noalias !9
  %31 = getelementptr i8, ptr %23, i64 128
  %32 = getelementptr i8, ptr %23, i64 160
  %33 = getelementptr i8, ptr %23, i64 192
  %34 = getelementptr i8, ptr %23, i64 224
  %wide.load.1 = load <8 x float>, ptr %31, align 4, !alias.scope !6, !noalias !9
  %wide.load2.1 = load <8 x float>, ptr %32, align 4, !alias.scope !6, !noalias !9
  %wide.load3.1 = load <8 x float>, ptr %33, align 4, !alias.scope !6, !noalias !9
  %wide.load4.1 = load <8 x float>, ptr %34, align 4, !alias.scope !6, !noalias !9
  %35 = fadd <8 x float> %wide.load.1, %wide.load5.1
  %36 = fadd <8 x float> %wide.load2.1, %wide.load6.1
  %37 = fadd <8 x float> %wide.load3.1, %wide.load7.1
  %38 = fadd <8 x float> %wide.load4.1, %wide.load8.1
  store <8 x float> %35, ptr %31, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %36, ptr %32, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %37, ptr %33, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %38, ptr %34, align 4, !alias.scope !6, !noalias !9
  %39 = getelementptr i8, ptr %23, i64 256
  %40 = getelementptr i8, ptr %23, i64 288
  %41 = getelementptr i8, ptr %23, i64 320
  %42 = getelementptr i8, ptr %23, i64 352
  %wide.load.2 = load <8 x float>, ptr %39, align 4, !alias.scope !6, !noalias !9
  %wide.load2.2 = load <8 x float>, ptr %40, align 4, !alias.scope !6, !noalias !9
  %wide.load3.2 = load <8 x float>, ptr %41, align 4, !alias.scope !6, !noalias !9
  %wide.load4.2 = load <8 x float>, ptr %42, align 4, !alias.scope !6, !noalias !9
  %43 = fadd <8 x float> %wide.load.2, %wide.load5.2
  %44 = fadd <8 x float> %wide.load2.2, %wide.load6.2
  %45 = fadd <8 x float> %wide.load3.2, %wide.load7.2
  %46 = fadd <8 x float> %wide.load4.2, %wide.load8.2
  store <8 x float> %43, ptr %39, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %44, ptr %40, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %45, ptr %41, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %46, ptr %42, align 4, !alias.scope !6, !noalias !9
  %47 = getelementptr i8, ptr %23, i64 384
  %48 = getelementptr i8, ptr %23, i64 416
  %49 = getelementptr i8, ptr %23, i64 448
  %50 = getelementptr i8, ptr %23, i64 480
  %wide.load.3 = load <8 x float>, ptr %47, align 4, !alias.scope !6, !noalias !9
  %wide.load2.3 = load <8 x float>, ptr %48, align 4, !alias.scope !6, !noalias !9
  %wide.load3.3 = load <8 x float>, ptr %49, align 4, !alias.scope !6, !noalias !9
  %wide.load4.3 = load <8 x float>, ptr %50, align 4, !alias.scope !6, !noalias !9
  %51 = fadd <8 x float> %wide.load.3, %wide.load5.3
  %52 = fadd <8 x float> %wide.load2.3, %wide.load6.3
  %53 = fadd <8 x float> %wide.load3.3, %wide.load7.3
  %54 = fadd <8 x float> %wide.load4.3, %wide.load8.3
  store <8 x float> %51, ptr %47, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %52, ptr %48, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %53, ptr %49, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %54, ptr %50, align 4, !alias.scope !6, !noalias !9
  %55 = add nuw nsw i64 %22, 1
  %exitcond1.not = icmp eq i64 %55, 64
  br i1 %exitcond1.not, label %broadcast_add_fusion_wrapped.exit, label %.preheader, !llvm.loop !11

broadcast_add_fusion_wrapped.exit:                ; preds = %.preheader
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 0}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 32768}
!5 = !{i64 512}
!6 = !{!7}
!7 = distinct !{!7, !8, !"broadcast_add_fusion_wrapped: argument 0"}
!8 = distinct !{!8, !"broadcast_add_fusion_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"broadcast_add_fusion_wrapped: argument 1"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
