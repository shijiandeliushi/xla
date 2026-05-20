; ModuleID = '__compute_module_call_computation_kernel_module'
source_filename = "__compute_module_call_computation_kernel_module"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%XLA_CPU_KernelCallFrame = type { ptr, ptr, i64, ptr }
%XLA_CPU_NumWorkGroups = type { i64, i64, i64 }
%XLA_CPU_WorkGroupId = type { i64, i64, i64 }
%XLA_CPU_KernelArg = type { ptr, i64 }

@constant.19 = private unnamed_addr constant [4 x i8] c"\01\00\00\00", align 4
@0 = private unnamed_addr constant [16 x i8] c"\0D\00\00\00\0F\00\00\00\1A\00\00\00\06\00\00\00", align 16
@1 = private unnamed_addr constant [16 x i8] c"\11\00\00\00\1D\00\00\00\10\00\00\00\18\00\00\00", align 16
@2 = private unnamed_addr constant [4 x i8] zeroinitializer, align 4
@constant.18 = private unnamed_addr constant [4 x i8] c"\05\00\00\00", align 4
@3 = private unnamed_addr constant [4 x i8] c" \00\00\00"
@4 = private unnamed_addr constant [4 x i8] c"\01\00\00\00"
@5 = private unnamed_addr constant [4 x i8] c" \00\00\00"

