module @broadcast_maximum_fusion_kernel_module attributes {dlti.dl_spec = #dlti.dl_spec<index = 64 : i32>, xla.cpu_memory_region_name = "xla_cpu_emitter__loop_fusion_kernel_emitter__hlo_opcode__fusion"} {
  func.func @broadcast_maximum_fusion(%arg0: tensor<16384xf32> {llvm.align = 64 : index, llvm.dereferenceable = 65536 : index, xla.slice_index = 0 : index}, %arg1: tensor<256xf32> {llvm.align = 64 : index, llvm.dereferenceable = 1024 : index, xla.invariant, xla.slice_index = 1 : index}, %arg2: tensor<16384xf32> {llvm.align = 64 : index, llvm.dereferenceable = 65536 : index, xla.slice_index = 0 : index}) -> tensor<16384xf32> attributes {xla.backend_kind = #xla.backend_kind<cpu>, xla.entry} {
    %c256 = arith.constant 256 : index
    %c64 = arith.constant 64 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.for %arg3 = %c0 to %c64 step %c1 iter_args(%arg4 = %arg2) -> (tensor<16384xf32>) {
      %1 = scf.for %arg5 = %c0 to %c256 step %c1 iter_args(%arg6 = %arg4) -> (tensor<16384xf32>) {
        %2 = xla.apply_indexing #xla.indexing_map<"(d0, d1) -> (d0 * 256 + d1), domain: d0 in [0, 63], d1 in [0, 255]">(%arg3, %arg5)
        %extracted = tensor.extract %arg0[%2] : tensor<16384xf32>
        %extracted_0 = tensor.extract %arg1[%arg5] : tensor<256xf32>
        %3 = arith.addf %extracted, %extracted_0 : f32
        %4 = arith.maximumf %3, %cst : f32
        %inserted = tensor.insert %4 into %arg6[%2] : tensor<16384xf32>
        scf.yield %inserted : tensor<16384xf32>
      }
      scf.yield %1 : tensor<16384xf32>
    } {loop_annotation = #llvm.loop_annotation<unroll = <disable = true>>}
    return %0 : tensor<16384xf32>
  }
}