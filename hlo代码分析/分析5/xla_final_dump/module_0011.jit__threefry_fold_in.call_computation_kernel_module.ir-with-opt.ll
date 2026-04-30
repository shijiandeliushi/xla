; ModuleID = '__compute_module_call_computation_kernel_module'
source_filename = "__compute_module_call_computation_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable
define noalias noundef ptr @call_kernel(ptr readonly captures(none) %0) local_unnamed_addr #0 {
return:
  %args_gep = getelementptr inbounds nuw i8, ptr %0, i64 24
  %args = load ptr, ptr %args_gep, align 8
  %arg19_gep = getelementptr i8, ptr %args, i64 304
  %arg19 = load ptr, ptr %arg19_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg20_gep = getelementptr i8, ptr %args, i64 320
  %arg20 = load ptr, ptr %arg20_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %arg21_gep = getelementptr i8, ptr %args, i64 336
  %arg21 = load ptr, ptr %arg21_gep, align 8, !invariant.load !1, !dereferenceable !5, !align !3
  %arg22_gep = getelementptr i8, ptr %args, i64 352
  %arg22 = load ptr, ptr %arg22_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg23_gep = getelementptr i8, ptr %args, i64 368
  %arg23 = load ptr, ptr %arg23_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg24_gep = getelementptr i8, ptr %args, i64 384
  %arg24 = load ptr, ptr %arg24_gep, align 8, !invariant.load !1, !dereferenceable !5, !align !3
  %arg25_gep = getelementptr i8, ptr %args, i64 400
  %arg25 = load ptr, ptr %arg25_gep, align 8, !invariant.load !1, !dereferenceable !5, !align !3
  %arg26_gep = getelementptr i8, ptr %args, i64 416
  %arg26 = load ptr, ptr %arg26_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg27_gep = getelementptr i8, ptr %args, i64 432
  %arg27 = load ptr, ptr %arg27_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg29_gep = getelementptr i8, ptr %args, i64 464
  %arg29 = load ptr, ptr %arg29_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg30_gep = getelementptr i8, ptr %args, i64 480
  %arg30 = load ptr, ptr %arg30_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg31_gep = getelementptr i8, ptr %args, i64 496
  %arg31 = load ptr, ptr %arg31_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg33_gep = getelementptr i8, ptr %args, i64 528
  %arg33 = load ptr, ptr %arg33_gep, align 8, !invariant.load !1, !dereferenceable !5, !align !3
  %arg34_gep = getelementptr i8, ptr %args, i64 544
  %arg34 = load ptr, ptr %arg34_gep, align 8, !invariant.load !1, !dereferenceable !3, !align !3
  %arg35_gep = getelementptr i8, ptr %args, i64 560
  %arg35 = load ptr, ptr %arg35_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg36_gep = getelementptr i8, ptr %args, i64 576
  %arg36 = load ptr, ptr %arg36_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg37_gep = getelementptr i8, ptr %args, i64 592
  %arg37 = load ptr, ptr %arg37_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %arg38_gep = getelementptr i8, ptr %args, i64 608
  %arg38 = load ptr, ptr %arg38_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %1 = load i32, ptr %arg31, align 64, !alias.scope !6, !noalias !9
  %2 = icmp slt i32 %1, 5
  %3 = zext i1 %2 to i8
  store i8 %3, ptr %arg20, align 64, !alias.scope !16, !noalias !17
  br i1 %2, label %while.2.body.i.lr.ph, label %while.1_computation.exit

while.2.body.i.lr.ph:                             ; preds = %return
  %4 = getelementptr inbounds nuw i8, ptr %arg24, i64 4
  %5 = getelementptr inbounds nuw i8, ptr %arg24, i64 8
  %6 = getelementptr inbounds nuw i8, ptr %arg24, i64 12
  %7 = getelementptr inbounds nuw i8, ptr %arg34, i64 8
  %8 = getelementptr inbounds nuw i8, ptr %arg34, i64 16
  %9 = getelementptr inbounds nuw i8, ptr %arg34, i64 24
  %10 = getelementptr inbounds nuw i8, ptr %arg34, i64 32
  %11 = getelementptr inbounds nuw i8, ptr %arg34, i64 40
  %12 = getelementptr inbounds nuw i8, ptr %arg34, i64 48
  %13 = getelementptr inbounds nuw i8, ptr %arg34, i64 56
  br label %while.2.body.i