; Function Attrs: uwtable
define ptr @call_kernel(ptr %0) #0 {
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
  %arg5 = load ptr, ptr %arg5_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep11 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args12 = load ptr, ptr %args_gep11, align 8
  %arg6_gep = getelementptr %XLA_CPU_KernelArg, ptr %args12, i32 6, i32 0
  %arg6 = load ptr, ptr %arg6_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep13 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args14 = load ptr, ptr %args_gep13, align 8
  %arg7_gep = getelementptr %XLA_CPU_KernelArg, ptr %args14, i32 7, i32 0
  %arg7 = load ptr, ptr %arg7_gep, align 8, !invariant.load !1, !dereferenceable !3, !align !3
  %args_gep15 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args16 = load ptr, ptr %args_gep15, align 8
  %arg8_gep = getelementptr %XLA_CPU_KernelArg, ptr %args16, i32 8, i32 0
  %arg8 = load ptr, ptr %arg8_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep17 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args18 = load ptr, ptr %args_gep17, align 8
  %arg9_gep = getelementptr %XLA_CPU_KernelArg, ptr %args18, i32 9, i32 0
  %arg9 = load ptr, ptr %arg9_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep19 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args20 = load ptr, ptr %args_gep19, align 8
  %arg10_gep = getelementptr %XLA_CPU_KernelArg, ptr %args20, i32 10, i32 0
  %arg10 = load ptr, ptr %arg10_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep21 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args22 = load ptr, ptr %args_gep21, align 8
  %arg11_gep = getelementptr %XLA_CPU_KernelArg, ptr %args22, i32 11, i32 0
  %arg11 = load ptr, ptr %arg11_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep23 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args24 = load ptr, ptr %args_gep23, align 8
  %arg12_gep = getelementptr %XLA_CPU_KernelArg, ptr %args24, i32 12, i32 0
  %arg12 = load ptr, ptr %arg12_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep25 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args26 = load ptr, ptr %args_gep25, align 8
  %arg13_gep = getelementptr %XLA_CPU_KernelArg, ptr %args26, i32 13, i32 0
  %arg13 = load ptr, ptr %arg13_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep27 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args28 = load ptr, ptr %args_gep27, align 8
  %arg14_gep = getelementptr %XLA_CPU_KernelArg, ptr %args28, i32 14, i32 0
  %arg14 = load ptr, ptr %arg14_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep29 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args30 = load ptr, ptr %args_gep29, align 8
  %arg15_gep = getelementptr %XLA_CPU_KernelArg, ptr %args30, i32 15, i32 0
  %arg15 = load ptr, ptr %arg15_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep31 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args32 = load ptr, ptr %args_gep31, align 8
  %arg16_gep = getelementptr %XLA_CPU_KernelArg, ptr %args32, i32 16, i32 0
  %arg16 = load ptr, ptr %arg16_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep33 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args34 = load ptr, ptr %args_gep33, align 8
  %arg17_gep = getelementptr %XLA_CPU_KernelArg, ptr %args34, i32 17, i32 0
  %arg17 = load ptr, ptr %arg17_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep35 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args36 = load ptr, ptr %args_gep35, align 8
  %arg18_gep = getelementptr %XLA_CPU_KernelArg, ptr %args36, i32 18, i32 0
  %arg18 = load ptr, ptr %arg18_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep37 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args38 = load ptr, ptr %args_gep37, align 8
  %arg19_gep = getelementptr %XLA_CPU_KernelArg, ptr %args38, i32 19, i32 0
  %arg19 = load ptr, ptr %arg19_gep, align 8, !invariant.load !1, !dereferenceable !3, !align !3
  %args_gep39 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args40 = load ptr, ptr %args_gep39, align 8
  %arg20_gep = getelementptr %XLA_CPU_KernelArg, ptr %args40, i32 20, i32 0
  %arg20 = load ptr, ptr %arg20_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep41 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args42 = load ptr, ptr %args_gep41, align 8
  %arg21_gep = getelementptr %XLA_CPU_KernelArg, ptr %args42, i32 21, i32 0
  %arg21 = load ptr, ptr %arg21_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep43 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args44 = load ptr, ptr %args_gep43, align 8
  %arg22_gep = getelementptr %XLA_CPU_KernelArg, ptr %args44, i32 22, i32 0
  %arg22 = load ptr, ptr %arg22_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep45 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args46 = load ptr, ptr %args_gep45, align 8
  %arg23_gep = getelementptr %XLA_CPU_KernelArg, ptr %args46, i32 23, i32 0
  %arg23 = load ptr, ptr %arg23_gep, align 8, !invariant.load !1, !dereferenceable !5, !align !3
  %args_gep47 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args48 = load ptr, ptr %args_gep47, align 8
  %arg24_gep = getelementptr %XLA_CPU_KernelArg, ptr %args48, i32 24, i32 0
  %arg24 = load ptr, ptr %arg24_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep49 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args50 = load ptr, ptr %args_gep49, align 8
  %arg25_gep = getelementptr %XLA_CPU_KernelArg, ptr %args50, i32 25, i32 0
  %arg25 = load ptr, ptr %arg25_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep51 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args52 = load ptr, ptr %args_gep51, align 8
  %arg26_gep = getelementptr %XLA_CPU_KernelArg, ptr %args52, i32 26, i32 0
  %arg26 = load ptr, ptr %arg26_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep53 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args54 = load ptr, ptr %args_gep53, align 8
  %arg27_gep = getelementptr %XLA_CPU_KernelArg, ptr %args54, i32 27, i32 0
  %arg27 = load ptr, ptr %arg27_gep, align 8, !invariant.load !1, !dereferenceable !4, !align !3
  %args_gep55 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args56 = load ptr, ptr %args_gep55, align 8
  %arg28_gep = getelementptr %XLA_CPU_KernelArg, ptr %args56, i32 28, i32 0
  %arg28 = load ptr, ptr %arg28_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep57 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args58 = load ptr, ptr %args_gep57, align 8
  %arg29_gep = getelementptr %XLA_CPU_KernelArg, ptr %args58, i32 29, i32 0
  %arg29 = load ptr, ptr %arg29_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep59 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args60 = load ptr, ptr %args_gep59, align 8
  %arg30_gep = getelementptr %XLA_CPU_KernelArg, ptr %args60, i32 30, i32 0
  %arg30 = load ptr, ptr %arg30_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep61 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args62 = load ptr, ptr %args_gep61, align 8
  %arg31_gep = getelementptr %XLA_CPU_KernelArg, ptr %args62, i32 31, i32 0
  %arg31 = load ptr, ptr %arg31_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep63 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args64 = load ptr, ptr %args_gep63, align 8
  %arg32_gep = getelementptr %XLA_CPU_KernelArg, ptr %args64, i32 32, i32 0
  %arg32 = load ptr, ptr %arg32_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep65 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args66 = load ptr, ptr %args_gep65, align 8
  %arg33_gep = getelementptr %XLA_CPU_KernelArg, ptr %args66, i32 33, i32 0
  %arg33 = load ptr, ptr %arg33_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep67 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args68 = load ptr, ptr %args_gep67, align 8
  %arg34_gep = getelementptr %XLA_CPU_KernelArg, ptr %args68, i32 34, i32 0
  %arg34 = load ptr, ptr %arg34_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep69 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args70 = load ptr, ptr %args_gep69, align 8
  %arg35_gep = getelementptr %XLA_CPU_KernelArg, ptr %args70, i32 35, i32 0
  %arg35 = load ptr, ptr %arg35_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep71 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args72 = load ptr, ptr %args_gep71, align 8
  %arg36_gep = getelementptr %XLA_CPU_KernelArg, ptr %args72, i32 36, i32 0
  %arg36 = load ptr, ptr %arg36_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep73 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args74 = load ptr, ptr %args_gep73, align 8
  %arg37_gep = getelementptr %XLA_CPU_KernelArg, ptr %args74, i32 37, i32 0
  %arg37 = load ptr, ptr %arg37_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %args_gep75 = getelementptr inbounds nuw %XLA_CPU_KernelCallFrame, ptr %0, i32 0, i32 3
  %args76 = load ptr, ptr %args_gep75, align 8
  %arg38_gep = getelementptr %XLA_CPU_KernelArg, ptr %args76, i32 38, i32 0
  %arg38 = load ptr, ptr %arg38_gep, align 8, !invariant.load !1, !dereferenceable !2, !align !3
  %buffer_table = alloca ptr, i64 39, align 8
  %2 = getelementptr inbounds ptr, ptr %buffer_table, i64 0
  store ptr %arg0, ptr %2, align 8
  %3 = getelementptr inbounds ptr, ptr %buffer_table, i64 1
  store ptr %arg1, ptr %3, align 8
  %4 = getelementptr inbounds ptr, ptr %buffer_table, i64 2
  store ptr %arg2, ptr %4, align 8
  %5 = getelementptr inbounds ptr, ptr %buffer_table, i64 3
  store ptr %arg3, ptr %5, align 8
  %6 = getelementptr inbounds ptr, ptr %buffer_table, i64 4
  store ptr %arg4, ptr %6, align 8
  %7 = getelementptr inbounds ptr, ptr %buffer_table, i64 5
  store ptr %arg5, ptr %7, align 8
  %8 = getelementptr inbounds ptr, ptr %buffer_table, i64 6
  store ptr %arg6, ptr %8, align 8
  %9 = getelementptr inbounds ptr, ptr %buffer_table, i64 7
  store ptr %arg7, ptr %9, align 8
  %10 = getelementptr inbounds ptr, ptr %buffer_table, i64 8
  store ptr %arg8, ptr %10, align 8
  %11 = getelementptr inbounds ptr, ptr %buffer_table, i64 9
  store ptr %arg9, ptr %11, align 8
  %12 = getelementptr inbounds ptr, ptr %buffer_table, i64 10
  store ptr %arg10, ptr %12, align 8
  %13 = getelementptr inbounds ptr, ptr %buffer_table, i64 11
  store ptr %arg11, ptr %13, align 8
  %14 = getelementptr inbounds ptr, ptr %buffer_table, i64 12
  store ptr %arg12, ptr %14, align 8
  %15 = getelementptr inbounds ptr, ptr %buffer_table, i64 13
  store ptr %arg13, ptr %15, align 8
  %16 = getelementptr inbounds ptr, ptr %buffer_table, i64 14
  store ptr %arg14, ptr %16, align 8
  %17 = getelementptr inbounds ptr, ptr %buffer_table, i64 15
  store ptr %arg15, ptr %17, align 8
  %18 = getelementptr inbounds ptr, ptr %buffer_table, i64 16
  store ptr %arg16, ptr %18, align 8
  %19 = getelementptr inbounds ptr, ptr %buffer_table, i64 17
  store ptr %arg17, ptr %19, align 8
  %20 = getelementptr inbounds ptr, ptr %buffer_table, i64 18
  store ptr %arg18, ptr %20, align 8
  %21 = getelementptr inbounds ptr, ptr %buffer_table, i64 19
  store ptr %arg19, ptr %21, align 8
  %22 = getelementptr inbounds ptr, ptr %buffer_table, i64 20
  store ptr %arg20, ptr %22, align 8
  %23 = getelementptr inbounds ptr, ptr %buffer_table, i64 21
  store ptr %arg21, ptr %23, align 8
  %24 = getelementptr inbounds ptr, ptr %buffer_table, i64 22
  store ptr %arg22, ptr %24, align 8
  %25 = getelementptr inbounds ptr, ptr %buffer_table, i64 23
  store ptr %arg23, ptr %25, align 8
  %26 = getelementptr inbounds ptr, ptr %buffer_table, i64 24
  store ptr %arg24, ptr %26, align 8
  %27 = getelementptr inbounds ptr, ptr %buffer_table, i64 25
  store ptr %arg25, ptr %27, align 8
  %28 = getelementptr inbounds ptr, ptr %buffer_table, i64 26
  store ptr %arg26, ptr %28, align 8
  %29 = getelementptr inbounds ptr, ptr %buffer_table, i64 27
  store ptr %arg27, ptr %29, align 8
  %30 = getelementptr inbounds ptr, ptr %buffer_table, i64 28
  store ptr %arg28, ptr %30, align 8
  %31 = getelementptr inbounds ptr, ptr %buffer_table, i64 29
  store ptr %arg29, ptr %31, align 8
  %32 = getelementptr inbounds ptr, ptr %buffer_table, i64 30
  store ptr %arg30, ptr %32, align 8
  %33 = getelementptr inbounds ptr, ptr %buffer_table, i64 31
  store ptr %arg31, ptr %33, align 8
  %34 = getelementptr inbounds ptr, ptr %buffer_table, i64 32
  store ptr %arg32, ptr %34, align 8
  %35 = getelementptr inbounds ptr, ptr %buffer_table, i64 33
  store ptr %arg33, ptr %35, align 8
  %36 = getelementptr inbounds ptr, ptr %buffer_table, i64 34
  store ptr %arg34, ptr %36, align 8
  %37 = getelementptr inbounds ptr, ptr %buffer_table, i64 35
  store ptr %arg35, ptr %37, align 8
  %38 = getelementptr inbounds ptr, ptr %buffer_table, i64 36
  store ptr %arg36, ptr %38, align 8
  %39 = getelementptr inbounds ptr, ptr %buffer_table, i64 37
  store ptr %arg37, ptr %39, align 8
  %40 = getelementptr inbounds ptr, ptr %buffer_table, i64 38
  store ptr %arg38, ptr %40, align 8
  call void @while.1_computation(ptr null, ptr null, ptr null, ptr %buffer_table, ptr null, ptr null)
  br label %return

