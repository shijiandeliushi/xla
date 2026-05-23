# XLA 错误概览

XLA 错误被归类到不同的 XLA 错误源中。每个源除了错误消息外，还有一个附加上下文的列表，这些上下文将附加到该类别中的每个错误.

🚧 请注意，此标准化工作仍在进行中，因此并非所有错误消息都已附加错误代码。

一个示例错误日志可能如下所示：

```
XlaRuntimeError: RESOURCE_EXHAUSTED: XLA:TPU compile permanent error. Ran out of memory in memory space hbm. Used 49.34G of 32.00G hbm. Exceeded hbm capacity by 17.34G. Total hbm usage >= 49.34G: reserved 3.12M program unknown size arguments 49.34G

JaxRuntimeError: RESOURCE_EXHAUSTED: Ran out of memory in memory space vmem while allocating on stack for %ragged_latency_optimized_all_gather_lhs_contracting_gated_matmul_kernel.18 = bf16[2048,4096]{1,0:T(8,128)(2,1)} custom-call(%get-tuple-element.18273, %get-tuple-element.18274, %get-tuple-element.18275, %get-tuple-element.18276, %get-tuple-element.18277, /*index=5*/%bitcast.8695, %get-tuple-element.19201, %get-tuple-element.19202, %get-tuple-element.19203, %get-tuple-element.19204), custom_call_target=""
```

## 状态和 CHECK 失败

一般来说，在 XLA 中，我们可以通过两种机制标记损坏的执行：状态和 CHECK 宏失败。

状态（Status）用于非致命的、可恢复的错误。其假设是函数返回，并且执行沿着调用者显式检查返回的 Status 对象的路径继续进行。它对于处理无效的用户输入或预期的资源约束很有用。

另一方面，CHECK 失败涵盖程序员的错误或违反不变量的情况，如果代码正确，这些情况本不应发生。如果 CHECK 被触发，程序将记录错误消息并立即终止。它可以确保内部一致性，例如在解引用指针之前检查指针是否为非空.

## 错误代码

以下是包含所有[错误代码](error_codes.md)的列表.
