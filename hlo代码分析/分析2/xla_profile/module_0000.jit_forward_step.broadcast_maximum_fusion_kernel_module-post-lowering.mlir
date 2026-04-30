module @broadcast_maximum_fusion_kernel_module attributes {dlti.dl_spec = #dlti.dl_spec<index = 64 : i32>, xla.cpu_memory_region_name = "xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"} {
  llvm.func @broadcast_maximum_fusion(%arg0: !llvm.ptr) -> !llvm.ptr attributes {frame_pointer = #llvm.framePointerKind<all>, passthrough = [["prefer-vector-width", "256"]], uwtable_kind = #llvm.uwtableKind<async>} {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.getelementptr inbounds %arg0[0, 3] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"XLA_CPU_KernelCallFrame", (ptr, ptr, i64, ptr)>
    %2 = llvm.load %1 invariant : !llvm.ptr -> !llvm.ptr
    %3 = llvm.getelementptr inbounds %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"XLA_CPU_KernelArg", (ptr, i64)>
    %4 = llvm.load %3 invariant dereferenceable<bytes = 65536> : !llvm.ptr -> !llvm.ptr
    %5 = llvm.getelementptr inbounds %2[1, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"XLA_CPU_KernelArg", (ptr, i64)>
    %6 = llvm.load %5 invariant dereferenceable<bytes = 1024> : !llvm.ptr -> !llvm.ptr
    %7 = llvm.getelementptr inbounds %2[2, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"XLA_CPU_KernelArg", (ptr, i64)>
    %8 = llvm.load %7 invariant dereferenceable<bytes = 65536> : !llvm.ptr -> !llvm.ptr
    %9 = llvm.getelementptr inbounds %arg0[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"XLA_CPU_KernelCallFrame", (ptr, ptr, i64, ptr)>
    %10 = llvm.load %9 : !llvm.ptr -> !llvm.ptr
    %11 = llvm.getelementptr inbounds %10[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"kernel_dim3", (i64, i64, i64)>
    %12 = llvm.load %11 invariant : !llvm.ptr -> i64
    %13 = llvm.getelementptr inbounds %10[0, 1] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"kernel_dim3", (i64, i64, i64)>
    %14 = llvm.load %13 invariant : !llvm.ptr -> i64
    %15 = llvm.getelementptr inbounds %10[0, 2] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<"kernel_dim3", (i64, i64, i64)>
    %16 = llvm.load %15 invariant : !llvm.ptr -> i64
    llvm.call @broadcast_maximum_fusion_wrapped(%4, %6, %8, %12, %14, %16) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i64, i64, i64) -> ()
    llvm.return %0 : !llvm.ptr
  }
  llvm.func internal @broadcast_maximum_fusion_wrapped(%arg0: !llvm.ptr {llvm.align = 64 : index, llvm.dereferenceable = 65536 : index, llvm.noalias}, %arg1: !llvm.ptr {llvm.align = 64 : index, llvm.dereferenceable = 1024 : index, llvm.noalias, xla.invariant}, %arg2: !llvm.ptr {llvm.align = 64 : index, llvm.dereferenceable = 65536 : index, llvm.noalias}, %arg3: i64, %arg4: i64, %arg5: i64) attributes {always_inline, sym_visibility = "private", xla.backend_kind = #xla.backend_kind<cpu>, xla.cpu.is_wrapped, xla.entry} {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = llvm.mlir.constant(64 : index) : i64
    %4 = llvm.mlir.constant(256 : index) : i64
    llvm.br ^bb1(%2 : i64)
  ^bb1(%5: i64):  // 2 preds: ^bb0, ^bb5
    %6 = llvm.icmp "slt" %5, %3 : i64
    llvm.cond_br %6, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    %7 = llvm.mul %5, %4 overflow<nsw> : i64
    llvm.br ^bb3(%2 : i64)
  ^bb3(%8: i64):  // 2 preds: ^bb2, ^bb4
    %9 = llvm.icmp "slt" %8, %4 : i64
    llvm.cond_br %9, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    %10 = llvm.add %7, %8 overflow<nsw> : i64
    %11 = llvm.getelementptr inbounds %arg0[0, %10] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<16384 x f32>
    %12 = llvm.load %11 : !llvm.ptr -> f32
    %13 = llvm.getelementptr inbounds %arg1[0, %8] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<256 x f32>
    %14 = llvm.load %13 invariant : !llvm.ptr -> f32
    %15 = llvm.fadd %12, %14 : f32
    %16 = llvm.fcmp "uge" %15, %0 : f32
    %17 = llvm.select %16, %15, %0 : i1, f32
    llvm.store %17, %11 : f32, !llvm.ptr
    %18 = llvm.add %8, %1 : i64
    llvm.br ^bb3(%18 : i64)
  ^bb5:  // pred: ^bb3
    %19 = llvm.add %5, %1 : i64
    llvm.br ^bb1(%19 : i64) {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
  ^bb6:  // pred: ^bb1
    llvm.return
  }
}