; ModuleID = '__compute_module_part_07'
source_filename = "__compute_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@__llvmsplit_unnamed.14 = private unnamed_addr constant [4 x i8] c"\F3\04\B5?"
@__llvmsplit_unnamed.15 = private unnamed_addr constant [4 x i8] c"\00\00\80\BF"
@__llvmsplit_unnamed.16 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@__llvmsplit_unnamed.17 = private unnamed_addr constant [4 x i8] c"\09\00\00\00"
@__llvmsplit_unnamed.18 = private unnamed_addr constant [4 x i8] c"\00\00@\C0"
@__llvmsplit_unnamed.19 = private unnamed_addr constant [4 x i8] c"\00\00 \C0"
@__llvmsplit_unnamed.20 = private unnamed_addr constant [4 x i8] c"\00\00\A0@"
@__llvmsplit_unnamed.21 = private unnamed_addr constant [4 x i8] c"\9B\F0Q\B9"
@__llvmsplit_unnamed.22 = private unnamed_addr constant [4 x i8] c"\88e\F12"
@__llvmsplit_unnamed.23 = private unnamed_addr constant [4 x i8] c"k\B5\D38"
@__llvmsplit_unnamed.24 = private unnamed_addr constant [4 x i8] c"6K\B84"
@__llvmsplit_unnamed.25 = private unnamed_addr constant [4 x i8] c"r\DC\B0:"
@__llvmsplit_unnamed.26 = private unnamed_addr constant [4 x i8] c"Wsl\B6"
@__llvmsplit_unnamed.27 = private unnamed_addr constant [4 x i8] c"\E7\BDp\BB"
@__llvmsplit_unnamed.28 = private unnamed_addr constant [4 x i8] c"\C1Z\93\B6"
@__llvmsplit_unnamed.29 = private unnamed_addr constant [4 x i8] c"{\12\BC;"
@__llvmsplit_unnamed.30 = private unnamed_addr constant [4 x i8] c"\DB2e9"
@__llvmsplit_unnamed.31 = private unnamed_addr constant [4 x i8] c"\D7\C5\F9\BB"
@__llvmsplit_unnamed.32 = private unnamed_addr constant [4 x i8] c"\08T\A4\BA"
@__llvmsplit_unnamed.33 = private unnamed_addr constant [4 x i8] c"~\A5\1A<"
@__llvmsplit_unnamed.34 = private unnamed_addr constant [4 x i8] c"\EF\E4\88\BB"
@__llvmsplit_unnamed.35 = private unnamed_addr constant [4 x i8] c"\DB6\80?"
@__llvmsplit_unnamed.36 = private unnamed_addr constant [4 x i8] c"c\8F|>"
@__llvmsplit_unnamed.37 = private unnamed_addr constant [4 x i8] c"~O5@"
@__llvmsplit_unnamed.38 = private unnamed_addr constant [4 x i8] c"/.\C0?"
@__llvmsplit_unnamed.39 = private unnamed_addr constant [4 x i8] c"\00\00\80\7F"
@__llvmsplit_unnamed.40 = private unnamed_addr constant [4 x i8] c"\00\00\80?"
@__llvmsplit_unnamed.41 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@__llvmsplit_unnamed.42 = private unnamed_addr constant [4 x i8] c"\FF\FF\FF\FF"
@__llvmsplit_unnamed.43 = private unnamed_addr constant [4 x i8] zeroinitializer
@__llvmsplit_unnamed.44 = private unnamed_addr constant [4 x i8] c"\00\00\00\80"
@__llvmsplit_unnamed.45 = private unnamed_addr constant [4 x i8] c"\00\00\80\7F"
@__llvmsplit_unnamed.46 = private unnamed_addr constant [4 x i8] c"\FF\FF\FF\7F"
@__llvmsplit_unnamed.47 = private unnamed_addr constant [4 x i8] c"\00\00\C0\7F"
@__llvmsplit_unnamed.48 = private unnamed_addr constant [4 x i8] c"\01\00\00\80"
@__llvmsplit_unnamed.49 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@__llvmsplit_unnamed.50 = private unnamed_addr constant [4 x i8] c"\00\00\80\FF"
@maximum_minimum_fusion.clone_parallel_bounds = private constant [12 x [1 x [2 x i64]]] [[1 x [2 x i64]] [[2 x i64] [i64 0, i64 170]], [1 x [2 x i64]] [[2 x i64] [i64 170, i64 340]], [1 x [2 x i64]] [[2 x i64] [i64 340, i64 510]], [1 x [2 x i64]] [[2 x i64] [i64 510, i64 680]], [1 x [2 x i64]] [[2 x i64] [i64 680, i64 850]], [1 x [2 x i64]] [[2 x i64] [i64 850, i64 1020]], [1 x [2 x i64]] [[2 x i64] [i64 1020, i64 1190]], [1 x [2 x i64]] [[2 x i64] [i64 1190, i64 1360]], [1 x [2 x i64]] [[2 x i64] [i64 1360, i64 1530]], [1 x [2 x i64]] [[2 x i64] [i64 1530, i64 1700]], [1 x [2 x i64]] [[2 x i64] [i64 1700, i64 1870]], [1 x [2 x i64]] [[2 x i64] [i64 1870, i64 2048]]]

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.fabs.f32(float) #0

