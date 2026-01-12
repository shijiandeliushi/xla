import sys
from jax.lib import xla_client

def convert_hlo_to_dot(hlo_path, dot_path):
    print(f"正在读取文件: {hlo_path} ...")
    with open(hlo_path, 'r') as f:
        hlo_text = f.read()

    try:
        print("正在解析 HLO 文本...")
        # JAX 0.4.23 的标准路径
        hlo_module = xla_client._xla.hlo_module_from_text(hlo_text)
        
        print("正在生成 DOT 图...")
        # JAX 0.4.23 的标准导出方法
        dot_txt = xla_client._xla.hlo_module_to_dot_graph(hlo_module)
        
        with open(dot_path, 'w') as f:
            f.write(dot_txt)
            
        print(f"✅ 成功! DOT 文件已保存: {dot_path}")
        print("-" * 40)
        print(f"请运行命令生成图片: dot -Tsvg {dot_path} -o result.svg")
        
    except AttributeError:
        print("❌ 错误: 即使降级后仍找不到属性。请检查 jaxlib 是否也降级成功。")
        print("尝试运行: pip list | grep jax")
    except Exception as e:
        print(f"❌ 解析失败: {e}")
        print("如果提示 parsing error，说明你的 .hlo 文件语法可能有问题。")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("用法: python hlo_to_dot.py <你的文件.hlo>")
    else:
        convert_hlo_to_dot(sys.argv[1], sys.argv[1] + ".dot")