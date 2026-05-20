import jax

jax.profiler.start_trace("/home/xianghonghui/xla/hlo代码分析/分析4/jax_profile")

# Run the operations to be profiled
key = jax.random.key(0)
x = jax.random.normal(key, (5000, 5000))
y = x @ x
y.block_until_ready()

jax.profiler.stop_trace()