; Function Attrs: uwtable
define ptr @maximum_minimum_fusion.clone(ptr %0) #1 {
  %maximum_minimum_fusion.clone.invar_address.dim.1 = alloca i64, align 8
  %maximum_minimum_fusion.clone.invar_address.dim.0 = alloca i64, align 8
  %num_workgroups_gep = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 0
  %num_workgroups = load ptr, ptr %num_workgroups_gep, align 8
  %num_workgroups_x_gep = getelementptr inbounds nuw %XLA_CPU_NumWorkGroups, ptr %num_workgroups, i32 0, i32 0
  %num_workgroups_y_gep = getelementptr inbounds nuw %XLA_CPU_NumWorkGroups, ptr %num_workgroups, i32 0, i32 1
  %num_workgroups_z_gep = getelementptr inbounds nuw %XLA_CPU_NumWorkGroups, ptr %num_workgroups, i32 0, i32 2
  %num_workgroups_x = load i64, ptr %num_workgroups_x_gep, align 4
  %num_workgroups_y = load i64, ptr %num_workgroups_y_gep, align 4
  %num_workgroups_z = load i64, ptr %num_workgroups_z_gep, align 4
  %workgroup_id_gep = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 1
  %workgroup_id = load ptr, ptr %workgroup_id_gep, align 8
  %workgroup_id_x_gep = getelementptr inbounds nuw %XLA_CPU_WorkGroupId, ptr %workgroup_id, i32 0, i32 0
  %workgroup_id_y_gep = getelementptr inbounds nuw %XLA_CPU_WorkGroupId, ptr %workgroup_id, i32 0, i32 1
  %workgroup_id_z_gep = getelementptr inbounds nuw %XLA_CPU_WorkGroupId, ptr %workgroup_id, i32 0, i32 2
  %workgroup_id_x = load i64, ptr %workgroup_id_x_gep, align 4
  %workgroup_id_y = load i64, ptr %workgroup_id_y_gep, align 4
  %workgroup_id_z = load i64, ptr %workgroup_id_z_gep, align 4
  %args_gep = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args = load ptr, ptr %args_gep, align 8
  %arg0_gep = getelementptr %XLA_CPU_KernelArg, ptr %args, i32 0, i32 0
  %arg0 = load ptr, ptr %arg0_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep1 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args2 = load ptr, ptr %args_gep1, align 8
  %arg1_gep = getelementptr %XLA_CPU_KernelArg, ptr %args2, i32 1, i32 0
  %arg1 = load ptr, ptr %arg1_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep3 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args4 = load ptr, ptr %args_gep3, align 8
  %arg2_gep = getelementptr %XLA_CPU_KernelArg, ptr %args4, i32 2, i32 0
  %arg2 = load ptr, ptr %arg2_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep5 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args6 = load ptr, ptr %args_gep5, align 8
  %arg3_gep = getelementptr %XLA_CPU_KernelArg, ptr %args6, i32 3, i32 0
  %arg3 = load ptr, ptr %arg3_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep7 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args8 = load ptr, ptr %args_gep7, align 8
  %arg4_gep = getelementptr %XLA_CPU_KernelArg, ptr %args8, i32 4, i32 0
  %arg4 = load ptr, ptr %arg4_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep9 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args10 = load ptr, ptr %args_gep9, align 8
  %arg5_gep = getelementptr %XLA_CPU_KernelArg, ptr %args10, i32 5, i32 0
  %arg5 = load ptr, ptr %arg5_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep11 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args12 = load ptr, ptr %args_gep11, align 8
  %arg6_gep = getelementptr %XLA_CPU_KernelArg, ptr %args12, i32 6, i32 0
  %arg6 = load ptr, ptr %arg6_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %lo_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @maximum_minimum_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 0
  %up_dim_0_gep = getelementptr inbounds [12 x [1 x [2 x i64]]], ptr @maximum_minimum_fusion.clone_parallel_bounds, i32 0, i64 %workgroup_id_x, i32 0, i32 1
  %lo_dim_0 = load i64, ptr %lo_dim_0_gep, align 4
  %up_dim_0 = load i64, ptr %up_dim_0_gep, align 4
  store i64 %lo_dim_0, ptr %maximum_minimum_fusion.clone.invar_address.dim.0, align 4
  br label %maximum_minimum_fusion.clone.loop_header.dim.0

