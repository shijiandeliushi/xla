import jax
import jax.numpy as jnp
import flax.linen as nn
import os

# ==========================================
# 1. 定义单层重量级 Transformer
# ==========================================
class HeavyTransformerLayer(nn.Module):
    d_model: int
    num_heads: int
    ff_dim: int

    @nn.compact
    def __call__(self, x):
        batch, seq_len, _ = x.shape
        head_dim = self.d_model // self.num_heads

        # --- 第一部分：多头自注意力 (Multi-Head Attention) ---
        # 产生大规模的 Dot
        q = nn.Dense(self.d_model)(x)
        k = nn.Dense(self.d_model)(x)
        v = nn.Dense(self.d_model)(x)

        # 产生疯狂的内存重排 (Reshape + Transpose)
        # 形状变换: [Batch, Seq, Heads*Dim] -> [Batch, Heads, Seq, Dim]
        q = q.reshape((batch, seq_len, self.num_heads, head_dim)).transpose((0, 2, 1, 3))
        k = k.reshape((batch, seq_len, self.num_heads, head_dim)).transpose((0, 2, 1, 3))
        v = v.reshape((batch, seq_len, self.num_heads, head_dim)).transpose((0, 2, 1, 3))

        # 注意力打分 (Dot + 缩放)
        scores = jnp.matmul(q, k.transpose((0, 1, 3, 2))) / jnp.sqrt(head_dim)

        # 性能黑洞: Softmax (包含 Exp, Reduce, Broadcast)
        attn = jax.nn.softmax(scores, axis=-1)

        # 融合上下文并转置回原形状
        context = jnp.matmul(attn, v)
        context = context.transpose((0, 2, 1, 3)).reshape((batch, seq_len, self.d_model))
        
        # 残差连接
        out = nn.Dense(self.d_model)(context)
        x = x + out

        # --- 第二部分：前馈神经网络 (Feed Forward Network) ---
        # 巨大的矩阵乘法和激活函数
        ffn = nn.Dense(self.ff_dim)(x)
        ffn = nn.gelu(ffn) # GELU 激活函数，比 ReLU 复杂得多
        ffn = nn.Dense(self.d_model)(ffn)
        x = x + ffn

        return x

# ==========================================
# 2. 定义深层网络 (堆叠 6 层)
# ==========================================
class HeavyModel(nn.Module):
    @nn.compact
    def __call__(self, x):
        # 循环 6 次（在 HLO 里会被展开成极其庞大的计算图）
        for _ in range(6):
            x = HeavyTransformerLayer(d_model=1024, num_heads=16, ff_dim=4096)(x)
        return x

# ==========================================
# 3. 运行配置与触发编译
# ==========================================
# 强制开启 XLA Dump
os.environ["XLA_FLAGS"] = "--xla_dump_to=/home/xianghonghui/xla/hlo代码分析/分析3  --xla_dump_hlo_as_dot"

print("正在初始化百兆级模型...")
model = HeavyModel()

# 制造巨大的假数据: Batch=32, 句子长度=512, 维度=1024
# 这将吃掉大量的 CPU 内存和缓存！
dummy_input = jnp.ones((32, 512, 1024), dtype=jnp.float32)

rng_key = jax.random.PRNGKey(0)
variables = model.init(rng_key, dummy_input)

@jax.jit
def forward_step(params, x):
    return model.apply(params, x)

print("开始触发 XLA 巨型图编译 (这可能需要等待 10~30 秒)...")
# 这一次调用不仅会编译，还会顺便 Dump 出我们要的 HLO 文件
output = forward_step(variables, dummy_input)
output.block_until_ready()

print("HLO Dump 完成！请去 /tmp/heavy_dumps 找文件。")