return:                                           ; preds = %1
  ret ptr null
}

; Function Attrs: alwaysinline uwtable
define internal void @while.2(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #1 {
entry:
  %bitcast_add_fusion.kLoop_fusion.invar_address.dim.0 = alloca i64, align 8
  %bitcast_add_fusion.1.kLoop_fusion.invar_address.dim.0 = alloca i64, align 8
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 19
  %arg_tuple.4 = load ptr, ptr %0, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 21
  %2 = load ptr, ptr %1, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %3 = getelementptr inbounds ptr, ptr %buffer_table, i64 25
  %4 = load ptr, ptr %3, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %5 = getelementptr inbounds ptr, ptr %buffer_table, i64 37
  %6 = load ptr, ptr %5, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %7 = getelementptr inbounds ptr, ptr %buffer_table, i64 32
  %8 = load ptr, ptr %7, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %9 = getelementptr inbounds ptr, ptr %buffer_table, i64 20
  %10 = load ptr, ptr %9, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %11 = getelementptr inbounds ptr, ptr %buffer_table, i64 24
  %12 = load ptr, ptr %11, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %13 = getelementptr inbounds ptr, ptr %buffer_table, i64 26
  %14 = load ptr, ptr %13, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %15 = getelementptr inbounds ptr, ptr %buffer_table, i64 29
  %16 = load ptr, ptr %15, align 8, !invariant.load !1, !dereferenceable !7, !align !7
  %17 = getelementptr inbounds ptr, ptr %buffer_table, i64 27
  %copy.15 = load ptr, ptr %17, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.15, ptr align 1 %2, i64 16, i1 false)
  %18 = getelementptr inbounds ptr, ptr %buffer_table, i64 22
  %copy.14 = load ptr, ptr %18, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.14, ptr align 1 %4, i64 16, i1 false)
  %19 = getelementptr inbounds ptr, ptr %buffer_table, i64 30
  %copy.13 = load ptr, ptr %19, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.13, ptr align 1 %6, i64 4, i1 false)
  %20 = getelementptr inbounds ptr, ptr %buffer_table, i64 34
  %copy.12 = load ptr, ptr %20, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.12, ptr align 1 %8, i64 4, i1 false)
  %21 = getelementptr inbounds ptr, ptr %buffer_table, i64 28
  %copy.11 = load ptr, ptr %21, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.11, ptr align 1 %10, i64 4, i1 false)
  %22 = getelementptr inbounds ptr, ptr %buffer_table, i64 38
  %copy.10 = load ptr, ptr %22, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.10, ptr align 1 %12, i64 4, i1 false)
  %23 = getelementptr inbounds ptr, ptr %buffer_table, i64 36
  %copy.9 = load ptr, ptr %23, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.9, ptr align 1 %14, i64 4, i1 false)
  %24 = getelementptr inbounds ptr, ptr %buffer_table, i64 33
  %copy.8 = load ptr, ptr %24, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.8, ptr align 1 %16, i64 4, i1 false)
  %25 = getelementptr inbounds ptr, ptr %buffer_table, i64 21
  %copy.23 = load ptr, ptr %25, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.23, ptr align 1 %copy.14, i64 16, i1 false)
  %26 = getelementptr inbounds ptr, ptr %buffer_table, i64 25
  %copy.22 = load ptr, ptr %26, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.22, ptr align 1 %copy.15, i64 16, i1 false)
  %27 = getelementptr inbounds ptr, ptr %buffer_table, i64 32
  %copy.20 = load ptr, ptr %27, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.20, ptr align 1 %copy.13, i64 4, i1 false)
  %28 = getelementptr inbounds ptr, ptr %buffer_table, i64 37
  %copy.21 = load ptr, ptr %28, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.21, ptr align 1 %copy.11, i64 4, i1 false)
  %29 = getelementptr inbounds ptr, ptr %buffer_table, i64 20
  %copy.19 = load ptr, ptr %29, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %copy.19, ptr align 1 %copy.12, i64 4, i1 false)
  %30 = getelementptr inbounds ptr, ptr %buffer_table, i64 26
  %bitcast_add_fusion.1 = load ptr, ptr %30, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  store i64 0, ptr %bitcast_add_fusion.1.kLoop_fusion.invar_address.dim.0, align 4
  br label %bitcast_add_fusion.1.kLoop_fusion.loop_header.dim.0

