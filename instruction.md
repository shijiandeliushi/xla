# 1.11 利用工具调用XLA编译功能
## 调用过程
+ 项目根目录下有一个`hlo_test.hlo`文件，里面是hlo中间代码，在项目跟目录下运行`./bazel-bin/xla/tools/hlo-opt --passes=dce dce_test.hlo`命令，在终端可以看见打印出来的优化代码，`--passes=dce`（消除死代码）为这一边扫描所进行的优化，可作为参数的选项在WPS文档中有说明。
## HLO中间代码可视化
### 先创建一个虚拟环境
这是一个非常好的习惯！在 Ubuntu 上，使用虚拟环境可以避免污染系统的 Python 环境。

以下是使用 Python 自带的 `venv` 模块创建、激活并配置环境的完整步骤：

#### 第一步：安装 venv 模块
Ubuntu 默认安装了 Python 3，但通常**没有**预装 `venv` 模块，你需要先手动安装一下。

打开终端，运行：
```bash
sudo apt update
sudo apt install python3-venv
```

#### 第二步：创建虚拟环境
建议在你的项目文件夹下创建。假设你的 `.hlo` 文件和转换脚本都在 `~/桌面` 或某个文件夹里：

1.  进入你的工作目录：
    ```bash
    cd ~/桌面  # 或者你的代码所在的目录
    ```

2.  创建虚拟环境（我们给它起名叫 `hlo_env`）：
    ```bash
    python3 -m venv hlo_env
    ```
    *执行完后，你会发现当前目录下多了一个 `hlo_env` 的文件夹。*

#### 第三步：激活虚拟环境
你需要“告诉”终端，接下来的 Python 命令都要在这个虚拟环境里执行。

运行：
```bash
source hlo_env/bin/activate
```

**成功标志：**
激活后，你的终端提示符前面会出现一个括号，显示 `(hlo_env)`，例如：
`(hlo_env) xianghonghui@xianghonghui-Legion...:~/桌面$`

#### 第四步：安装必要的库 (JAX)
现在环境是干净的，你需要安装刚才脚本依赖的库。

1.  先升级一下 pip (推荐)：
    ```bash
    pip install --upgrade pip
    ```

2.  安装 JAX (CPU 版本即可，用来解析 HLO)：
    ```bash
    pip install "jax==0.4.23" "jaxlib==0.4.23"
    ```
   **注意版本对应**

### 安装图形转换器（注意安装在虚拟环境中）
+ `sudo apt install graphviz`

### 创建转换脚本（已经实现）
+ 在项目根目录文件夹下的`hlo_to_dot.py`即为转换脚本。

### hlo->矢量图（SVG）
+ `python3 hlo_to_dot.py hlo_test.hlo`  生成`hlo_test.hlo.dot`

+ `dot -Tsvg hlo_test.hlo.dot -o result.svg` 生成`result.svg`矢量图