maximum_minimum_fusion.clone.loop_header.dim.0:   ; preds = %maximum_minimum_fusion.clone.loop_exit.dim.1, %1
  %maximum_minimum_fusion.clone.indvar.dim.0 = load i64, ptr %maximum_minimum_fusion.clone.invar_address.dim.0, align 4
  %2 = icmp uge i64 %maximum_minimum_fusion.clone.indvar.dim.0, %up_dim_0
  br i1 %2, label %maximum_minimum_fusion.clone.loop_exit.dim.0, label %maximum_minimum_fusion.clone.loop_body.dim.0

maximum_minimum_fusion.clone.loop_body.dim.0:     ; preds = %maximum_minimum_fusion.clone.loop_header.dim.0
  store i64 0, ptr %maximum_minimum_fusion.clone.invar_address.dim.1, align 4
  br label %maximum_minimum_fusion.clone.loop_header.dim.1

maximum_minimum_fusion.clone.loop_header.dim.1:   ; preds = %maximum_minimum_fusion.clone.loop_body.dim.1, %maximum_minimum_fusion.clone.loop_body.dim.0
  %maximum_minimum_fusion.clone.indvar.dim.1 = load i64, ptr %maximum_minimum_fusion.clone.invar_address.dim.1, align 4
  %3 = icmp uge i64 %maximum_minimum_fusion.clone.indvar.dim.1, 2048
  br i1 %3, label %maximum_minimum_fusion.clone.loop_exit.dim.1, label %maximum_minimum_fusion.clone.loop_body.dim.1