return:                                           ; preds = %bitcast_add_fusion.kLoop_fusion.loop_exit.dim.0
  ret void

bitcast_add_fusion.1.kLoop_fusion.loop_header.dim.0: ; preds = %bitcast_add_fusion.1.kLoop_fusion.loop_body.dim.0, %entry
  %bitcast_add_fusion.1.kLoop_fusion.indvar.dim.0 = load i64, ptr %bitcast_add_fusion.1.kLoop_fusion.invar_address.dim.0, align 4
  %31 = icmp uge i64 %bitcast_add_fusion.1.kLoop_fusion.indvar.dim.0, 1
  br i1 %31, label %bitcast_add_fusion.1.kLoop_fusion.loop_exit.dim.0, label %bitcast_add_fusion.1.kLoop_fusion.loop_body.dim.0

bitcast_add_fusion.1.kLoop_fusion.loop_body.dim.0: ; preds = %bitcast_add_fusion.1.kLoop_fusion.loop_header.dim.0
  %32 = getelementptr inbounds [1 x i32], ptr %copy.9, i64 0, i64 0
  %33 = load i32, ptr %32, align 4, !alias.scope !8, !noalias !11
  %34 = getelementptr inbounds [1 x i32], ptr %copy.10, i64 0, i64 0
  %35 = load i32, ptr %34, align 4, !alias.scope !19, !noalias !20
  %36 = add i32 %33, %35
  %37 = getelementptr inbounds [1 x i32], ptr %copy.10, i64 0, i64 0
  %38 = load i32, ptr %37, align 4, !alias.scope !19, !noalias !20
  %39 = add i64 %bitcast_add_fusion.1.kLoop_fusion.indvar.dim.0, 0
  %40 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %39
  %41 = load i32, ptr %40, align 4, !alias.scope !21, !noalias !22
  %42 = shl i32 %38, %41
  %shft.chk = icmp ult i32 %41, 32
  %43 = select i1 %shft.chk, i32 %42, i32 0
  %44 = getelementptr inbounds [1 x i32], ptr %copy.10, i64 0, i64 0
  %45 = load i32, ptr %44, align 4, !alias.scope !19, !noalias !20
  %constant.27 = load i32, ptr @3, align 4
  %46 = sub i32 %constant.27, %41
  %47 = lshr i32 %45, %46
  %shft.chk1 = icmp ult i32 %46, 32
  %48 = select i1 %shft.chk1, i32 %47, i32 0
  %49 = or i32 %43, %48
  %50 = xor i32 %36, %49
  %51 = add i32 %36, %50
  %52 = add i64 %bitcast_add_fusion.1.kLoop_fusion.indvar.dim.0, 1
  %53 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %52
  %54 = load i32, ptr %53, align 4, !alias.scope !21, !noalias !22
  %55 = shl i32 %50, %54
  %shft.chk2 = icmp ult i32 %54, 32
  %56 = select i1 %shft.chk2, i32 %55, i32 0
  %constant.273 = load i32, ptr @3, align 4
  %57 = sub i32 %constant.273, %54
  %58 = lshr i32 %50, %57
  %shft.chk4 = icmp ult i32 %57, 32
  %59 = select i1 %shft.chk4, i32 %58, i32 0
  %60 = or i32 %56, %59
  %61 = xor i32 %51, %60
  %62 = add i32 %51, %61
  %63 = add i64 %bitcast_add_fusion.1.kLoop_fusion.indvar.dim.0, 2
  %64 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %63
  %65 = load i32, ptr %64, align 4, !alias.scope !21, !noalias !22
  %66 = shl i32 %61, %65
  %shft.chk5 = icmp ult i32 %65, 32
  %67 = select i1 %shft.chk5, i32 %66, i32 0
  %constant.276 = load i32, ptr @3, align 4
  %68 = sub i32 %constant.276, %65
  %69 = lshr i32 %61, %68
  %shft.chk7 = icmp ult i32 %68, 32
  %70 = select i1 %shft.chk7, i32 %69, i32 0
  %71 = or i32 %67, %70
  %72 = xor i32 %62, %71
  %73 = add i32 %62, %72
  %74 = load i32, ptr %copy.11, align 4, !alias.scope !25, !noalias !26
  %75 = add i32 %73, %74
  %76 = getelementptr inbounds [1 x i32], ptr %bitcast_add_fusion.1, i64 0, i64 0
  store i32 %75, ptr %76, align 4, !alias.scope !29, !noalias !30
  %invar.inc = add nuw nsw i64 %bitcast_add_fusion.1.kLoop_fusion.indvar.dim.0, 1
  store i64 %invar.inc, ptr %bitcast_add_fusion.1.kLoop_fusion.invar_address.dim.0, align 4
  br label %bitcast_add_fusion.1.kLoop_fusion.loop_header.dim.0

