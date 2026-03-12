# 异步 HLO 指令

1. 向 HLO 添加异步操作较为繁琐（例如 `all-reduce-start` 和 `all-reduce-done`）。
2. 对于某些异步使用场景，start 和 done 的拆分可能不够充分。

为了解决第一个缺点，我们提议引入最后一组新的异步操作码：`kAsyncStart`、`kAsyncUpdate` 和 `kAsyncDone`。思路是创建一个通用的异步操作码，它可以包装任何 HLO 指令。实际异步执行的操作将通过一个被调用的计算（computation）来编码，该计算仅以该指令作为其根节点，并以输入作为参数。这样，进行中的输入/输出缓冲区处理和别名机制就可以为任何异步操作所共享。`async-start` 指令的输出形状将是一个元组，包含输入操作数、输出值以及 `async-update` 或 `async-done` 指令所需的任何中间状态。

```
%async_op {
  %param0 = f32[64] parameter(0)
  ROOT %op = f32[32] op(f32[64] %param0), op_specific_attr=”foo”
}

%async-start = (f32[64], f32[32], s32[]) async-start(f32[64] %operand),
                                         calls=%async_op
%async-done = f32[32] async-done((f32[64], f32[32], s32[]) %async-start)
```

在上述表示中，只有 `async-start` 有一个被调用的计算，因为通过跟踪 `async-done` 的操作数找到对应的 `async-start` 就能轻松找到被调用的计算。

另请注意，`async-start` 输出元组中的第一个元素与操作数建立别名，因此该缓冲区至少会存活到 `async-done` 指令。类似地，第二个元素与 `async-done` 的输出建立别名，第三个元素是用于跟踪异步操作的上下文状态。这种表示也支持异步操作输入和/或输出中包含多个张量，别名机制的工作方式相同：

```
%async_op {
  %param0 = f32[64] parameter(0)
  %param1 = f32[64] parameter(1)
  ROOT %op = (f32[32], f32[32]) op(f32[64] %param0, f32[64] %param1),
                                op_specific_attr=”foo”
}

%async-start = ((f32[64], f32[64]), (f32[32], f32[32]), s32[])
               async-start(f32[64] %operand0, f32[64] %operand1),
               calls=%async_op
%async-done = (f32[32], f32[32]) async-done(%async-start)
```

此外，操作可以进一步分解为零个或多个执行中间计算的 `async-update` 步骤。输入/输出别名机制对于 `async-update` 指令的工作方式相同，并且每个 `async-start` 和 `async-update` 指令必须有一个使用者，该使用者要么是另一个 `async-update`，要么是 `async-done：

```
%async_op {
  %param0 = f32[64] parameter(0)
  ROOT %op = f32[32] op(f32[64] %param0), op_specific_attr=”foo”
}
`
%async-start = (f32[64], f32[32], s32[]) async-start(f32[64] %operand),
                                         calls=%async_op
%async-update0 = (f32[64], f32[32], s32[]) async-update(
                           (f32[64], f32[32], s32[]) %async-start)
%async-update1 = (f32[64], f32[32], s32[]) async-update(
                           (f32[64], f32[32], s32[]) %async-update0)
%async-done = f32[32] async-done((f32[64], f32[32], s32[]) %async-update1)

```

## 语法糖

由于使用单独的计算来定义将要异步执行的操作有点繁琐，我们还提出了一种语法糖，以便在打印和解析异步操作时将其视为一等操作码。思路是特殊处理 "-start"、"-update" 和 "-done" 后缀，在解析时自动创建计算和指令（不带后缀）。例如，上面的代码片段可以美化打印为以下内容，并且两者可以解析为相同的表示：

```
%op-start = (f32[64], f32[32], s32[]) op-start(f32[64] %operand),
                                      op_specific_attr=”foo”
%op-update0 = (f32[64], f32[32], s32[]) op-update(
                        (f32[64], f32[32], s32[]) %op-start),
                        op_specific_attr=”foo”
%op-update1 = (f32[64], f32[32], s32[]) op-update(
                        (f32[64], f32[32], s32[]) %op-update0)
%op-done = f32[32] op-done((f32[64], f32[32], s32[]) %op-update1)

```

为了避免歧义，如果我们为某个操作显式定义了带有 "-start" 和/或 "-done" 后缀的操作码，验证器将不允许该操作被 `async-start` 包装。这也是一个应急机制，以防出现需要 HLO 级处理但不符合上述模型的指令（例如输入/输出缓冲区的别名机制）。因此，最初，`copy-start`/`copy-done`、`collective-permute-start`/`collective-permute-done` 等将继续使用它们各自的一等操作码，而不是新的` async-start`/`async-done` 操作码，直到我们清理代码以移除这些 "-start"/"-done" 操作码。
