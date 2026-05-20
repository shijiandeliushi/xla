> 本文翻译自 docs/developer_guide.md

# XLA 开发者指南

本指南向您展示如何开始开发 XLA 项目。

在开始之前，请完成以下先决条件：

1.  访问[贡献页面](contributing.md)并查看贡献流程。
2.  如果您尚未这样做，请签署[贡献者许可协议](https://cla.developers.google.com/about)。
3.  安装或配置以下依赖项：
    -   一个[GitHub](https://github.com/)账户
    -   [Docker](https://www.docker.com/)

然后按照以下步骤获取源代码、设置环境、构建仓库并创建拉取请求。

## 获取代码

1.  创建[XLA 仓库](https://github.com/openxla/xla)的一个 fork。
2.  克隆您的 fork 仓库，将 `{USER}` 替换为您的 GitHub 用户名：
    ```sh
    git clone https://github.com/{USER}/xla.git
    ```

3.  进入 `xla` 目录：`cd xla`

4.  配置远程上游仓库：
    ```sh
    git remote add upstream https://github.com/openxla/xla.git
    ```

## 设置环境

1.  安装 [Bazel](https://bazel.build/install).

    要构建 XLA，您必须安装 Bazel。推荐的安装 Bazel 的方法是使用[Bazelisk](https://github.com/bazelbuild/bazelisk#readme),它会自动为 XLA 下载正确的 Bazel 版本。如果 Bazelisk 不可用，您可以手动[安装 Bazel](https://bazel.build/install)。

2.  创建并运行[ml-build](https://us-docker.pkg.dev/ml-oss-artifacts-published/ml-public-container/ml-build)Docker 容器。

    要为构建同时支持 CPU 和 GPU 的 XLA 设置 Docker 容器，请运行以下命令：

    ```sh
    docker run -itd --rm \
      --name xla \
      -w /xla \
      -v $PWD:/xla \
      us-docker.pkg.dev/ml-oss-artifacts-published/ml-public-container/ml-build:latest \
      bash
    ```

    如果构建支持 GPU/CUDA，请添加 `--gpus all` 以使容器能够访问所有可用的 GPU。这将启用 CUDA 计算能力的自动检测。

## 构建

为 CPU 配置：

```sh
docker exec xla ./configure.py --backend=CPU
```

为 GPU 配置：

```sh
docker exec xla ./configure.py --backend=CUDA
```

CUDA 计算能力将通过运行`nvidia-smi`自动检测。如果构建期间没有 GPU 可用，您必须手动指定计算能力。例如：
```sh
# 自动检测计算能力（需要 GPU）
./configure.py --backend=CUDA

# 手动指定计算能力（适用于没有 GPU 的构建）
./configure.py --backend=CUDA --cuda_compute_capabilities="9.0"
```

构建：

```sh
docker exec xla bazel build \
  --spawn_strategy=sandboxed \
  --test_output=all \
  //xla/...
```

**注意:**  您可以在没有 GPU 的机器上构建 XLA。在这种情况下：

- 启动 Docker 容器时 **不要** 使用 `--gpus all` 标志。
- 在 `./configure.py`期间，使用 `--cuda_compute_capabilities` 标志手动指定 CUDA 计算能力。

**注意:**  得益于封闭式 CUDA 规则，您无需在 Docker 容器内构建 XLA。您可以直接在您的机器上为 GPU 构建 XLA——即使它没有安装 GPU 或 NVIDIA 驱动程序。

```sh
# 自动检测计算能力（需要 GPU）
./configure.py --backend=CUDA

# 手动指定计算能力（适用于没有 GPU 的构建）
./configure.py --backend=CUDA --cuda_compute_capabilities="9.0"

bazel build \
  --spawn_strategy=sandboxed \
  --test_output=all \
  //xla/...
```

您的第一次构建将花费相当长的时间，因为它必须构建整个栈，包括 XLA、MLIR 和 StableHLO。

要了解更多关于构建 XLA 的信息，请参阅[从源代码构建](build_from_source.md).

## 创建拉取请求

当您准备好发送更改以供审查时，请创建一个[拉取请求](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests).

要了解 XLA 代码审查理念，请参阅[审查流程](contributing.md#review-process).