bitcast_add_fusion.1.kLoop_fusion.loop_exit.dim.0: ; preds = %bitcast_add_fusion.1.kLoop_fusion.loop_header.dim.0
  %77 = getelementptr inbounds ptr, ptr %buffer_table, i64 24
  %bitcast_add_fusion = load ptr, ptr %77, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  store i64 0, ptr %bitcast_add_fusion.kLoop_fusion.invar_address.dim.0, align 4
  br label %bitcast_add_fusion.kLoop_fusion.loop_header.dim.0

bitcast_add_fusion.kLoop_fusion.loop_header.dim.0: ; preds = %bitcast_add_fusion.kLoop_fusion.loop_body.dim.0, %bitcast_add_fusion.1.kLoop_fusion.loop_exit.dim.0
  %bitcast_add_fusion.kLoop_fusion.indvar.dim.0 = load i64, ptr %bitcast_add_fusion.kLoop_fusion.invar_address.dim.0, align 4
  %78 = icmp uge i64 %bitcast_add_fusion.kLoop_fusion.indvar.dim.0, 1
  br i1 %78, label %bitcast_add_fusion.kLoop_fusion.loop_exit.dim.0, label %bitcast_add_fusion.kLoop_fusion.loop_body.dim.0

bitcast_add_fusion.kLoop_fusion.loop_body.dim.0:  ; preds = %bitcast_add_fusion.kLoop_fusion.loop_header.dim.0
  %79 = getelementptr inbounds [1 x i32], ptr %copy.9, i64 0, i64 0
  %80 = load i32, ptr %79, align 4, !alias.scope !8, !noalias !11
  %81 = getelementptr inbounds [1 x i32], ptr %copy.10, i64 0, i64 0
  %82 = load i32, ptr %81, align 4, !alias.scope !19, !noalias !20
  %83 = add i32 %80, %82
  %84 = getelementptr inbounds [1 x i32], ptr %copy.10, i64 0, i64 0
  %85 = load i32, ptr %84, align 4, !alias.scope !19, !noalias !20
  %86 = add i64 %bitcast_add_fusion.kLoop_fusion.indvar.dim.0, 0
  %87 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %86
  %88 = load i32, ptr %87, align 4, !alias.scope !21, !noalias !22
  %89 = shl i32 %85, %88
  %shft.chk9 = icmp ult i32 %88, 32
  %90 = select i1 %shft.chk9, i32 %89, i32 0
  %91 = getelementptr inbounds [1 x i32], ptr %copy.10, i64 0, i64 0
  %92 = load i32, ptr %91, align 4, !alias.scope !19, !noalias !20
  %constant.25 = load i32, ptr @5, align 4
  %93 = sub i32 %constant.25, %88
  %94 = lshr i32 %92, %93
  %shft.chk10 = icmp ult i32 %93, 32
  %95 = select i1 %shft.chk10, i32 %94, i32 0
  %96 = or i32 %90, %95
  %97 = xor i32 %83, %96
  %98 = add i32 %83, %97
  %99 = add i64 %bitcast_add_fusion.kLoop_fusion.indvar.dim.0, 1
  %100 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %99
  %101 = load i32, ptr %100, align 4, !alias.scope !21, !noalias !22
  %102 = shl i32 %97, %101
  %shft.chk11 = icmp ult i32 %101, 32
  %103 = select i1 %shft.chk11, i32 %102, i32 0
  %constant.2512 = load i32, ptr @5, align 4
  %104 = sub i32 %constant.2512, %101
  %105 = lshr i32 %97, %104
  %shft.chk13 = icmp ult i32 %104, 32
  %106 = select i1 %shft.chk13, i32 %105, i32 0
  %107 = or i32 %103, %106
  %108 = xor i32 %98, %107
  %109 = add i32 %98, %108
  %110 = add i64 %bitcast_add_fusion.kLoop_fusion.indvar.dim.0, 2
  %111 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %110
  %112 = load i32, ptr %111, align 4, !alias.scope !21, !noalias !22
  %113 = shl i32 %108, %112
  %shft.chk14 = icmp ult i32 %112, 32
  %114 = select i1 %shft.chk14, i32 %113, i32 0
  %constant.2515 = load i32, ptr @5, align 4
  %115 = sub i32 %constant.2515, %112
  %116 = lshr i32 %108, %115
  %shft.chk16 = icmp ult i32 %115, 32
  %117 = select i1 %shft.chk16, i32 %116, i32 0
  %118 = or i32 %114, %117
  %119 = xor i32 %109, %118
  %120 = add i32 %109, %119
  %121 = add i64 %bitcast_add_fusion.kLoop_fusion.indvar.dim.0, 3
  %122 = getelementptr inbounds [4 x i32], ptr %copy.14, i64 0, i64 %121
  %123 = load i32, ptr %122, align 4, !alias.scope !21, !noalias !22
  %124 = shl i32 %119, %123
  %shft.chk17 = icmp ult i32 %123, 32
  %125 = select i1 %shft.chk17, i32 %124, i32 0
  %constant.2518 = load i32, ptr @5, align 4
  %126 = sub i32 %constant.2518, %123
  %127 = lshr i32 %119, %126
  %shft.chk19 = icmp ult i32 %126, 32
  %128 = select i1 %shft.chk19, i32 %127, i32 0
  %129 = or i32 %125, %128
  %130 = xor i32 %120, %129
  %131 = load i32, ptr %copy.12, align 4, !alias.scope !34, !noalias !35
  %132 = add i32 %130, %131
  %133 = load i32, ptr %copy.8, align 4, !alias.scope !36, !noalias !37
  %constant.26 = load i32, ptr @4, align 4
  %134 = add i32 %133, %constant.26
  %135 = add i32 %132, %134
  %136 = getelementptr inbounds [1 x i32], ptr %bitcast_add_fusion, i64 0, i64 0
  store i32 %135, ptr %136, align 4, !alias.scope !39, !noalias !40
  %invar.inc8 = add nuw nsw i64 %bitcast_add_fusion.kLoop_fusion.indvar.dim.0, 1
  store i64 %invar.inc8, ptr %bitcast_add_fusion.kLoop_fusion.invar_address.dim.0, align 4
  br label %bitcast_add_fusion.kLoop_fusion.loop_header.dim.0