maximum_minimum_fusion.clone.loop_body.dim.1:     ; preds = %maximum_minimum_fusion.clone.loop_header.dim.1
  %4 = load i32, ptr %arg5, align 4, !invariant.load !1, !noalias !5
  %5 = sitofp i32 %4 to float
  %compare.25 = fcmp une float %5, %5
  %6 = zext i1 %compare.25 to i8
  %constant.171 = load i32, ptr @__llvmsplit_unnamed.47, align 4
  %constant.170 = load float, ptr @__llvmsplit_unnamed.50, align 4
  %compare.24 = fcmp oeq float %5, %constant.170
  %7 = zext i1 %compare.24 to i8
  %constant.169 = load i32, ptr @__llvmsplit_unnamed.49, align 4
  %8 = bitcast float %5 to i32
  %constant.168 = load i32, ptr @__llvmsplit_unnamed.46, align 4
  %9 = and i32 %8, %constant.168
  %constant.167 = load i32, ptr @__llvmsplit_unnamed.43, align 4
  %10 = icmp eq i32 %9, %constant.167
  %11 = zext i1 %10 to i8
  %constant.166 = load i32, ptr @__llvmsplit_unnamed.48, align 4
  %constant.165 = load i32, ptr @__llvmsplit_unnamed.45, align 4
  %12 = icmp sgt i32 %9, %constant.165
  %13 = zext i1 %12 to i8
  %constant.164 = load i32, ptr @__llvmsplit_unnamed.44, align 4
  %14 = and i32 %8, %constant.164
  %constant.16414 = load i32, ptr @__llvmsplit_unnamed.44, align 4
  %15 = icmp ne i32 %14, %constant.16414
  %16 = zext i1 %15 to i8
  %17 = or i8 %13, %16
  %constant.163 = load i32, ptr @__llvmsplit_unnamed.42, align 4
  %constant.162 = load i32, ptr @__llvmsplit_unnamed.41, align 4
  %18 = trunc i8 %17 to i1
  %19 = select i1 %18, i32 %constant.163, i32 %constant.162
  %20 = add i32 %8, %19
  %21 = trunc i8 %11 to i1
  %22 = select i1 %21, i32 %constant.166, i32 %20
  %23 = trunc i8 %7 to i1
  %24 = select i1 %23, i32 %constant.169, i32 %22
  %25 = trunc i8 %6 to i1
  %26 = select i1 %25, i32 %constant.171, i32 %24
  %27 = bitcast i32 %26 to float
  %28 = load i32, ptr %arg4, align 4, !invariant.load !1, !noalias !5
  %29 = sitofp i32 %28 to float
  %compare.20 = fcmp une float %29, %29
  %30 = zext i1 %compare.20 to i8
  %constant.17115 = load i32, ptr @__llvmsplit_unnamed.47, align 4
  %constant.161 = load float, ptr @__llvmsplit_unnamed.39, align 4
  %compare.19 = fcmp oeq float %29, %constant.161
  %31 = zext i1 %compare.19 to i8
  %constant.16516 = load i32, ptr @__llvmsplit_unnamed.45, align 4
  %32 = bitcast float %29 to i32
  %constant.16817 = load i32, ptr @__llvmsplit_unnamed.46, align 4
  %33 = and i32 %32, %constant.16817
  %constant.16718 = load i32, ptr @__llvmsplit_unnamed.43, align 4
  %34 = icmp eq i32 %33, %constant.16718
  %35 = zext i1 %34 to i8
  %constant.16219 = load i32, ptr @__llvmsplit_unnamed.41, align 4
  %constant.16520 = load i32, ptr @__llvmsplit_unnamed.45, align 4
  %36 = icmp sgt i32 %33, %constant.16520
  %37 = zext i1 %36 to i8
  %constant.16421 = load i32, ptr @__llvmsplit_unnamed.44, align 4
  %38 = and i32 %32, %constant.16421
  %constant.16722 = load i32, ptr @__llvmsplit_unnamed.43, align 4
  %39 = icmp ne i32 %38, %constant.16722
  %40 = zext i1 %39 to i8
  %41 = or i8 %37, %40
  %constant.16323 = load i32, ptr @__llvmsplit_unnamed.42, align 4
  %constant.16224 = load i32, ptr @__llvmsplit_unnamed.41, align 4
  %42 = trunc i8 %41 to i1
  %43 = select i1 %42, i32 %constant.16323, i32 %constant.16224
  %44 = add i32 %32, %43
  %45 = trunc i8 %35 to i1
  %46 = select i1 %45, i32 %constant.16219, i32 %44
  %47 = trunc i8 %31 to i1
  %48 = select i1 %47, i32 %constant.16516, i32 %46
  %49 = trunc i8 %30 to i1
  %50 = select i1 %49, i32 %constant.17115, i32 %48
  %51 = bitcast i32 %50 to float
  %52 = load float, ptr %arg1, align 4, !invariant.load !1, !noalias !5
  %53 = getelementptr inbounds [2048 x [2048 x i32]], ptr %arg2, i64 0, i64 %maximum_minimum_fusion.clone.indvar.dim.0, i64 %maximum_minimum_fusion.clone.indvar.dim.1
  %54 = load i32, ptr %53, align 4, !invariant.load !1, !noalias !5
  %55 = getelementptr inbounds [2048 x [2048 x i32]], ptr %arg3, i64 0, i64 %maximum_minimum_fusion.clone.indvar.dim.0, i64 %maximum_minimum_fusion.clone.indvar.dim.1
  %56 = load i32, ptr %55, align 4, !invariant.load !1, !noalias !5
  %57 = xor i32 %54, %56
  %constant.160 = load i32, ptr @__llvmsplit_unnamed.17, align 4
  %58 = lshr i32 %57, %constant.160
  %shft.chk = icmp ult i32 %constant.160, 32
  %59 = select i1 %shft.chk, i32 %58, i32 0
  %constant.159 = load i32, ptr @__llvmsplit_unnamed.16, align 4
  %60 = or i32 %59, %constant.159
  %61 = bitcast i32 %60 to float
  %constant.158 = load float, ptr @__llvmsplit_unnamed.15, align 4
  %add.104 = fadd float %61, %constant.158
  %62 = load float, ptr %arg0, align 4, !invariant.load !1, !noalias !5
  %63 = load float, ptr %arg1, align 4, !invariant.load !1, !noalias !5
  %subtract.34 = fsub float %62, %63
  %multiply.38 = fmul float %add.104, %subtract.34
  %add.102 = fadd float %multiply.38, %52
  %64 = call float @llvm.maximum.f32(float %52, float %add.102)
  %65 = call float @llvm.fabs.f32(float %64)
  %constant.157 = load float, ptr @__llvmsplit_unnamed.40, align 4
  %compare.15 = fcmp oeq float %65, %constant.157
  %66 = zext i1 %compare.15 to i8
  %constant.16125 = load float, ptr @__llvmsplit_unnamed.39, align 4
  %multiply.37 = fmul float %64, %constant.16125
  %67 = fneg float %64
  %multiply.36 = fmul float %64, %67
  %68 = fadd float %multiply.36, 1.000000e+00
  %69 = call float @llvm.log.f32(float %68)
  %70 = fmul float %multiply.36, %multiply.36
  %71 = fmul float 0.000000e+00, %multiply.36
  %72 = fadd float %71, 1.000000e+00
  %73 = fmul float %72, %multiply.36
  %74 = fadd float %73, 0x402E2035A0000000
  %75 = fmul float %74, %multiply.36
  %76 = fadd float %75, 0x4054C30B60000000
  %77 = fmul float %76, %multiply.36
  %78 = fadd float %77, 0x406BB865A0000000
  %79 = fmul float %78, %multiply.36
  %80 = fadd float %79, 0x4073519460000000
  %81 = fmul float %80, %multiply.36
  %82 = fadd float %81, 0x406B0DB140000000
  %83 = fmul float %82, %multiply.36
  %84 = fadd float %83, 0x404E0F3040000000
  %85 = fmul float 0.000000e+00, %multiply.36
  %86 = fadd float %85, 0x3F07BC0960000000
  %87 = fmul float %86, %multiply.36
  %88 = fadd float %87, 0x3FDFE818A0000000
  %89 = fmul float %88, %multiply.36
  %90 = fadd float %89, 0x401A509F40000000
  %91 = fmul float %90, %multiply.36
  %92 = fadd float %91, 0x403DE97380000000
  %93 = fmul float %92, %multiply.36
  %94 = fadd float %93, 0x404E798EC0000000
  %95 = fmul float %94, %multiply.36
  %96 = fadd float %95, 0x404C8E75A0000000
  %97 = fmul float %96, %multiply.36
  %98 = fadd float %97, 0x40340A2020000000
  %99 = fdiv float %98, %84
  %100 = fmul float %multiply.36, %70
  %101 = fmul float %100, %99
  %102 = fmul float -5.000000e-01, %70
  %103 = fadd float %102, %101
  %104 = fadd float %multiply.36, %103
  %105 = call float @llvm.fabs.f32(float %multiply.36)
  %106 = fcmp olt float %105, 0x3FDA8279A0000000
  %107 = select i1 %106, float %104, float %69
  %108 = fneg float %107
  %constant.156 = load float, ptr @__llvmsplit_unnamed.20, align 4
  %compare.14 = fcmp olt float %108, %constant.156
  %109 = zext i1 %compare.14 to i8
  %constant.155 = load float, ptr @__llvmsplit_unnamed.38, align 4
  %constant.154 = load float, ptr @__llvmsplit_unnamed.37, align 4
  %110 = trunc i8 %109 to i1
  %111 = select i1 %110, float %constant.155, float %constant.154
  %constant.153 = load float, ptr @__llvmsplit_unnamed.36, align 4
  %constant.152 = load float, ptr @__llvmsplit_unnamed.35, align 4
  %112 = trunc i8 %109 to i1
  %113 = select i1 %112, float %constant.153, float %constant.152
  %constant.151 = load float, ptr @__llvmsplit_unnamed.34, align 4
  %constant.150 = load float, ptr @__llvmsplit_unnamed.33, align 4
  %114 = trunc i8 %109 to i1
  %115 = select i1 %114, float %constant.151, float %constant.150
  %constant.149 = load float, ptr @__llvmsplit_unnamed.32, align 4
  %constant.148 = load float, ptr @__llvmsplit_unnamed.31, align 4
  %116 = trunc i8 %109 to i1
  %117 = select i1 %116, float %constant.149, float %constant.148
  %constant.147 = load float, ptr @__llvmsplit_unnamed.30, align 4
  %constant.146 = load float, ptr @__llvmsplit_unnamed.29, align 4
  %118 = trunc i8 %109 to i1
  %119 = select i1 %118, float %constant.147, float %constant.146
  %constant.145 = load float, ptr @__llvmsplit_unnamed.28, align 4
  %constant.144 = load float, ptr @__llvmsplit_unnamed.27, align 4
  %120 = trunc i8 %109 to i1
  %121 = select i1 %120, float %constant.145, float %constant.144
  %constant.143 = load float, ptr @__llvmsplit_unnamed.26, align 4
  %constant.142 = load float, ptr @__llvmsplit_unnamed.25, align 4
  %122 = trunc i8 %109 to i1
  %123 = select i1 %122, float %constant.143, float %constant.142
  %constant.141 = load float, ptr @__llvmsplit_unnamed.24, align 4
  %constant.140 = load float, ptr @__llvmsplit_unnamed.23, align 4
  %124 = trunc i8 %109 to i1
  %125 = select i1 %124, float %constant.141, float %constant.140
  %constant.139 = load float, ptr @__llvmsplit_unnamed.22, align 4
  %constant.138 = load float, ptr @__llvmsplit_unnamed.21, align 4
  %126 = trunc i8 %109 to i1
  %127 = select i1 %126, float %constant.139, float %constant.138
  %constant.137 = load float, ptr @__llvmsplit_unnamed.19, align 4
  %add.101 = fadd float %108, %constant.137
  %128 = call float @llvm.sqrt.f32(float %108)
  %constant.136 = load float, ptr @__llvmsplit_unnamed.18, align 4
  %add.100 = fadd float %128, %constant.136
  %129 = trunc i8 %109 to i1
  %130 = select i1 %129, float %add.101, float %add.100
  %multiply.35 = fmul float %127, %130
  %add.99 = fadd float %125, %multiply.35
  %multiply.34 = fmul float %add.99, %130
  %add.98 = fadd float %123, %multiply.34
  %multiply.33 = fmul float %add.98, %130
  %add.97 = fadd float %121, %multiply.33
  %multiply.32 = fmul float %add.97, %130
  %add.95 = fadd float %119, %multiply.32
  %multiply.31 = fmul float %add.95, %130
  %add.94 = fadd float %117, %multiply.31
  %multiply.30 = fmul float %add.94, %130
  %add.93 = fadd float %115, %multiply.30
  %multiply.29 = fmul float %add.93, %130
  %add.92 = fadd float %113, %multiply.29
  %multiply.28 = fmul float %add.92, %130
  %add.91 = fadd float %111, %multiply.28
  %multiply.27 = fmul float %add.91, %64
  %131 = trunc i8 %66 to i1
  %132 = select i1 %131, float %multiply.37, float %multiply.27
  %constant.135 = load float, ptr @__llvmsplit_unnamed.14, align 4
  %multiply.26 = fmul float %132, %constant.135
  %133 = call float @llvm.maximum.f32(float %51, float %multiply.26)
  %134 = call float @llvm.minimum.f32(float %27, float %133)
  %135 = getelementptr inbounds [2048 x [2048 x float]], ptr %arg6, i64 0, i64 %maximum_minimum_fusion.clone.indvar.dim.0, i64 %maximum_minimum_fusion.clone.indvar.dim.1
  store float %134, ptr %135, align 4, !alias.scope !5
  %invar.inc13 = add nuw nsw i64 %maximum_minimum_fusion.clone.indvar.dim.1, 1
  store i64 %invar.inc13, ptr %maximum_minimum_fusion.clone.invar_address.dim.1, align 4
  br label %maximum_minimum_fusion.clone.loop_header.dim.1

maximum_minimum_fusion.clone.loop_exit.dim.1:     ; preds = %maximum_minimum_fusion.clone.loop_header.dim.1
  %invar.inc = add nuw nsw i64 %maximum_minimum_fusion.clone.indvar.dim.0, 1
  store i64 %invar.inc, ptr %maximum_minimum_fusion.clone.invar_address.dim.0, align 4
  br label %maximum_minimum_fusion.clone.loop_header.dim.0, !llvm.loop !8

maximum_minimum_fusion.clone.loop_exit.dim.0:     ; preds = %maximum_minimum_fusion.clone.loop_header.dim.0
  br label %return

return:                                           ; preds = %maximum_minimum_fusion.clone.loop_exit.dim.0
  ret ptr null
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.maximum.f32(float, float) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.log.f32(float) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.sqrt.f32(float) #0

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare float @llvm.minimum.f32(float, float) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #1 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 7}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 16777216}
!5 = !{!6}
!6 = !{!"result slice: {index:0, offset:0, size:16777216}", !7}
!7 = !{!"XLA host kernel maximum_minimum_fusion.clone AA domain"}
!8 = distinct !{!8, !9}
!9 = !{!"llvm.loop.unroll.disable"}
