# XLA 中的别名机制

本文档介绍了 XLA 的别名 API，该 API 允许在构建 XLA 程序时指定输入和输出缓冲区之间的别名关系。

## 在编译时定义别名

例如，考虑一个简单的 HLO 模块，它只是将 `1` 加到其输入上：

```mlir
HloModule increment

ENTRY entry {
  %p = f32[] parameter(0)
  %c = f32[] constant(1)
  ROOT %out = f32[] add(%p, %c)
}
```

此模块将分配两个 4 字节缓冲区：一个用于输入 `%p`，一个用于输出 `%out`。

然而，通常希望就地执行更新（例如，如果在前端生成表达式时，输入变量在计算后不再存活，就像自增运算 `p++` 那样）。

为了高效地执行此类更新，可以指定输入别名：

```mlir
HloModule increment, input_output_alias={ {}: 0 }

ENTRY entry {
  %p = f32[] parameter(0)
  %c = f32[] constant(1)
  ROOT %out = f32[] add(%p, %c)
}
```

该格式指定整个输出（由 `{}` 标记）与输入参数 `0` 建立别名。

要以编程方式指定别名，请参阅
[`XlaBuilder::SetUpAlias`](https://github.com/openxla/xla/blob/main/xla/client/xla_builder.h)
API.

## 在运行时定义别名

上一步中定义的别名是在编译期间指定的。在执行期间，可以使用
[`LocalClient::RunAsync`](https://github.com/openxla/xla/blob/main/xla/client/local_client.h)
API 来选择是否捐献缓冲区。

程序的输入缓冲区被包装在
[`ExecutionInput`](https://github.com/openxla/xla/blob/main/xla/service/executable.h)s,
中，其中包含一棵 `MaybeOwningDeviceMemory` 树。如果内存被指定为拥有（缓冲区的所有权被传递给 XLA 运行时），则缓冲区实际被捐献，并且更新会按编译时别名 API 的要求就地执行。

但是，如果在编译时建立别名的缓冲区在运行时没有被捐献，则复制保护机制会生效：会分配一个额外的输出缓冲区 `O`，并将本应建立别名的输入缓冲区 `P` 的内容复制到 `O` 中（因此实际上，程序可以像缓冲区 `O` 在运行时被捐献一样执行）。