bitcast_add_fusion.kLoop_fusion.loop_exit.dim.0:  ; preds = %bitcast_add_fusion.kLoop_fusion.loop_header.dim.0
  %137 = getelementptr inbounds ptr, ptr %buffer_table, i64 29
  %add.35 = load ptr, ptr %137, align 8, !invariant.load !1, !dereferenceable !7, !align !7
  %138 = load i32, ptr %copy.8, align 4, !alias.scope !36, !noalias !37
  %139 = load i32, ptr @constant.19, align 4, !alias.scope !41, !noalias !42
  %140 = add i32 %138, %139
  store i32 %140, ptr %add.35, align 4, !alias.scope !43, !noalias !44
  %141 = getelementptr inbounds ptr, ptr %buffer_table, i64 19
  %tuple.12 = load ptr, ptr %141, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %142 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 0
  store ptr %add.35, ptr %142, align 8, !alias.scope !45, !noalias !46
  %143 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 1
  store ptr %bitcast_add_fusion.1, ptr %143, align 8, !alias.scope !45, !noalias !46
  %144 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 2
  store ptr %bitcast_add_fusion, ptr %144, align 8, !alias.scope !45, !noalias !46
  %145 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 3
  store ptr %copy.19, ptr %145, align 8, !alias.scope !45, !noalias !46
  %146 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 4
  store ptr %copy.20, ptr %146, align 8, !alias.scope !45, !noalias !46
  %147 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 5
  store ptr %copy.21, ptr %147, align 8, !alias.scope !45, !noalias !46
  %148 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 6
  store ptr %copy.22, ptr %148, align 8, !alias.scope !45, !noalias !46
  %149 = getelementptr inbounds [8 x ptr], ptr %tuple.12, i64 0, i64 7
  store ptr %copy.23, ptr %149, align 8, !alias.scope !45, !noalias !46
  br label %return
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias writeonly captures(none), ptr noalias readonly captures(none), i64, i1 immarg) #2

