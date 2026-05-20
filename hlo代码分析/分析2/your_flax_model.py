import jax
import jax.numpy as jnp
import flax.linen as nn
import os
# ==========================================
# 1. 定义多层感知机 (MLP) 模型
# ==========================================
class SimpleMLP(nn.Module):
    # 定义每一层神经元的个数
    hidden_dims: list

    @nn.compact
    def __call__(self, x):
        # 遍历除了最后一层之外的所有隐藏层
        for dim in self.hidden_dims[:-1]:
            x = nn.Dense(dim)(x)      # 全连接层 (产生 Dot 和 Add 指令)
            x = nn.relu(x)            # 激活函数 (产生 Maximum 指令)
            
        # 最后一层通常不加激活函数
        x = nn.Dense(self.hidden_dims[-1])(x)
        return x

# ==========================================
# 2. 初始化模型和参数
# ==========================================
print("正在初始化模型...")
os.environ["XLA_FLAGS"] = "--xla_dump_to=/home/xianghonghui/xla/hlo代码分析/分析2  --xla_dump_hlo_as_text --xla_dump_hlo_as_dot  --xla_hlo_profile "

# 实例化模型：输入 -> 512 -> 256 -> 128 (输出)
model = SimpleMLP(hidden_dims=[512, 256, 128])

# 伪造一个输入数据：Batch Size = 64, 特征维度 = 1024
dummy_input = jnp.ones((64, 1024), dtype=jnp.float32)

# 初始化模型权重 (随机种子为 0)
# variables 里面包含了所有的 weights(权重矩阵) 和 biases(偏置向量)
rng_key = jax.random.PRNGKey(0)
variables = model.init(rng_key, dummy_input)

# ==========================================
# 3. 核心：使用 JIT 编译触发 XLA
# ==========================================
# 我们把模型的前向传播 (apply) 封装起来，并加上 @jax.jit 装饰器
@jax.jit
def forward_step(params, x):
    return model.apply(params, x)

print("开始触发 XLA 编译 (此时会生成 HLO Dump 文件)...")

# 第一次调用函数时，JAX 会追踪代码并呼叫 XLA 进行完整编译！
output = forward_step(variables, dummy_input)

# 使用 block_until_ready() 确保异步计算在 GPU/CPU 上真正执行完毕
output.block_until_ready() 
print("2. 开始性能追踪 (Profiling)...")
# 开启追踪，指定保存路径
jax.profiler.start_trace("/home/xianghonghui/xla/hlo代码分析/分析2/jax_profile")

# 连续跑 10 次，让时间轴更明显
for _ in range(10):
    forward_step(variables, dummy_input).block_until_ready()

# 停止追踪
jax.profiler.stop_trace()

print(f"执行成功！输出张量的形状是: {output.shape}")