while.2.body.i:                                   ; preds = %while.2.body.i.lr.ph, %while.2.body.i
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg33, ptr noundef nonnull align 64 dereferenceable(16) %arg25, i64 16, i1 false), !noalias !18
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg24, ptr noundef nonnull align 64 dereferenceable(16) %arg21, i64 16, i1 false), !noalias !18
  %14 = load i32, ptr %arg27, align 64, !noalias !18
  store i32 %14, ptr %arg38, align 64, !noalias !18
  %15 = load i32, ptr %arg23, align 64, !noalias !18
  store i32 %15, ptr %arg30, align 64, !noalias !18
  %16 = load i32, ptr %arg22, align 64, !noalias !18
  store i32 %16, ptr %arg29, align 64, !noalias !18
  %17 = load i32, ptr %arg35, align 64, !noalias !18
  store i32 %17, ptr %arg37, align 64, !noalias !18
  %18 = load i32, ptr %arg26, align 64, !noalias !18
  store i32 %18, ptr %arg19, align 64, !noalias !18
  %19 = load i32, ptr %arg31, align 64, !noalias !18
  store i32 %19, ptr %arg36, align 64, !noalias !18
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg25, ptr noundef nonnull align 64 dereferenceable(16) %arg24, i64 16, i1 false), !noalias !18
  tail call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 64 dereferenceable(16) %arg21, ptr noundef nonnull align 64 dereferenceable(16) %arg33, i64 16, i1 false), !noalias !18
  %20 = load i32, ptr %arg38, align 64, !noalias !18
  store i32 %20, ptr %arg23, align 64, !noalias !18
  %21 = load i32, ptr %arg29, align 64, !noalias !18
  store i32 %21, ptr %arg27, align 64, !noalias !18
  %22 = load i32, ptr %arg30, align 64, !noalias !18
  store i32 %22, ptr %arg22, align 64, !noalias !18
  %23 = load i32, ptr %arg19, align 64, !alias.scope !21, !noalias !23
  %24 = load i32, ptr %arg37, align 64, !alias.scope !31, !noalias !32
  %25 = add i32 %24, %23
  %26 = load i32, ptr %arg24, align 64, !alias.scope !33, !noalias !34
  %27 = shl i32 %24, %26
  %shft.chk.i.i = icmp ult i32 %26, 32
  %28 = select i1 %shft.chk.i.i, i32 %27, i32 0
  %29 = sub i32 32, %26
  %30 = lshr i32 %24, %29
  %shft.chk1.i.i = icmp ult i32 %29, 32
  %31 = select i1 %shft.chk1.i.i, i32 %30, i32 0
  %32 = or i32 %31, %28
  %33 = xor i32 %32, %25
  %34 = add i32 %33, %25
  %35 = load i32, ptr %4, align 4, !alias.scope !33, !noalias !34
  %36 = shl i32 %33, %35
  %shft.chk2.i.i = icmp ult i32 %35, 32
  %37 = select i1 %shft.chk2.i.i, i32 %36, i32 0
  %38 = sub i32 32, %35
  %39 = lshr i32 %33, %38
  %shft.chk4.i.i = icmp ult i32 %38, 32
  %40 = select i1 %shft.chk4.i.i, i32 %39, i32 0
  %41 = or i32 %37, %40
  %42 = xor i32 %41, %34
  %43 = add i32 %42, %34
  %44 = load i32, ptr %5, align 8, !alias.scope !33, !noalias !34
  %45 = shl i32 %42, %44
  %shft.chk5.i.i = icmp ult i32 %44, 32
  %46 = select i1 %shft.chk5.i.i, i32 %45, i32 0
  %47 = sub i32 32, %44
  %48 = lshr i32 %42, %47
  %shft.chk7.i.i = icmp ult i32 %47, 32
  %49 = select i1 %shft.chk7.i.i, i32 %48, i32 0
  %50 = or i32 %46, %49
  %51 = xor i32 %50, %43
  %52 = add i32 %51, %43
  %53 = load i32, ptr %arg29, align 64, !alias.scope !37, !noalias !38
  %54 = add i32 %52, %53
  store i32 %54, ptr %arg26, align 64, !alias.scope !41, !noalias !42
  %55 = load i32, ptr %6, align 4, !alias.scope !33, !noalias !34
  %56 = shl i32 %51, %55
  %shft.chk17.i.i = icmp ult i32 %55, 32
  %57 = select i1 %shft.chk17.i.i, i32 %56, i32 0
  %58 = sub i32 32, %55
  %59 = lshr i32 %51, %58
  %shft.chk19.i.i = icmp ult i32 %58, 32
  %60 = select i1 %shft.chk19.i.i, i32 %59, i32 0
  %61 = or i32 %57, %60
  %62 = xor i32 %61, %52
  %63 = load i32, ptr %arg30, align 64, !alias.scope !45, !noalias !46
  %64 = load i32, ptr %arg36, align 64, !alias.scope !47, !noalias !48
  %65 = add i32 %64, 1
  %66 = add i32 %65, %63
  %67 = add i32 %66, %62
  store i32 %67, ptr %arg35, align 64, !alias.scope !50, !noalias !51
  store i32 %65, ptr %arg31, align 64, !alias.scope !6, !noalias !52
  store ptr %arg31, ptr %arg34, align 64, !alias.scope !53, !noalias !54
  store ptr %arg26, ptr %7, align 8, !alias.scope !53, !noalias !54
  store ptr %arg35, ptr %8, align 16, !alias.scope !53, !noalias !54
  store ptr %arg22, ptr %9, align 8, !alias.scope !53, !noalias !54
  store ptr %arg23, ptr %10, align 32, !alias.scope !53, !noalias !54
  store ptr %arg27, ptr %11, align 8, !alias.scope !53, !noalias !54
  store ptr %arg21, ptr %12, align 16, !alias.scope !53, !noalias !54
  store ptr %arg25, ptr %13, align 8, !alias.scope !53, !noalias !54
  %68 = icmp slt i32 %65, 5
  %69 = zext i1 %68 to i8
  store i8 %69, ptr %arg20, align 64, !alias.scope !16, !noalias !17
  br i1 %68, label %while.2.body.i, label %while.1_computation.exit