; Function Attrs: alwaysinline uwtable
define internal void @while.2__1(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #1 {
entry:
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 19
  %arg_tuple.3 = load ptr, ptr %0, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 29
  %2 = load ptr, ptr %1, align 8, !invariant.load !1, !dereferenceable !7, !align !7
  %3 = getelementptr inbounds ptr, ptr %buffer_table, i64 23
  %compare.1 = load ptr, ptr %3, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %4 = load i32, ptr %2, align 4, !alias.scope !43, !noalias !47
  %5 = load i32, ptr @constant.18, align 4, !alias.scope !50, !noalias !51
  %6 = icmp slt i32 %4, %5
  %7 = zext i1 %6 to i8
  store i8 %7, ptr %compare.1, align 1, !alias.scope !52, !noalias !53
  br label %return

return:                                           ; preds = %entry
  ret void
}

; Function Attrs: alwaysinline uwtable
define internal void @while.1_computation(ptr %retval, ptr noalias %run_options, ptr noalias %params, ptr noalias %buffer_table, ptr noalias %status, ptr noalias %prof_counters) #1 {
entry:
  %0 = getelementptr inbounds ptr, ptr %buffer_table, i64 19
  %tuple.13 = load ptr, ptr %0, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %1 = getelementptr inbounds ptr, ptr %buffer_table, i64 19
  %while.2 = load ptr, ptr %1, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  br label %while.2.header

