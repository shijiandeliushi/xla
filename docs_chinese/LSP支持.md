> 本文翻译自 docs/lsp.md

# 使用 clangd 配置 LSP

## 背景

Emacs、Vim 或 VS Code 等编辑器通过 [LSP](https://en.wikipedia.org/wiki/Language_Server_Protocol)（语言服务器协议）支持代码导航、代码补全、行内编译器错误消息等功能。一个常用的支持 LSP 的语言服务器是 [clangd](https://clangd.llvm.org)，它依赖于项目中存在 `compile_commands.json` 文件——一个记录项目中每个文件编译命令的 JSON 文件。

## 如何为 XLA 源码生成 `compile_commands.json`？

使用 [`build_tools/lint/generate_compile_commands.py`](https://github.com/openxla/xla/blob/main/build_tools/lint/generate_compile_commands.py) 脚本。从 XLA 仓库根目录执行以下命令，即可在当前目录生成 `compile_commands.json` 文件：

```shell
bazel aquery "mnemonic(CppCompile, //xla/...)" --output=jsonproto \
  | python3 build_tools/lint/generate_compile_commands.py
```
