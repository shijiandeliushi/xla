# 从源代码构建

本文档介绍如何构建 XLA 组件。

如果您尚未克隆 XLA 仓库或安装 Bazel，请查阅 [XLA 开发者指南](developer_guide.md)的开头部分。

## Linux

### 配置

XLA 的构建由仓库根目录下的 `.bazelrc` 文件配置。可以使用 `./configure.py` 脚本调整常用设置。

如果需要更改配置，请在仓库根目录下运行 `./configure.py` 脚本。此脚本带有用于指定 XLA 依赖项位置和附加构建配置选项（例如编译器标志）的标志。有关详细信息，请参阅示例会话部分。

### CPU 支持

我们建议使用合适的 Docker 镜像——例如[ml-build](https://us-docker.pkg.dev/ml-oss-artifacts-published/ml-public-container/ml-build)XLA 在 GitHub 上的 CI 工作流中也使用此镜像）——来构建和测试 XLA。ml-build 镜像预装了 Clang 18。

```sh
docker run -itd --rm \
--name xla \
-w /xla \
-v $PWD:/xla \
us-docker.pkg.dev/ml-oss-artifacts-published/ml-public-container/ml-build:latest \
bash
```

使用 Docker 容器，可以通过运行以下命令构建带有 CPU 支持的 XLA：

```sh
docker exec xla ./configure.py --backend=CPU

docker exec xla bazel build \
  --spawn_strategy=sandboxed \
  --test_output=all \
  //xla/...
```

如果希望 **在不使用 Docker 的情况下**构建带有 CPU 支持的 XLA 目标，则需要安装 Clang。XLA 当前在 CI 中使用 Clang 18 构建，但早期版本应该也能工作。

要配置并构建目标，请运行以下命令：

```sh
./configure.py --backend=CPU

bazel build \
  --spawn_strategy=sandboxed \
  --test_output=all \
  //xla/...
```

### GPU 支持

我们建议使用上述相同的 Docker 容器来构建带有 GPU 支持的 XLA。

要启动可访问所有 GPU 的 Docker 容器，请运行以下命令：


```sh
docker run -itd --rm \
  --gpus all \
  --name xla_gpu \
  -w /xla \
  -v $PWD:/xla \
  us-docker.pkg.dev/ml-oss-artifacts-published/ml-public-container/ml-build:latest \
  bash
```

要构建带有 GPU 支持的 XLA，请运行以下命令：

```sh
docker exec xla_gpu ./configure.py --backend=CUDA

docker exec xla_gpu bazel build \
  --spawn_strategy=sandboxed \
  --test_output=all \
  //xla/...
```

**注意:** 可以在没有 GPU 的机器上构建 XLA。在这种情况下：

- 启动 Docker 容器时 **不要** 使用 `--gpus all` 标志。
- 手动指定 CUDA 计算能力。例如：

```
docker exec xla_gpu ./configure.py --backend=CUDA \
  --cuda_compute_capabilities="9.0"
```

有关[ TensorFlow GPU Docker 镜像的更多详细信息，可以查阅此文档。](https://www.tensorflow.org/install/source#gpu_support_2)

也可以在不使用 Docker 的情况下构建带有 GPU 支持的 XLA 目标。使用以下命令配置并构建目标：

```sh
./configure.py --backend=CUDA

bazel build \
  --spawn_strategy=sandboxed \
  --test_output=all \
  //xla/...
```

有关[封闭式 CUDA 的更多详细信息，可以查阅此文档。](https://github.com/google-ml-infra/rules_ml_toolchain/blob/main/gpu)

### 使用 JAX CI/Release 容器构建支持 CUDA/cuDNN 的 XLA

XLA 是 JAX 内部使用的编译器。JAX 通过 PyPI wheels 分发。[JAX 持续集成文档](https://github.com/jax-ml/jax/tree/main/ci#running-these-scripts-locally-on-your-machine)
解释了如何使用 [tensorflow/ml-build:latest](https://us-central1-docker.pkg.dev/tensorflow-sigs/tensorflow/ml-build) Docker 容器构建 JAX wheels。

我们可以扩展这些说明，在 JAX 容器内构建 XLA 目标。这可以确保 XLA 目标的构建配置与 JAX/XLA 的构建配置一致，如果我们想要使用最初在 JAX 中创建的 XLA 工具重现工作负载结果，这将非常有用。

#### 在 JAX CI 容器中构建 XLA 目标

1. 克隆 JAX 仓库并进入 'jax' 目录
```bash
git clone https://github.com/jax-ml/jax.git

cd jax
```

2. 通过运行以下命令启动 JAX CI/Release Docker 容器：
```bash
./ci/utilities/run_docker_container.sh
```

这将启动一个名为 'jax' 的 Docker 容器。

3. 在容器内使用以下命令构建 jax-cuda-plugin 目标：
```bash
docker exec jax ./ci/build_artifacts.sh jax-cuda-plugin
```

这将创建包含所需构建配置（包括 CUDA/cuDNN 支持）的 .jax_configure.bazelrc 文件。

4. 访问容器内的交互式 shell：
```bash
docker exec -ti jax /bin/bash
```

您现在应该处于容器内的 /jax 目录中。

5. 使用以下命令构建 XLA 目标，例如：
```bash
/usr/local/bin/bazel build \
  --config=cuda_libraries_from_stubs \
  --verbose_failures=true \
  @xla//xla/tools/multihost_hlo_runner:hlo_runner_main
```

可选地，可以覆盖 `HERMETIC` 环境变量，例如：
```bash
--repo_env=HERMETIC_CUDA_COMPUTE_CAPABILITIES="sm_90"
```

6. 如果需要，将生成的 artifacts 复制到 `/jax/dist` 以便从主机操作系统访问：
```bash
cp bazel-bin/external/xla/xla/tools/multihost_hlo_runner/hlo_runner_main \
  ./dist/
```

7. 退出交互式 shell：
```bash
exit
```