return:                                           ; preds = %while.2.exit
  ret void

while.2.header:                                   ; preds = %while.2.body, %entry
  call void @while.2__1(ptr null, ptr %run_options, ptr null, ptr %buffer_table, ptr %status, ptr %prof_counters)
  %2 = getelementptr inbounds ptr, ptr %buffer_table, i64 23
  %3 = load ptr, ptr %2, align 8, !invariant.load !1, !dereferenceable !6, !align !3
  %4 = load i8, ptr %3, align 1
  %5 = icmp ne i8 %4, 0
  br i1 %5, label %while.2.body, label %while.2.exit

while.2.body:                                     ; preds = %while.2.header
  call void @while.2(ptr null, ptr %run_options, ptr null, ptr %buffer_table, ptr %status, ptr %prof_counters)
  br label %while.2.header

while.2.exit:                                     ; preds = %while.2.header
  br label %return
}

attributes #0 = { uwtable "frame-pointer"="all" "prefer-vector-width"="256" }
attributes #1 = { alwaysinline uwtable "denormal-fp-math"="preserve-sign" "no-frame-pointer-elim"="false" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }

!llvm.module.flags = !{!0}

!0 = !{i32 1, !"xla_dylib_index", i64 0}
!1 = !{}
!2 = !{i64 4}
!3 = !{i64 64}
!4 = !{i64 16}
!5 = !{i64 1}
!6 = !{i64 964}
!7 = !{i64 8}
!8 = !{!9}
!9 = !{!"buffer: {index:8, offset:448, size:4}", !10}
!10 = !{!"XLA global AA domain"}
!11 = !{!12, !13, !14, !15, !16, !17, !18}
!12 = !{!"buffer: {index:8, offset:64, size:16}", !10}
!13 = !{!"buffer: {index:8, offset:320, size:4}", !10}
!14 = !{!"buffer: {index:8, offset:384, size:4}", !10}
!15 = !{!"buffer: {index:8, offset:512, size:4}", !10}
!16 = !{!"buffer: {index:8, offset:576, size:4}", !10}
!17 = !{!"buffer: {index:8, offset:704, size:4}", !10}
!18 = !{!"buffer: {index:8, offset:768, size:4}", !10}
!19 = !{!14}
!20 = !{!12, !13, !9, !15, !16, !17, !18}
!21 = !{!12}
!22 = !{!23, !24, !13, !14, !9, !15, !16, !17, !18}
!23 = !{!"buffer: {index:8, offset:192, size:16}", !10}
!24 = !{!"buffer: {index:8, offset:256, size:16}", !10}
!25 = !{!16}
!26 = !{!12, !14, !9, !17, !27, !28}
!27 = !{!"buffer: {index:8, offset:832, size:4}", !10}
!28 = !{!"buffer: {index:8, offset:960, size:4}", !10}
!29 = !{!17}
!30 = !{!31, !32, !12, !23, !24, !14, !9, !16, !18, !27, !33, !28}
!31 = !{!"buffer: {index:3, offset:0, size:4}", !10}
!32 = !{!"buffer: {index:8, offset:0, size:64}", !10}
!33 = !{!"buffer: {index:8, offset:896, size:4}", !10}
!34 = !{!13}
!35 = !{!12, !14, !9, !15, !18, !27, !33}
!36 = !{!15}
!37 = !{!38, !31, !12, !13, !14, !9, !18}
!38 = !{!"buffer: {index:0, offset:0, size:4}", !10}
!39 = !{!18}
!40 = !{!31, !32, !12, !23, !24, !13, !14, !9, !15, !17, !27, !33, !28}
!41 = !{!38}
!42 = !{!31, !15}
!43 = !{!31}
!44 = !{!38, !32, !23, !24, !15, !17, !18, !27, !33, !28}
!45 = !{!32}
!46 = !{!31, !23, !24, !17, !18, !27, !33, !28}
!47 = !{!48, !49}
!48 = !{!"buffer: {index:7, offset:0, size:4}", !10}
!49 = !{!"buffer: {index:8, offset:64, size:1}", !10}
!50 = !{!48}
!51 = !{!31, !49}
!52 = !{!49}
!53 = !{!31, !48}
