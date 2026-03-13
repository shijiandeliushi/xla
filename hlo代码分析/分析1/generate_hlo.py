# generate_hlo.py
import jax
import jax.numpy as jnp

# 1. 核心：使用 @jax.jit 装饰器
# 这告诉 JAX：“不要用 Python 解释执行，把这个函数翻译成 HLO，交给 XLA 编译！”
@jax.jit
def my_neural_net(x, w, b):
    # 矩阵乘法: x * w
    dot_result = jnp.dot(x, w)
    # 加偏置
    add_result = dot_result + b
    # ReLU 激活函数: max(0, val)
    return jnp.maximum(0.0, add_result)

# 2. 准备输入数据 (定义形状)
# 注意：XLA 是静态图编译器，它需要知道具体的 Shape 才能开始编译。
batch_size = 10
features = 32
output_dim = 64

x = jnp.ones((batch_size, features))
w = jnp.ones((features, output_dim))
b = jnp.ones((output_dim,))

print("准备开始编译并运行...")

# 3. 第一次调用函数 (此时会触发 XLA 编译！也就是你想要的 HLO 生成时刻)
result = my_neural_net(x, w, b)

print("运行结束，结果形状:", result.shape)

//说明：XLA_FLAGS="--xla_dump_to=/home/xianghonghui/xla/hlo代码分析/分析1 --xla_dump_hlo_as_text" python generate_hlo.py