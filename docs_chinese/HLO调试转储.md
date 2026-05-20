> 本文翻译自 docs/hlo_dumps.md

# 转储 HLO 计算体

HLO dump 是 HLO 模块在计算不同阶段的文本表示，对调试非常有用，通常在提交 bug 报告时也需要包含它。它通常是一个人类可读的**文本文件**，列出 HLO 指令及其属性。有时 HLO 模块也会被转储为：

- **HloProto**：Protocol buffer 文件，一种更加结构化、机器可读的格式。
- **HloSnapshot**：包含 HLO 模块及其输入。由于重放 HLO 有时需要给计算提供实际的输入数据，而不仅仅是随机数据。

您可以使用 XLA 标志来指定并获取 dump。大多数情况下，可以通过环境变量来设置。JAX 还提供了程序化的方式来打印 HLO dump。

## 本地执行

### 使用环境变量

您可以通过设置 `XLA_FLAGS` 环境变量以及相应的标志来获取 dump。这适用于 JAX、TensorFlow 和 PyTorch/XLA。

要将 HLO 模块和其他调试信息转储到指定目录，在运行程序时添加 `--xla_dump_to` 标志：

```shell
XLA_FLAGS="--xla_dump_to=DIRECTORY_PATH"
```

例如，可以用 `/tmp` 或 `/tmp/xladump` 作为路径。默认情况下，这会在优化流水线的起始和结束时将 HLO 模块以文本形式转储。

您也可以显式指定格式：

1. 文本转储：
```shell
XLA_FLAGS="--xla_dump_hlo_as_text --xla_dump_to=DIRECTORY_PATH"
```

2. HLO protos：
```shell
XLA_FLAGS="--xla_dump_hlo_as_proto --xla_dump_to=DIRECTORY_PATH"
```

3. HLO Snapshots：
```shell
XLA_FLAGS="--xla_dump_hlo_snapshots --xla_dump_to=DIRECTORY_PATH"
```

4. 使用 graphviz 服务器进行图形渲染（仅适用于小型图）：
```shell
XLA_FLAGS="--xla_dump_hlo_as_url --xla_dump_to=DIRECTORY_PATH"
```

5. 渲染为 HTML 文件（仅适用于小型图）：
```shell
XLA_FLAGS="--xla_dump_hlo_as_html --xla_dump_to=DIRECTORY_PATH"
```

对于较大的图，可以使用 `interactive_graphviz` 对图的局部进行可视化。

**注意：** 如果未指定 `--xla_dump_to` 但指定了其他转储标志，将转储到 stdout。但 stdout 不会包含二进制数据（如 proto 文件）。

## 转储特定中间 Pass 的结果

除了标准的预优化/最终优化 HLO 之外，您还可以转储经过特定编译器 Pass 之后的 HLO 状态：

```shell
XLA_FLAGS="--xla_dump_hlo_pass_re=regex --xla_dump_to=DIRECTORY_PATH"
```

正则表达式匹配到的 Pass 的 HLO 模块都会被转储。例如，通过以下方式观察 SPMD 分区相关 Pass 产生的 HLO：

```shell
XLA_FLAGS="--xla_dump_to=DIRECTORY_PATH --xla_dump_hlo_pass_re=spmd|propagation"
```

要在每个 XLA Pass 之后都转储结果（会产生大量文件）：

```shell
XLA_FLAGS="--xla_dump_to=DIRECTORY_PATH --xla_dump_hlo_pass_re=.*"
```

### JAX 专有选项

#### 在 JAX 中程序化控制

除了通过标志或环境变量，您还可以使用 JAX 的 `lower` 和 `compile` API 程序化地转储 HLO：

```python
# 本地获取未优化的 lowered HLO
jax.jit(f).lower(*args).as_text('hlo')

# 在 HLO 编译 Pass 期间转储到文件
compilation_args = {
    'xla_dump_to': DIRECTORY_PATH,
    'xla_dump_hlo_pass_re': 'spmd|propagation',
}
jax.jit(f).lower(*args).compile(compilation_args)
```

#### 转储 jaxpr

[`jaxpr`](https://docs.jax.dev/en/latest/jaxpr.html) 是 JAX 用于程序追踪的中间表示。要转储它，设置环境变量：

```shell
JAX_DUMP_IR_TO="DIRECTORY_PATH" JAX_DUMP_IR_MODES=jaxpr
```

## Google Colab

在 notebook 的第一个执行 Cell 中使用 `os.environ` 设置 `XLA_FLAGS`（因为环境变量和命令行标志通常只处理一次，比如在模块导入时或 XLA 后端初始化时）：

```python
import os
os.environ['XLA_FLAGS'] = "--xla_dump_to=DIRECTORY_PATH"
```

也可以在 JAX 中直接打印计算体的 HLO：

```python
# 打印预优化的 HLO
c = jax.jit(f).lower(3.).compiler_ir('hlo')
print(c.as_hlo_text())

# 打印优化后的 HLO
def optimized_HLO(f, *args, platform=None):
    print(jax.jit(f).lower(*args).compile().as_text())
```

## 更多 HLO Dump 操作

### HLO 格式转换

`hlo-opt` 工具可以在 HLOProto 和文本格式之间进行转换。当您有其中一种格式但需要另一种格式进行调试时，这非常有用。参见 [XLA 工具链文档](tools.md#hlo-opt-convert-hlo-module-formats)。

### 重放

您可以在指定 XLA 后台上使用伪造数据或输入快照运行（重放）转储的计算体：

```shell
# CPU backend
bazel run -c opt //xla/hlo/tools:run_hlo_module -- --platform=cpu /tmp/xladump/module_4561.before_optimizations.txt

# GPU backend
bazel run -c opt //xla/hlo/tools:run_hlo_module -- --platform=CUDA /tmp/xladump/module_4561.before_optimizations.txt
```
