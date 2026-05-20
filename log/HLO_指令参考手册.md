# HLO 指令操作参考手册

> 本文档面向 HLO (High-Level Optimizer) 初学者，系统整理了 HLO IR 中常用指令的含义、参数和使用示例。
> 示例主要来自 `xla/tools/data/stage3_demo/` 目录下的 Stage 3 Pass 演示文件。

---

## 目录

1. [基础概念](#1-基础概念)
2. [逐元素运算](#2-逐元素运算)
3. [张量形状操作](#3-张量形状操作)
4. [数据切片与索引](#4-数据切片与索引)
5. [规约操作](#5-规约操作)
6. [线性代数](#6-线性代数)
7. [控制流与复合操作](#7-控制流与复合操作)
8. [类型转换](#8-类型转换)
9. [集合通信](#9-集合通信)
10. [随机数与常量生成](#10-随机数与常量生成)
11. [参数速查表](#11-参数速查表)

---

## 1. 基础概念

### 1.1 HLO 模块结构

```
HloModule demo                   // 模块名
                                 //
%sub_computation {               // 子计算体（可被 call/map/reduce 等引用）
  %p0 = f32[] parameter(0)       //   参数
  ROOT %result = f32[] add(%p0, %p0)  //   ROOT = 计算体输出
}                                //
                                 //
ENTRY %main {                    // 入口计算体（程序起点）
  %x = f32[3,3] parameter(0)    //   指令: %name = shape opcode(operands), attributes
  ROOT %y = f32[3,3] tanh(%x)   //   ROOT = 模块输出
}
```

### 1.2 指令格式

```
%name = shape opcode(operand1, operand2, ...), attribute1=value1, attribute2=value2
```

- `%name`: 指令名称，以 `%` 开头
- `shape`: 输出张量的形状和元素类型，如 `f32[3,3]`、`pred[4]`、`(f32[10], s32[10])`（元组）
- `opcode`: 操作码，如 `add`、`dot`、`gather`
- `operands`: 输入操作数，可以是 `%name` 或 `parameter(0)` 等
- `attributes`: 属性列表，用逗号分隔

### 1.3 形状表示

```
f32[3,3]{1,0}    // 3行3列的 f32 矩阵
                 // {1,0} 是 layout: 最小编号维度(0)是最内层维度
                 // 即 dim0=列(row-major: 第0维=最外层)
                 // 维度索引从 0 开始: dim0=3行, dim1=3列

s32[2,4]{1,0}    // 2行4列的 s32 矩阵

pred[100]{0}     // 长度100的布尔向量

(f32[10], s32[10])  // 元组: 包含 f32[10] 和 s32[10] 两个张量

f32[3,0]         // 零维度张量: 3行但0列, 不包含任何元素
```

### 1.4 元素类型

| HLO 表示 | 含义 | 说明 |
|----------|------|------|
| `f32` | 32位浮点数 | float |
| `f64` | 64位浮点数 | double |
| `bf16` | 16位 brain floating point | 和 f32 相同的指数位(8), 更少的尾数位(7) |
| `f16` | 16位 IEEE 半精度浮点 | |
| `s32` | 32位有符号整数 | int32 |
| `u32` | 32位无符号整数 | uint32 |
| `u64` | 64位无符号整数 | uint64 |
| `pred` | 布尔/谓词类型 | 比较操作的结果 |
| `c64` | 64位复数 | 32位实部+32位虚部 |

---

## 2. 逐元素运算

逐元素运算对张量中的每个元素独立执行相同操作，输入和输出的形状相同。

### 2.1 算术运算

| 操作码 | 名称 | 操作数 | 含义 |
|--------|------|--------|------|
| `add` | 加法 | 2 | 逐元素加法: `C[i] = A[i] + B[i]` |
| `subtract` | 减法 | 2 | 逐元素减法: `C[i] = A[i] - B[i]` |
| `multiply` | 乘法 | 2 | 逐元素乘法: `C[i] = A[i] * B[i]` |
| `divide` | 除法 | 2 | 逐元素除法: `C[i] = A[i] / B[i]` |
| `remainder` | 取余 | 2 | 逐元素取余: `C[i] = A[i] % B[i]` |
| `power` | 幂 | 2 | 逐元素幂: `C[i] = A[i] ^ B[i]` |
| `maximum` | 最大值 | 2 | 逐元素取最大: `C[i] = max(A[i], B[i])` |
| `minimum` | 最小值 | 2 | 逐元素取最小: `C[i] = min(A[i], B[i])` |
| `negate` | 取负 | 1 | 逐元素取负: `C[i] = -A[i]` |
| `abs` | 绝对值 | 1 | 逐元素绝对值: `C[i] = |A[i]|` |
| `sign` | 符号 | 1 | 逐元素符号: 正=1, 负=-1, 零=0 |

```
// 示例: 逐元素加法
%x = f32[100] parameter(0)
%y = f32[100] parameter(1)
%z = f32[100] add(%x, %y)
```

### 2.2 数学函数

| 操作码 | 英文名 | 含义 |
|--------|--------|------|
| `exponential` | exp | e^A |
| `exponential-minus-one` | expm1 | e^A - 1 |
| `log` | ln | 自然对数 |
| `log-plus-one` | log1p | ln(1+A) |
| `logistic` | sigmoid | 1/(1+e^{-A}) |
| `sqrt` | sqrt | 平方根 |
| `rsqrt` | rsqrt | 1/sqrt(A) |
| `cbrt` | cbrt | 立方根 |
| `sine` | sin | 正弦 |
| `cosine` | cos | 余弦 |
| `tan` | tan | 正切 |
| `asin` | arcsin | 反正弦 |
| `acos` | arccos | 反余弦 |
| `atan2` | atan2 | 两参数反正切 |
| `sinh` | sinh | 双曲正弦 |
| `cosh` | cosh | 双曲余弦 |
| `tanh` | tanh | 双曲正切 |
| `asinh` | arcsinh | 反双曲正弦 |
| `acosh` | arccosh | 反双曲余弦 |
| `atanh` | arctanh | 反双曲正切 |
| `erf` | erf | 误差函数 |
| `floor` | floor | 向下取整 |
| `ceil` | ceil | 向上取整 |
| `round-nearest-even` | round | 四舍六入五成双 |
| `round-nearest-afz` | round | 远离零取整 |
| `is-finite` | isfinite | 是否为有限值 |

```
// 示例: tanh
%p0 = f32[3,0] parameter(0)
%t = f32[3,0] tanh(%p0)
```

### 2.3 逻辑与位运算

| 操作码 | 含义 |
|--------|------|
| `and` | 逐元素逻辑与 / 按位与 |
| `or` | 逐元素逻辑或 / 按位或 |
| `xor` | 逐元素异或 |
| `not` | 逐元素逻辑非 / 按位取反 |
| `shift-left` | 逐元素左移 |
| `shift-right-logical` | 逐元素逻辑右移（高位补0） |
| `shift-right-arithmetic` | 逐元素算术右移（高位补符号位） |
| `popcnt` | 逐元素统计二进制中1的个数 |
| `count-leading-zeros` | 逐元素统计前导零个数 |

### 2.4 比较运算

```
// compare 指令属性: direction=LT/GT/EQ/NE/LE/GE
//                  type=TOTALORDER/SIGNED/UNSIGNED (比较模式)
```

| direction | 含义 |
|-----------|------|
| `LT` | 小于 (Less Than) |
| `GT` | 大于 (Greater Than) |
| `EQ` | 等于 (Equal) |
| `NE` | 不等于 (Not Equal) |
| `LE` | 小于等于 (Less or Equal) |
| `GE` | 大于等于 (Greater or Equal) |

| type | 含义 |
|------|------|
| `TOTALORDER` | 全序比较：NaN 也有确定位置（在 -Inf 之下） |
| `SIGNED` | 有符号比较 |
| `UNSIGNED` | 无符号比较 |

```
// 示例: 全序小于比较
%p0 = f32[4] parameter(0)
%p1 = f32[4] parameter(1)
%c = pred[4] compare(%p0, %p1), direction=LT, type=TOTALORDER
```

### 2.5 三元选择

```
// select(pred, on_true, on_false): 根据条件逐元素选择
//   C[i] = pred[i] ? on_true[i] : on_false[i]
```

```
// 示例: conditional 转化为 select
%select = f32[] select(%lt, %constant_true, %constant_false)
```

---

## 3. 张量形状操作

### 3.1 Reshape — 改变形状

```
%r = shape reshape(%x)   // 总元素数不变，仅改变维度排列
```

```
// 示例: [1,9,3] → [9,3]
%reshape = f32[9,3] reshape(%a)    // 1*9*3 = 9*3 = 27 元素
```

### 3.2 Broadcast — 广播

```
%b = shape broadcast(%x), dimensions={d0, d1, ...}
//   dimensions 参数: 输入的第i维对应输出的第dimensions[i]维
//   输入中 size=1 的维度可扩展为任意大小
```

```
// 示例: 标量广播到向量
%c = f32[] constant(0)
%b = f32[100] broadcast(%c), dimensions={}   // {} = 标量，所有输出维度都是新增的
```

**BroadcastInDim** (Broadcast 的通用形式): `dimensions` 是一个映射，指定输入的每个维度对应输出的哪个维度。

```
// 示例: [4] broadcast 到 [4,3]
//       输入的 dim0(大小4) → 输出的 dim1(大小4)
//       输出的 dim0(大小3) 是新增的（输入对应关系中没有）
%x = f32[4] parameter(0)
%b = f32[3,4] broadcast(%x), dimensions={1}
```

### 3.3 Transpose — 转置/置换维度

```
%t = shape transpose(%x), dimensions={new_order}
//   dimensions 是输出维度的排列: output_dim[i] = input_dim[dimensions[i]]
```

```
// 示例: 矩阵转置 [4,3] → [3,4]
%x = f32[4,3] parameter(0)
%t = f32[3,4] transpose(%x), dimensions={1,0}
//   output dim0 = input dim1
//   output dim1 = input dim0
```

### 3.4 Slice — 切片

```
%s = shape slice(%x), slice={[start0:limit0:stride0], [start1:limit1:stride1], ...}
//   从每个维度提取范围 [start, limit)，步长为 stride
//   极限值 limit 是独占的（不包含该位置）
```

```
// 示例: 取前 10 个元素 [0:10]，步长 1
%slice = f32[10] slice(%get-tuple-element), slice={[0:10]}

// 等价于 Python: x[0:10:1]
```

### 3.5 Concatenate — 拼接

```
%c = shape concatenate(%a, %b, ...), dimensions={d}
//   沿维度 d 拼接所有输入
```

```
// 示例: 沿 dim1 拼接 [2,1] 和 [2,4] → [2,5]
%a = s32[2,1] iota()
%b = s32[2,4] parameter(0)
%c = s32[2,5] concatenate(%a, %b), dimensions={1}
```

### 3.6 Reverse — 反转

```
%r = shape reverse(%x), dimensions={d0, d1, ...}
//   沿指定维度反转数据
```

### 3.7 Pad — 填充

```
%p = shape pad(%x, %padding_value), padding_config={padding_low0:padding_high0, ...}
//   用 padding_value 在边界填充
//   padding_low:  低端填充量
//   padding_high: 高端填充量
```

### 3.8 Bitcast — 位重解释

```
%b = shape bitcast(%x)      // 不改变底层数据，只改变解释方式
%bc = shape bitcast-convert(%x) // 按位转换元素类型
```

---

## 4. 数据切片与索引

### 4.1 Gather — 从张量中收集元素

Gather 是 HLO 中最复杂的操作之一。直观理解：

> **对于输出中的每一个位置，从 `start_indices` 中查找一个起始索引，然后在 `operand` 中取一个大小为 `slice_sizes` 的切片，提取其中非折叠维度的元素。**

```
%g = shape gather(operand, start_indices),
       offset_dims={...},           // 输出中哪些维度是"偏移维度"
       collapsed_slice_dims={...},   // 切片中哪些维度被折叠（必须 size=1）
       start_index_map={...},        // 索引向量的每列映射到 operand 的哪个维度
       index_vector_dim=1,           // 索引向量的维度在 start_indices 中
       slice_sizes={...},            // 每个维度取多宽的切片
       indices_are_sorted=false      // 索引是否已排序（优化提示）
```

**参数详解：**

| 参数 | 含义 |
|------|------|
| `offset_dims` | 输出形状中哪些维度来自切片内部偏移（未被折叠的切片维度） |
| `collapsed_slice_dims` | 切片中 size=1 且被丢弃的维度，不进入输出 |
| `start_index_map` | 索引向量每列对应 operand 的哪个维度，长度 = 索引向量的元素数 |
| `index_vector_dim` | start_indices 的哪一维包含索引向量（通常是最后一维） |
| `slice_sizes` | 从 operand 每个维度切多长，长度必须 = operand 的 rank |
| `operand_batching_dims` | （可选）operand 中的批量维度 |
| `start_indices_batching_dims` | （可选）indices 中的批量维度，数量须一致 |
| `indices_are_sorted` | 优化提示：索引是否递增排列 |

**工作流程：**

```
对于输出中的每个坐标 (i0, i1, ..., iN):
  1. 提取索引向量: start_indices[i0, i1, ...] → 得到 [idx0, idx1, ..., idxM]
  2. 通过 start_index_map 映射到 operand 维度:
       对于 start_indices 的每列 k:
         operand_dim = start_index_map[k]
         operand 中的起始位置在该维度偏移 idx_k
  3. 在 operand 中取切片，大小为 slice_sizes
  4. 丢弃 collapsed_slice_dims 对应的维度
  5. offset_dims 对应的维度保留在输出中
```

```
// 示例: 最简单的 gather
%operand = f32[10,16] parameter(0)         // 10行, 每行16个元素
%indices = s32[4] parameter(1)             // 4个行索引, 例如 [2,5,1,8]
ROOT %gather = f32[4,16] gather(%operand, %indices),
    offset_dims={1},            // dim1(列) 是偏移维度，从切片内部取值
    collapsed_slice_dims={0},   // dim0(行) 被折叠（因为只取一行）
    start_index_map={0},        // 索引值映射到 operand dim0(行)
    index_vector_dim=1,         // 索引向量在 dim1（每个索引是标量）
    slice_sizes={1,16}          // 每行取1行×16列

// 结果: 从 operand 中取出第2行、第5行、第1行、第8行
//       → shape = [4(行数=索引数), 16(列数=切片宽度)]
```

```
// 示例: 带批量维度的 gather (BatchedGatherScatterNormalizer 输入)
%operand = f32[2,10,16] parameter(0)       // 2个batch, 每batch 10行
%indices = s32[2,4] parameter(1)           // 2个batch, 每batch 4个索引
ROOT %gather = f32[2,4,16] gather(...),
    offset_dims={2},
    collapsed_slice_dims={0},              // 注意: 0=当前operand的第0维(即batch维)
    start_index_map={0},
    index_vector_dim=1,
    slice_sizes={1,16},
    operand_batching_dims={0},             // operand dim0 是批量维度
    start_indices_batching_dims={0}        // indices dim0 也是批量维度

// 语义: 第i个batch中, 用 indices[i,:] 去 operand[i,:,:] 中取数据
//       → 每个batch独立执行gather, 不会跨batch索引
```

### 4.2 Scatter — 散布更新（Gather 的逆操作）

```
%s = shape scatter(operand, scatter_indices, updates),
       update_window_dims={...},          // updates 中哪些维是窗口维度
       inserted_window_dims={...},         // 需要插入的窗口维度
       scatter_dims_to_operand_dims={...}, // 索引列到 operand 维度的映射
       index_vector_dim=1,                // 索引向量在 scatter_indices 的哪一维
       to_apply=reducer                   // 如何合并多个更新到同一位置
```

**直观理解:** 对于 updates 中的每个元素，通过 scatter_indices 找到 operand 中的对应位置，用 reducer 更新。

### 4.3 DynamicSlice — 动态切片

```
%ds = shape dynamic-slice(operand, start0, start1, ...),
        dynamic_slice_sizes={size0, size1, ...}
//   从指定的运行时起始位置开始，切出指定大小的子张量
//   start_i 是标量或零维张量，给出第i维的起始位置
```

```
// 示例: 在 [4,5,6] 中切出 [1,1,1] 的子张量
%operand = s32[4,5,6] parameter(0)
%i = s32[] parameter(1)
%j = s32[] parameter(2)
%k = s32[] parameter(3)
%ds = s32[1,1,1] dynamic-slice(%operand, %i, %j, %k), dynamic_slice_sizes={1,1,1}
// 等价于: operand[i:i+1, j:j+1, k:k+1]
```

**DynamicIndexSplitter Pass**: 将向量形式的起始索引拆分为标量索引。

```
// 优化前: 索引是向量
%indices = s32[3] parameter(1)
%ds = s32[1,1,1] dynamic-slice(%operand, %indices), dynamic_slice_sizes={1,1,1}

// 优化后: 索引拆分为3个标量
%slice = s32[1] slice(%indices), slice={[0:1]}
%reshape = s32[] reshape(%slice)        // 索引0 → 标量
%slice.1 = s32[1] slice(%indices), slice={[1:2]}
%reshape.1 = s32[] reshape(%slice.1)    // 索引1 → 标量
%slice.2 = s32[1] slice(%indices), slice={[2:3]}
%reshape.2 = s32[] reshape(%slice.2)    // 索引2 → 标量
%ds = s32[1,1,1] dynamic-slice(%operand, %reshape, %reshape.1, %reshape.2), ...
```

### 4.4 DynamicUpdateSlice — 动态更新切片

```
%dus = shape dynamic-update-slice(operand, update, start0, start1, ...)
//   将 update 写入 operand 中从 start 开始的位置
//   类似: operand[start:start+update_size] = update
```

---

## 5. 规约操作

### 5.1 Reduce — 沿指定维度规约

```
%r = shape reduce(%x, %init), dimensions={d0, d1, ...}, to_apply=reducer
//   沿 dimensions 指定的维度进行规约
//   %init: 初始值（必须是 reducer 的单位元）
//   to_apply: 规约函数（二元操作，如 add/maximum）
```

```
// 示例: 沿 dim0 求和 → 将 [3,4] 规约为 [4]
%sum_fn {
  %lhs = f32[] parameter(0)
  %rhs = f32[] parameter(1)
  ROOT %sum = f32[] add(%lhs, %rhs)
}
%x = f32[3,4] parameter(0)
%init = f32[] constant(0)
%r = f32[4] reduce(%x, %init), dimensions={0}, to_apply=%sum_fn
// 结果: r[j] = sum(x[0,j] + x[1,j] + x[2,j]) for each j
```

### 5.2 ReduceWindow — 滑动窗口规约

```
%rw = shape reduce-window(%x, %init),
        window={size=W, stride=S, pad_low=PL, pad_high=PH, ...},
        to_apply=reducer
//   用指定大小的窗口在输入上滑动，每个窗口内执行规约
//   类似: 卷积但用规约函数代替乘加
```

### 5.3 SelectAndScatter — 选择并散布

```
%sas = shape select-and-scatter(%operand, %source, %init),
         window={...}, select=select_fn, scatter=scatter_fn
//   每个窗口中用 select_fn 选择一个值，用 scatter_fn 散布回 source
```

---

## 6. 线性代数

### 6.1 Dot — 点积/矩阵乘法

```
// 最简单的形式: 矩阵乘法 + 批量维度
%d = shape dot(%lhs, %rhs),
       lhs_contracting_dims={...},   // LHS 的收缩维度（被求和的维度）
       rhs_contracting_dims={...},   // RHS 的收缩维度
       lhs_batch_dims={...},         // LHS 的批量维度（可选）
       rhs_batch_dims={...}          // RHS 的批量维度（可选）
```

| 参数 | 含义 |
|------|------|
| `lhs_contracting_dims` | LHS 中参与内积的维度（被求和消除） |
| `rhs_contracting_dims` | RHS 中参与内积的维度 |
| `lhs_batch_dims` | LHS 中的批量维度（不参与算术，独立并行） |
| `rhs_batch_dims` | RHS 中的批量维度 |

```
// 示例1: 矩阵乘法 [m,k] x [k,n] → [m,n]
%p0 = f32[64,512] parameter(0)
%p1 = f32[512,512] parameter(1)
%d = f32[64,512] dot(%p0, %p1),
      lhs_contracting_dims={1},    // dim1(512) 被收缩
      rhs_contracting_dims={0}     // dim0(512) 被收缩
// 输出形状: [lhs的非收缩维(64), rhs的非收缩维(512)] = [64,512]
```

```
// 示例2: 批量矩阵乘法 [batch, m, k] x [batch, k, n] → [batch, m, n]
%a = f32[1,9,3] parameter(0)
%b = f32[1,3,7] parameter(1)
%d = f32[1,9,7] dot(%a, %b),
      lhs_batch_dims={0}, rhs_batch_dims={0},
      lhs_contracting_dims={2}, rhs_contracting_dims={1}
// batch dim0(1): 独立并行但保留
// contracting: LHS dim2(3) 对应 RHS dim1(3)，求和消除
// 输出: [batch(1), lhs非收缩(9), rhs非收缩(7)] = [1,9,7]
```

**DotDecomposer**: 将非规范 Dot 展开为规范 2D Dot + Reshape。

```
// 非规范: [64,63,512] x [512,512]
//   有两维非收缩(LHS), 需要先 reshape 成一维
//   → reshape([64,63,512] → [4032,512])  // 64*63 = 4032
//   → dot([4032,512], [512,512])         // 规范 2D 矩阵乘法
//   → reshape([4032,512] → [64,63,512])  // 恢复形状
```

### 6.2 Convolution — 卷积

```
%c = shape convolution(%lhs, %rhs),
       window={size=K stride=S pad_low=PL pad_high=PH ...},
       feature_group_count=G, batch_group_count=B,
       convolution_dimension_numbers={...}
```

`convolution_dimension_numbers` 指定输入/卷积核/输出各自的 batch, feature, spatial 维度。

### 6.3 Cholesky — Cholesky 分解

```
%chol = shape cholesky(%a), lower=true
//   对称正定矩阵 A 的 Cholesky 分解: A = L·L^T
//   lower=true: 返回下三角矩阵 L
```

### 6.4 TriangularSolve — 三角方程组求解

```
%x = shape triangular-solve(%a, %b),
       left_side=true, lower=true, unit_diagonal=false, transpose_a=NO_TRANSPOSE
//   求解三角方程组: A·X = B (left_side=true) 或 X·A = B (left_side=false)
//   lower: A 是下三角还是上三角
//   unit_diagonal: A 的对角线是否全为1
//   transpose_a: 是否使用 A^T
```

### 6.5 特征值与 QR 分解（通过 CustomCall）

```
// QR 分解: A = Q·R
%qr = (f32[6,4], f32[4,4]) custom-call(%p0), custom_call_target="Qr"

// 对称矩阵特征值分解: A = V·Λ·V^T
%eigh = (f32[3], f32[3,3]) custom-call(%p0),
         custom_call_target="Eigh", backend_config="1,1,100,0.000001"
//           backend_config = "lower,sort,max_iter,tol"
```

---

## 7. 控制流与复合操作

### 7.1 Parameter — 参数

```
%p0 = f32[3,3] parameter(0)    // 第 0 号参数 (从 0 开始编号)
%p1 = f32[4] parameter(1)      // 第 1 号参数
```

### 7.2 Constant — 常量

```
%c = f32[] constant(3.14)           // 标量常量
%z = f32[2,2] constant({{0,1},{2,3}})  // 矩阵常量
```

### 7.3 Tuple — 元组

```
%t = (f32[10], s32[10]) tuple(%a, %b)
//   将多个张量打包为一个元组（不是拼接，是打包）
```

### 7.4 GetTupleElement — 提取元组元素

```
%gte = shape get-tuple-element(%tuple), index=0
//   从元组中提取第 index 个元素
```

```
// 示例: TopkDecomposer 中的用法
%sort = (f32[100], s32[100]) sort(%p0, %iota), ...
%values = f32[100] get-tuple-element(%sort), index=0   // 排序后的值
%indices = s32[100] get-tuple-element(%sort), index=1  // 排序后的索引
```

### 7.5 Call — 调用子计算体

```
// CallInliner 优化: 将只有单一调用点的 call 内联展开
%called {
  %p = f32[] parameter(0)
  ROOT %result = f32[] add(%p, %p)
}
ENTRY %main {
  %x = f32[] parameter(0)
  %y = f32[] call(%x), to_apply=%called  // 调用子计算体
}
// 内联后: %y = f32[] add(%x, %x)
```

### 7.6 Map — 逐元素映射

```
%map_fn {
  %x = f32[] parameter(0)
  %y = f32[] parameter(1)
  ROOT %max = f32[] maximum(%x, %y)
}
%m = shape map(%a, %b), dimensions={0}, to_apply=%map_fn
//   对 %a 和 %b 的第0维对齐的元素依次调用 map_fn
//   等价于: for i: m[i] = max(a[i], b[i])
```

**MapInliner**: 当 map 的函数体是简单的一元/二元操作时，直接将 map 消除。

```
// 优化: map(maximum) → 直接 maximum
// 优化前: %m = f32[100] map(%p0, %p1), dimensions={0}, to_apply=max_fn
// 优化后: %m = f32[100] maximum(%p0, %p1)
```

### 7.7 Conditional — 条件分支

```
// Form 1: 谓词条件 (pred)
%cond = pred[] compare(%x, %y), direction=LT
%result = shape conditional(%cond, %true_val, %false_val),
            true_computation=%true_fn, false_computation=%false_fn

// Form 2: 分支索引 (s32)
%branch = s32[] parameter(0)
%result = shape conditional(%branch, %val0, %val1),
            branch_computations={%fn0, %fn1}
```

**ConditionalToSelect**: 当分支体是常量且无副作用时，conditional → select。

```
// 优化前:
//   cond = conditional(lt, t, t), true_comp={const(0)}, false_comp={const(1)}
// 优化后:
//   result = select(lt, const(0), const(1))
```

### 7.8 While — 循环

```
%w = shape while(%init), condition=%cond_fn, body=%body_fn
//   while (cond_fn(state)) { state = body_fn(state); }
//   返回最终的 state
```

### 7.9 Sort — 排序

```
%s = tuple_shape sort(%keys, %values), dimensions={d}, is_stable=true, to_apply=%comparator
//   沿维度 d 排序
//   多个操作数一起排序（像 Python 的 argsort）
//   is_stable: 是否稳定排序
```

```
// 示例: TopkDecomposer 的核心步骤
%compare_fn {
  %lhs_val = f32[] parameter(0)
  %rhs_val = f32[] parameter(1)
  %lhs_idx = s32[] parameter(2)
  %rhs_idx = s32[] parameter(3)
  ROOT %cmp = pred[] compare(%lhs_val, %rhs_val), direction=GT, type=TOTALORDER
}
%iota = s32[100] iota(), iota_dimension=0
%sort = (f32[100], s32[100]) sort(%p0, %iota), dimensions={0}, is_stable=true, to_apply=%compare_fn
```

### 7.10 TopK — 取前K个最大/最小值

```
%topk = (f32[k], s32[k]) topk(%x), k=10, largest=true
//   返回 (前k大的值, 对应的索引)
```

**TopkDecomposer**: 这是变化最显著的 Pass，将单个 topk 展开为：
```
topk → iota + sort(compare) + slice + get-tuple-element + tuple
```

```
// 优化前:
//   ROOT topk = (f32[10], s32[10]) topk(p0), k=10, largest=true

// 优化后:
//   %iota = s32[100] iota(), iota_dimension=0
//   %sort = (f32[100], s32[100]) sort(%p0, %iota), dimensions={0}, is_stable=true, to_apply=%compare_fn
//   %values = f32[100] get-tuple-element(%sort), index=0
//   %top_values = f32[10] slice(%values), slice={[0:10]}
//   %indices = s32[100] get-tuple-element(%sort), index=1
//   %top_indices = s32[10] slice(%indices), slice={[0:10]}
//   ROOT %tuple = (f32[10], s32[10]) tuple(%top_values, %top_indices)
```

---

## 8. 类型转换

### 8.1 Convert — 类型转换

```
%c = shape convert(%x)
//   元素类型转换: f32→bf16, f32→s32, bf16→f32 等
//   语义: 对每个元素做类型转换（值可能改变）
```

**OperandUpcaster**: 在 Dot 操作数前插入 Convert 提升精度。

```
// 优化前:
//   ROOT dot = f32[8,8] dot(%p0_bf16, %p1_bf16)
// 优化后:
//   %c0 = f32[8,8] convert(%p0_bf16)   // bf16→f32
//   %c1 = f32[8,8] convert(%p1_bf16)   // bf16→f32
//   ROOT dot = f32[8,8] dot(%c0, %c1)
```

**ResultCaster**: 在 Dot 结果后插入 Convert 降低精度。

```
// 优化前:
//   ROOT dot = bf16[4,4] dot(%p0_f32, %p1_f32)  // f32操作数但声明bf16输出
// 优化后:
//   %dot = f32[4,4] dot(%p0, %p1)       // 实际在 f32 精度计算
//   ROOT %c = bf16[4,4] convert(%dot)   // 结果转换为 bf16
```

### 8.2 BitcastConvert — 位模式重解释

```
%b = shape bitcast-convert(%x)
//   不改变底层位模式，只改变解释方式
//   例如: f32 0x3F800000 → s32 1065353216 (两者是相同的二进制)
```

### 8.3 StochasticConvert — 随机舍入转换

```
%sc = shape stochastic-convert(%value, %random)
//   用随机舍入代替确定性舍入
//   例如: f32→s32:
//     floor(x) + (random < fractional_part(x) ? 1 : 0)
```

**StochasticConvertDecomposer**: 展开为显式的算术运算。

```
// 展开为: sign + abs + floor + compare(random) + select + negate + add
```

---

## 9. 集合通信

### 9.1 AllReduce — 全规约

```
%ar = shape all-reduce(%x), to_apply=%reducer,
        replica_groups={{0,1}}, channel_id=1
//   在所有副本间对数据执行规约操作
//   replica_groups: 哪些副本参与（默认全部）
```

### 9.2 AllGather — 全收集

```
%ag = shape all-gather(%x), dimensions={d},
        replica_groups={{0,1}}, channel_id=1
//   沿维度 d 拼接所有副本的数据
```

### 9.3 AllToAll — 全交换

```
%a2a = shape all-to-all(%x),
         replica_groups={{0,1},{2,3}}, dimensions={split_dim}
//   将每个副本的数据沿 split_dim 切分成 N 块
//   第 i 个副本的第 j 块发送给第 j 个副本
//   第 i 个副本收集所有副本发来的第 i 块并拼接
```

**AllToAllDecomposer**: 将数组形式 AllToAll 分解为 Tuple 形式 + slice + concatenate。

```
// 优化前 (数组形式):
//   ROOT a2a = f32[4,8] all-to-all(p0), replica_groups={{0,1},{2,3}}, dimensions={1}

// 优化后 (Tuple形式):
//   %slice = f32[4,4] slice(p0), slice={[0:4], [0:4]}
//   %slice.1 = f32[4,4] slice(p0), slice={[0:4], [4:8]}
//   %a2a = (f32[4,4], f32[4,4]) all-to-all(%slice, %slice.1), replica_groups={{0,1},{2,3}}
//   %gte = f32[4,4] get-tuple-element(%a2a), index=0
//   %gte.1 = f32[4,4] get-tuple-element(%a2a), index=1
//   ROOT %cat = f32[4,8] concatenate(%gte, %gte.1), dimensions={1}
```

---

## 10. 随机数与常量生成

### 10.1 Iota — 序列生成

```
%i = shape iota(), iota_dimension=d
//   沿维度 d 生成递增整数序列 [0, 1, 2, ..., size(d)-1]
```

```
// 示例1: 1D iota → [0, 1, 2, ..., 99]
%iota = s32[100] iota(), iota_dimension=0

// 示例2: 2D iota, iota_dimension=0 (沿行递增)
//   [[0, 0, 0],
//    [1, 1, 1],
//    [2, 2, 2]]

// 示例3: 2D iota, iota_dimension=1 (沿列递增)
//   [[0, 1, 2],
//    [0, 1, 2],
//    [0, 1, 2]]
```

### 10.2 RNG — 随机数生成

```
%r = shape rng(%a, %b), distribution=rng_uniform
//   生成在 [a, b] 范围内均匀分布的随机数
//   distribution 可以是: rng_uniform, rng_normal
```

**RngExpander**: 将 RNG 展开为底层算术运算（使用 Philox/ThreeFry 算法的位运算）。

### 10.3 RngBitGenerator — 随机位生成器

```
%rng = (u64[2], u32[shape]) rng-bit-generator(%state), algorithm=rng_philox
//   %state: 初始状态 u64[2]
//   返回: (新状态, 随机数)
//   algorithm: rng_philox, rng_three_fry
```

---

## 11. 参数速查表

### 11.1 常见参数一览

| 参数名 | 出现于 | 含义 |
|--------|--------|------|
| `dimensions` | reduce, sort, concatenate, broadcast, all-to-all | 要操作的维度编号 |
| `slice` | slice | `[start:limit:stride]` 格式的范围 |
| `dynamic_slice_sizes` | dynamic-slice | 每个维度的切片大小 |
| `slice_sizes` | gather | 每个维度从 operand 切多宽 |
| `offset_dims` | gather | 输出中作为"偏移"的维度编号 |
| `collapsed_slice_dims` | gather | 被折叠丢弃的切片维度 |
| `start_index_map` | gather | 索引列到 operand 维度的映射 |
| `index_vector_dim` | gather, scatter | 索引向量在 start_indices 的哪一维 |
| `lhs_contracting_dims` | dot | LHS 中被求和的维度 |
| `rhs_contracting_dims` | dot | RHS 中被求和的维度 |
| `lhs_batch_dims` | dot | LHS 中独立的批量维度 |
| `rhs_batch_dims` | dot | RHS 中独立的批量维度 |
| `window` | convolution, reduce-window | 窗口参数 (size, stride, padding, dilation) |
| `to_apply` | reduce, map, sort, call | 引用的子计算体 |
| `is_stable` | sort | 是否稳定排序 |
| `replica_groups` | all-reduce, all-gather, all-to-all | 参与通信的副本分组 |
| `channel_id` | 集合通信 | 通信通道 ID（用于配对 send/recv） |
| `custom_call_target` | custom-call | 自定义调用的目标名称 |
| `backend_config` | custom-call | 传递给后端的配置字符串 |

### 11.2 形状演变模式

```
Broadcast:  [d]              → [d, d]     (用 dimensions 映射)
Reshape:    [2,3,4]         → [6,4]       (总元素数不变)
Transpose:  [2,3,4]         → [4,3,2]     (维度重新排列)
Slice:      [100]           → [10]        (取子范围)
Reduce:     [m,n]           → [n]         (沿某维规约)
Dot:        [a,b] x [b,c]   → [a,c]       (b 被收缩)
Gather:     [N,...] + [k]   → [k,...]     (按索引收集)
```

---

## 附录: 学习建议

1. **从简单到复杂**: 先理解 add、multiply、reshape、broadcast 等基础操作，再学习 gather、scatter、dot 等复杂操作
2. **关注 Before/After 对比**: 运行 `bash xla/tools/demo_stage3_passes.sh`，观察每个 Pass 如何修改 HLO 代码
3. **推荐从 TopkDecomposer 开始**: 它的变化最显著 — 一个 `topk` 变成了 6 行代码（iota + sort + gte + slice ×2 + tuple）
4. **查阅权威文档**: `docs/operation_semantics.md` 是每个操作的完整语义定义
5. **HLO Opcode 定义**: `xla/hlo/ir/hlo_opcode.h` 包含所有操作码的完整列表
