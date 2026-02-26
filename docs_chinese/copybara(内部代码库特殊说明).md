# Copybara 特殊说明
本文档旨在描述您在贡献代码时可能遇到的一些奇特现象，这些现象是由于用于管理从 Google 内部代码库来回复制源代码的工具造成的。该工具称为 [Copybara](https://github.com/google/copybara).

## 内部事实来源

由于此仓库中代码的事实来源是 Google 的内部代码库，因此每当代码被导入和导出时，Copybara 都会对代码进行转换。这意味着，有时看似正常的更改可能会在内部以令人惊讶的方式失败。

## PR 合并状态与差异不一致

由于事实来源是内部的，PR 不会直接合并，而是被导入到 Google 内部代码库，在那里它们会接受额外的测试，然后该内部更改会被提交，并归功于 PR 作者。由于 Copybara 应用的转换，无法保证差异（diff）完全相同（例如，Copybara 在导入时会应用格式化）。

因此，Copybara 不会将 PR 标记为已合并，它会关闭 PR，并单独应用一个应该与 PR 非常匹配的提交。

## 通过复制依赖 TSL

按照目前的实现，为了防止出现任何临时的损坏提交，XLA 不是通过使用 Bazel 的 `http_archive`下载 TSL 副本，而是通过让 Copybara 将 TSL 复制到 XLA 的 `third_party` 目录中来依赖 TSL。