while.1_computation.exit:                         ; preds = %while.2.body.i, %return
  ret ptr null
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #1

attributes #0 = { nofree norecurse nosync nounwind memory(readwrite, inaccessiblemem: none) uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 1}
!5 = !{i64 16}
!6 = !{!7}
!7 = !{!"buffer: {index:3, offset:0, size:4}", !8}
!8 = !{!"XLA global AA domain"}
!9 = !{!10, !11, !12, !14}
!10 = !{!"buffer: {index:7, offset:0, size:4}", !8}
!11 = !{!"buffer: {index:8, offset:64, size:1}", !8}
!12 = distinct !{!12, !13, !"while.2__1: %buffer_table"}
!13 = distinct !{!13, !"while.2__1"}
!14 = distinct !{!14, !15, !"while.1_computation: %buffer_table"}
!15 = distinct !{!15, !"while.1_computation"}
!16 = !{!11}
!17 = !{!7, !10, !12, !14}
!18 = !{!19, !14}
!19 = distinct !{!19, !20, !"while.2: %buffer_table"}
!20 = distinct !{!20, !"while.2"}
!21 = !{!22}
!22 = !{!"buffer: {index:8, offset:448, size:4}", !8}
!23 = !{!24, !25, !26, !27, !28, !29, !30, !19, !14}
!24 = !{!"buffer: {index:8, offset:64, size:16}", !8}
!25 = !{!"buffer: {index:8, offset:320, size:4}", !8}
!26 = !{!"buffer: {index:8, offset:384, size:4}", !8}
!27 = !{!"buffer: {index:8, offset:512, size:4}", !8}
!28 = !{!"buffer: {index:8, offset:576, size:4}", !8}
!29 = !{!"buffer: {index:8, offset:704, size:4}", !8}
!30 = !{!"buffer: {index:8, offset:768, size:4}", !8}
!31 = !{!26}
!32 = !{!24, !25, !22, !27, !28, !29, !30, !19, !14}
!33 = !{!24}
!34 = !{!35, !36, !25, !26, !22, !27, !28, !29, !30, !19, !14}
!35 = !{!"buffer: {index:8, offset:192, size:16}", !8}
!36 = !{!"buffer: {index:8, offset:256, size:16}", !8}
!37 = !{!28}
!38 = !{!24, !26, !22, !29, !39, !40, !19, !14}
!39 = !{!"buffer: {index:8, offset:832, size:4}", !8}
!40 = !{!"buffer: {index:8, offset:960, size:4}", !8}
!41 = !{!29}
!42 = !{!7, !43, !24, !35, !36, !26, !22, !28, !30, !39, !44, !40, !19, !14}
!43 = !{!"buffer: {index:8, offset:0, size:64}", !8}
!44 = !{!"buffer: {index:8, offset:896, size:4}", !8}
!45 = !{!25}
!46 = !{!24, !26, !22, !27, !30, !39, !44, !19, !14}
!47 = !{!27}
!48 = !{!49, !7, !24, !25, !26, !22, !30, !19, !14}
!49 = !{!"buffer: {index:0, offset:0, size:4}", !8}
!50 = !{!30}
!51 = !{!7, !43, !24, !35, !36, !25, !26, !22, !27, !29, !39, !44, !40, !19, !14}
!52 = !{!49, !43, !35, !36, !27, !29, !30, !39, !44, !40, !19, !14}
!53 = !{!43}
!54 = !{!7, !35, !36, !29, !30, !39, !44, !40, !19, !14}
