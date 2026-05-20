import os
import shutil

# ==============================================================================
# 🚨 极其关键的第一步：必须在 IMPORT JAX 之前设置环境变量！ 🚨
# ==============================================================================
# 1. --xla_hlo_profile: 强迫编译器在生成的机器码中插入毫秒级计时器。
# 2. --xla_dump_to: 保存 HLO 文本，供我们静态分析。
DUMP_DIR = "/home/xianghonghui/xla/hlo代码分析/分析5/xla_final_dump"
PROFILE_DIR = "/home/xianghonghui/xla/hlo代码分析/分析5/xla_final_profile"

os.environ["XLA_FLAGS"] = f"--xla_hlo_profile --xla_dump_to={DUMP_DIR} --xla_dump_hlo_as_dot"

# 清理旧的缓存文件，防止 TensorBoard 读取到历史错误数据
shutil.rmtree(DUMP_DIR, ignore_errors=True)
shutil.rmtree(PROFILE_DIR, ignore_errors=True)
os.makedirs(DUMP_DIR, exist_ok=True)
os.makedirs(PROFILE_DIR, exist_ok=True)

# 设置完环境变量后，再导入 JAX
import jax
import jax.numpy as jnp
import flax.linen as nn

print(f"✅ XLA 环境变量已挂载。Dump路径: {DUMP_DIR}")

# ==============================================================================
# 2. 定义一个“重量级”模型 (确保 CPU 算得足够久，才会被抓取到)
# ==============================================================================
class HeavyBlock(nn.Module):
    @nn.compact
    def __call__(self, x):
        # 连续做 4 次巨大的矩阵乘法和激活，制造绝对的计算热点
        for _ in range(4):
            x = nn.Dense(2048)(x)
            x = nn.gelu(x)
        return x

print("正在初始化模型和数据...")
model = HeavyBlock()
# 制造巨大的假数据: Batch=128, 维度=2048
dummy_input = jnp.ones((128, 2048), dtype=jnp.float32)

rng_key = jax.random.PRNGKey(0)
variables = model.init(rng_key, dummy_input)

@jax.jit
def forward_step(params, x):
    return model.apply(params, x)

# ==============================================================================
# 3. 预热 (Warmup) - 把“编译时间”和“运行时间”严格分开！
# ==============================================================================
print("🔥 开始预热并触发 XLA 编译 (此时会生成 HLO Dump 文件)...")
# 第一次运行会触发编译，我们不记录这段时间
warmup_out = forward_step(variables, dummy_input)
warmup_out.block_until_ready() # 必须阻塞，确保编译和首次执行彻底完成
print("✅ 预热完成！")

# ==============================================================================
# 4. 正式性能追踪 (Profiling)
# ==============================================================================
print(f"⏱️ 开始性能追踪... 数据将保存在 {PROFILE_DIR}")

# 使用 with 语句，极其安全地包裹我们要测速的代码
with jax.profiler.trace(PROFILE_DIR, create_perfetto_link=True):
    # 连续跑 20 次，强行拉长运行时间，确保 Profiler 采样到足够多的数据！
    for i in range(20):
        out = forward_step(variables, dummy_input)
        out.block_until_ready() # 每一轮都必须阻塞等待完成！

print("✅ 追踪结束！")
print("=" * 60)
print(f"请在终端运行以下命令启动 TensorBoard：")
print(f"tensorboard --logdir={PROFILE_DIR} --port=8791")
print("=" * 60)