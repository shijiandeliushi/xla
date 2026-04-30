; ModuleID = '__compute_module_broadcast_maximum_fusion.1_kernel_module'
source_filename = "__compute_module_broadcast_maximum_fusion.1_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind uwtable
define noalias noundef ptr @broadcast_maximum_fusion.1(ptr readonly captures(none) %0) local_unnamed_addr #0 {
  %2 = getelementptr inbounds nuw i8, ptr %0, i64 24
  %3 = load ptr, ptr %2, align 8, !invariant.load !3
  %4 = load ptr, ptr %3, align 8, !invariant.load !3, !dereferenceable !4
  %5 = getelementptr inbounds nuw i8, ptr %3, i64 16
  %6 = load ptr, ptr %5, align 8, !invariant.load !3, !dereferenceable !5
  tail call void @llvm.experimental.noalias.scope.decl(metadata !6)
  tail call void @llvm.experimental.noalias.scope.decl(metadata !9)
  br label %.preheader

.preheader:                                       ; preds = %1, %middle.block
  %7 = phi i64 [ 0, %1 ], [ %50, %middle.block ]
  %.idx = shl i64 %7, 11
  %8 = getelementptr i8, ptr %4, i64 %.idx
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader
  %index = phi i64 [ 0, %.preheader ], [ %index.next.1, %vector.body ]
  %9 = getelementptr float, ptr %8, i64 %index
  %10 = getelementptr i8, ptr %9, i64 32
  %11 = getelementptr i8, ptr %9, i64 64
  %12 = getelementptr i8, ptr %9, i64 96
  %wide.load = load <8 x float>, ptr %9, align 4, !alias.scope !6, !noalias !9
  %wide.load2 = load <8 x float>, ptr %10, align 4, !alias.scope !6, !noalias !9
  %wide.load3 = load <8 x float>, ptr %11, align 4, !alias.scope !6, !noalias !9
  %wide.load4 = load <8 x float>, ptr %12, align 4, !alias.scope !6, !noalias !9
  %13 = getelementptr inbounds nuw float, ptr %6, i64 %index
  %14 = getelementptr inbounds nuw i8, ptr %13, i64 32
  %15 = getelementptr inbounds nuw i8, ptr %13, i64 64
  %16 = getelementptr inbounds nuw i8, ptr %13, i64 96
  %wide.load5 = load <8 x float>, ptr %13, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6 = load <8 x float>, ptr %14, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7 = load <8 x float>, ptr %15, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8 = load <8 x float>, ptr %16, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %17 = fadd <8 x float> %wide.load, %wide.load5
  %18 = fadd <8 x float> %wide.load2, %wide.load6
  %19 = fadd <8 x float> %wide.load3, %wide.load7
  %20 = fadd <8 x float> %wide.load4, %wide.load8
  %21 = fcmp olt <8 x float> %17, zeroinitializer
  %22 = fcmp olt <8 x float> %18, zeroinitializer
  %23 = fcmp olt <8 x float> %19, zeroinitializer
  %24 = fcmp olt <8 x float> %20, zeroinitializer
  %25 = select <8 x i1> %21, <8 x float> zeroinitializer, <8 x float> %17
  %26 = select <8 x i1> %22, <8 x float> zeroinitializer, <8 x float> %18
  %27 = select <8 x i1> %23, <8 x float> zeroinitializer, <8 x float> %19
  %28 = select <8 x i1> %24, <8 x float> zeroinitializer, <8 x float> %20
  store <8 x float> %25, ptr %9, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %26, ptr %10, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %27, ptr %11, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %28, ptr %12, align 4, !alias.scope !6, !noalias !9
  %index.next = or disjoint i64 %index, 32
  %29 = getelementptr float, ptr %8, i64 %index.next
  %30 = getelementptr i8, ptr %29, i64 32
  %31 = getelementptr i8, ptr %29, i64 64
  %32 = getelementptr i8, ptr %29, i64 96
  %wide.load.1 = load <8 x float>, ptr %29, align 4, !alias.scope !6, !noalias !9
  %wide.load2.1 = load <8 x float>, ptr %30, align 4, !alias.scope !6, !noalias !9
  %wide.load3.1 = load <8 x float>, ptr %31, align 4, !alias.scope !6, !noalias !9
  %wide.load4.1 = load <8 x float>, ptr %32, align 4, !alias.scope !6, !noalias !9
  %33 = getelementptr inbounds nuw float, ptr %6, i64 %index.next
  %34 = getelementptr inbounds nuw i8, ptr %33, i64 32
  %35 = getelementptr inbounds nuw i8, ptr %33, i64 64
  %36 = getelementptr inbounds nuw i8, ptr %33, i64 96
  %wide.load5.1 = load <8 x float>, ptr %33, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load6.1 = load <8 x float>, ptr %34, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load7.1 = load <8 x float>, ptr %35, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %wide.load8.1 = load <8 x float>, ptr %36, align 4, !invariant.load !3, !alias.scope !9, !noalias !6
  %37 = fadd <8 x float> %wide.load.1, %wide.load5.1
  %38 = fadd <8 x float> %wide.load2.1, %wide.load6.1
  %39 = fadd <8 x float> %wide.load3.1, %wide.load7.1
  %40 = fadd <8 x float> %wide.load4.1, %wide.load8.1
  %41 = fcmp olt <8 x float> %37, zeroinitializer
  %42 = fcmp olt <8 x float> %38, zeroinitializer
  %43 = fcmp olt <8 x float> %39, zeroinitializer
  %44 = fcmp olt <8 x float> %40, zeroinitializer
  %45 = select <8 x i1> %41, <8 x float> zeroinitializer, <8 x float> %37
  %46 = select <8 x i1> %42, <8 x float> zeroinitializer, <8 x float> %38
  %47 = select <8 x i1> %43, <8 x float> zeroinitializer, <8 x float> %39
  %48 = select <8 x i1> %44, <8 x float> zeroinitializer, <8 x float> %40
  store <8 x float> %45, ptr %29, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %46, ptr %30, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %47, ptr %31, align 4, !alias.scope !6, !noalias !9
  store <8 x float> %48, ptr %32, align 4, !alias.scope !6, !noalias !9
  %index.next.1 = add nuw nsw i64 %index, 64
  %49 = icmp eq i64 %index.next.1, 512
  br i1 %49, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  %50 = add nuw nsw i64 %7, 1
  %exitcond1.not = icmp eq i64 %50, 64
  br i1 %exitcond1.not, label %broadcast_maximum_fusion.1_wrapped.exit, label %.preheader, !llvm.loop !14

broadcast_maximum_fusion.1_wrapped.exit:          ; preds = %middle.block
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.experimental.noalias.scope.decl(metadata) #1

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }

!llvm.module.flags = !{!0, !1}
!xla_cpu_memory_region_name = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 1, !"xla_dylib_index", i64 2}
!2 = !{!"xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"}
!3 = !{}
!4 = !{i64 131072}
!5 = !{i64 2048}
!6 = !{!7}
!7 = distinct !{!7, !8, !"broadcast_maximum_fusion.1_wrapped: argument 0"}
!8 = distinct !{!8, !"broadcast_maximum_fusion.1_wrapped"}
!9 = !{!10}
!10 = distinct !{!10, !8, !"broadcast_maximum_fusion.1_wrapped: argument 1"}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.isvectorized", i32 1}
!13 = !{!"llvm.loop.unroll.runtime.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
