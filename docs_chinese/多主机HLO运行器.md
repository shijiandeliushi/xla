> 本文翻译自 docs/tools_multihost_hlo_runner.md

# 多主机 HLO 运行器

此工具允许您在一个或多个 GPU 上运行 HLO 模块。它还允许编译面向多个 GPU 的代码而不运行它。

## 运行多 GPU（分片）HLO

可以通过 `sharding=` 标注识别这些 HLO。例如 `sharding={devices=[1,1,2,1]0,1}` 表示标注的张量应沿第 3 维分片到 2 个 GPU（GPU0 和 GPU1）。

以下说明假设工作目录是 XLA Git 仓库且已运行 `./configure.py`。

如果有足够的 GPU，可以像这样重放 HLO：

```
bazel run //xla/tools/multihost_hlo_runner:hlo_runner_main -- my-hlo.txt
```

提示：如果输入生成太慢或使用太多主机内存，考虑使用 `--hlo_argument_mode=uninitialized`。

也可以不运行仅编译相同 HLO：

```
bazel run //xla/tools/multihost_hlo_runner:hlo_runner_main -- --run=false my-hlo.txt
```

在这种情况下只需要一个 GPU，除非使用了[自动调优缓存](./persisted_autotuning)。

### 故障排除

- `Check failed: result.replicas >= 1 (0 vs. 1)` 等错误：确保有足够的 GPU，`CUDA_VISIBLE_DEVICES` 必须设置正确或完全不设置
- 崩溃：可能需要使用 `--dynamic_mode=off`，确保 CUDA 和 cuDNN 设置正确

## 单进程，多 GPU 示例

### 设置并获取 HLO

```bash
# 8 是 GPU 数量
(export XLA_FLAGS="--xla_dump_to=/tmp/dump"; test-pax.sh --fsdp 8 --batch-per-gpu 1)

ls -lSh /tmp/dump/*before_optimizations.txt
# 最大的文件通常是您关心的那个
```

### 构建 XLA 多主机运行器

```bash
cd /opt/xla/
./configure.py --backend CUDA --nccl
bazel build //xla/tools/multihost_hlo_runner:hlo_runner_main
```

### 单进程示例：优化前图重放

```bash
bazel run //xla/tools/multihost_hlo_runner:hlo_runner_main -- \
  /tmp/dump/module_0023.pjit__wrapped_step_fn.before_optimizations.txt
```

### 单进程示例：优化后图重放

重放优化后的 HLO 必须使用 `--xla_disable_all_hlo_passes` 或 `--run_xla_backend_only`。否则 XLA 将尝试重新编译 HLO，这不被支持。

```bash
bazel run //xla/tools/multihost_hlo_runner:hlo_runner_main -- \
  --run_xla_backend_only \
  /tmp/dump/module_0023.pjit__wrapped_step_fn.sm_8.0_gpu_after_optimizations.txt
```

## 多进程，单节点

### 使用 MPI 在单节点上运行

创建 bash 脚本 `run.sh`：

```bash
#!/bin/bash
export CUDA_VISIBLE_DEVICES=${OMPI_COMM_WORLD_LOCAL_RANK}
bazel run //xla/tools/multihost_hlo_runner:hlo_runner_main -- \
  --task_id=${OMPI_COMM_WORLD_RANK} \
  --num_nodes=${OMPI_COMM_WORLD_SIZE} \
  --address=127.0.0.1:12345 \
  /tmp/dump_multi_process/module_0023.pjit__wrapped_step_fn.before_optimizations.txt
```

使用 mpirun 执行：

```bash
chmod a+x run.sh
mpirun --allow-run-as-root -np 8 run.sh
```

### 使用 SLURM 在多个节点上运行

在 SLURM 作业中转发 SLURM 环境变量：

```bash
bazel run //xla/tools/multihost_hlo_runner:hlo_runner_main -- \
  --task_id=${SLURM_PROCID} \
  --num_nodes=${SLURM_NTASKS} \
  --address="${SLURM_LAUNCH_NODE_IPADDR}:12345" \
  /tmp/dump_multi_process/module_0023.pjit__wrapped_step_fn.before_optimizations.txt
```
