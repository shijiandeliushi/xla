# HloComputation 类分析

**日期**：2026年4月28日  
**基于源码**：`xla/hlo/ir/hlo_computation.h` (1259行) / `xla/hlo/ir/hlo_computation.cc` (2262行)

---

## 一、概述

`HloComputation` 是 XLA HLO IR 中表示一个**计算单元**的核心类，可以类比为 C 语言中的函数（function）。它有若干输入（参数 parameters），并返回一个值（root instruction 的输出）。如果需要返回多个值，可以返回一个 tuple。

关键特征：
- 计算内部的指令**没有显式的全序关系**（total order），而是由**数据依赖**（data dependency）和**控制依赖**（control dependency）决定的**偏序关系**（partial order）
- 一个 `HloModule` 包含一个 "entry computation"（类似 `main()`），其他 computation 作为嵌套计算（nested computation）附着在 `HloInstruction` 上
- 例如，`kMap` 指令有一个嵌套 computation，将其应用于输入的每个元素（如 `[x, y, z] -> [f(x), f(y), f(z)]`）

---

## 二、类关系图

```
HloModule (父容器)
  │
  ├── entry_computation_: HloComputation*
  └── 包含多个 HloComputation
        │
        ├── parent_: HloModule* (反向引用，由 HloModule 设置)
        │
        ├── root_instruction_: HloInstruction* (计算的输出)
        │
        ├── param_instructions_: vector<HloInstruction*> (输入参数)
        │
        ├── instructions_: HloInstructionList (拥有的所有指令)
        │   └── 每个元素: HloInstructionInfo { opcode_, HloInstruction* }
        │       └── HloInstruction
        │           ├── shape_: shared_ptr<Shape> (共享所有权)
        │           ├── parent_: HloComputation* (反向引用)
        │           └── operands_: vector<HloInstruction*>
        │
        ├── callee_computations_: btree_map<HloComputation*, count>
        │     (此计算调用了哪些其他计算)
        │
        └── caller_computations_: btree_map<HloComputation*, count>
              (哪些其他计算调用了此计算)
```

与外部类的关系：
| 关联类 | 关系 | 说明 |
|--------|------|------|
| `HloModule` | 聚合（N:1 反向引用） | `parent_` 指向所属模块 |
| `HloInstruction` | 组合（1:N 拥有） | computation 拥有其所有指令的生命周期 |
| `HloInstructionInfo` | 轻量包装 | 存储 `{HloOpcode, HloInstruction*}`，优化快速查询 opcode |
| `Shape` | 间接关联（通过 HloInstruction） | `shared_ptr<Shape>` 共享所有权 |
| `DfsHloVisitor` | 访问者模式 | 通过 `Accept()` 遍历计算中的所有指令 |
| `HloCloneContext` | 克隆辅助 | 维护旧→新指令/computation 的映射 |
| `HloPassInterface` | 优化 Pass 操作对象 | 优化 Pass 遍历并修改 computation 中的指令 |
| `HloOpcode` | 属性枚举 | `InstructionType` 枚举定义计算类型（kFusion等） |

---

## 三、内部类

### 3.1 Builder（构建器模式）

```cpp
class Builder {
  const std::string name_;
  std::vector<std::unique_ptr<HloInstruction>> instructions_;
  absl::flat_hash_set<int> parameter_numbers_;
};
```

- `AddInstruction(unique_ptr<HloInstruction>)` — 添加指令到临时列表
- `AddParameter(unique_ptr<HloInstruction>)` — 添加参数（检查参数编号不重复）
- `Build(HloInstruction* root)` — 构建并返回 `unique_ptr<HloComputation>`（若 root 为 nullptr，使用最后添加的指令作为 root）
- 禁用拷贝，仅允许移动

### 3.2 MetadataBuilder

为添加到 computation 的每条指令自动设置 `OpMetadata`，用于批量添加带元数据的指令。

### 3.3 CachingPostOrder

缓存指令的后序遍历结果，避免在同一个优化 Pass 进行多轮遍历时重复计算。用法：
```cpp
HloComputation::CachingPostOrder cpo(computation);
for (auto instruction : cpo.PostOrder()) {  // 第一轮
  bool did_change = ...;
  cpo.RecordChange(did_change);  // 有变更时标记缓存失效
}
for (auto instruction : cpo.PostOrder()) {  // 第二轮（若有变更则重新计算）
  ...
}
```

### 3.4 VisitMap（在 .cc 中实现）

高效的访问状态位图，每个节点 2 个 bit，32 个节点压缩到一个 64-bit 字中，用于 DFS 后序遍历（替代 hash set 以提升性能）。

### 3.5 NeighborIterator

适配器迭代器，用于在遍历 `callee_computations_` / `caller_computations_` 时跳过不属于同一 module 的计算。

### 3.6 UniqueIdComparator

用于 `btree_map<HloComputation*, int>` 排序的比较器，以 `(unique_id, 指针地址)` 为键，既保证确定性（相同 unique_id 按指针地址排序），也支持 unique_id 为 -1 的计算（属于同一模块才能确定顺序）。

---

## 四、核心公开接口（按功能分类）

### 4.1 指令管理

| 方法 | 说明 |
|------|------|
| `AddInstruction(unique_ptr<HloInstruction>)` | 向计算中添加指令，计算取得所有权。参数指令不能在构建后通过此方法添加 |
| `AddParameter(unique_ptr<HloInstruction>)` | 向 fusion 计算添加新参数指令 |
| `AddEntryComputationParameter(unique_ptr<HloInstruction>)` | 向 entry computation 添加参数，同时更新 module config |
| `RemoveInstruction(HloInstruction*)` | **两阶段删除**：标记为删除，下次 Cleanup() 时真正释放 |
| `ForceRemoveInstruction(HloInstruction*)` | 同上，但跳过安全检查（即使标记为不可删除也强制删除） |
| `RemoveInstructionAndUnusedOperands(...)` | 删除指令并**级联删除**无副作用的未使用操作数 |
| `ReplaceInstruction(old, new)` | 用新指令替换旧指令，更新所有 user，移除旧指令 |
| `ReplaceWithNewInstruction(old, new_unique_ptr)` | 将 new 添加到计算中，然后替换 old |
| `ReplaceAllUsesWith(...)` | 替换指令的所有使用 |
| `set_root_instruction(...)` | 设置计算的根指令（输出） |
| `root_instruction()` | 返回根指令 |
| `Cleanup()` | 物理释放所有标记为删除的指令，并压缩 `instructions_` 向量 |

### 4.2 参数管理

| 方法 | 说明 |
|------|------|
| `num_parameters()` | 返回参数数量 |
| `parameter_instruction(param_no)` | 返回第 param_no 个参数指令 |
| `parameter_instructions()` | 返回所有参数指令的引用 |
| `ReplaceParameter(param_no, instruction)` | 替换指定位置的参数 |
| `RemoveParameter(param_no)` | 移除参数（fusion computation 专用） |
| `RemoveUnusedParametersFromFusedComputation()` | 移除 fusion 中未使用的参数 |
| `RemoveUnusedParametersFromAnyComputation()` | 移除任意计算中未使用的参数 |
| `ReplaceEntryComputationParameter(...)` | 替换 entry computation 的参数并更新 config |

### 4.3 遍历与访问

| 方法 | 说明 |
|------|------|
| `instructions()` | 返回指令的范围（range），支持 range-based for 循环 |
| `instructions_with_info()` | 返回包含 `HloInstructionInfo` 的范围 |
| `MakeInstructionPostOrder()` | 返回后序遍历的指令序列（定义先于使用） |
| `MakeInstructionPostOrderFrom(instruction)` | 从指定指令开始的子图后序遍历 |
| `MakeInstructionPostOrderWithReshapeFirst()` | 后序遍历，但 Reshape 优先于其他操作（特殊排序） |
| `ForEachInstructionPostOrder(func)` | 对后序遍历的每条指令调用 func |
| `Accept(DfsHloVisitor*)` | 接受 DFS 访问者，遍历所有指令（包含不可达根节点） |
| `AcceptOrdered(visitor, order)` | 按指定拓扑序接受访问者 |

### 4.4 计算的创建与修改

| 方法 | 说明 |
|------|------|
| `CreateFusionInstruction(...)` | 将指定指令融合为一个 kFusion 指令 |
| `CreateCallInstruction(...)` | 将指定指令封装为一个 kCall 指令 |
| `CreateCompositeCallInstruction(...)` | 创建 composite call 指令 |
| `CreateAsyncInstructions(...)` | 创建异步指令对（async-start / async-done） |
| `DeepCopyInstruction(...)` | 深拷贝指令（tuple 分解为 gte+tuple） |
| `Clone(suffix, context)` | 深拷贝整个计算 |
| `CloneWithReplacements(replacements, ...)` | 带指令替换的深拷贝（支持移除指令、替换为其他指令等） |
| `CloneInContext(...)` | const 版本的带上下文克隆 |

### 4.5 查询与判断

| 方法 | 说明 |
|------|------|
| `IsFusionComputation()` | 是否为 fusion 计算 |
| `IsEntryComputation()` | 是否为模块的 entry computation |
| `IsAsyncComputation()` | 是否为异步计算 |
| `IsMainThread()` | 是否在 main 执行线程上 |
| `IsSafelyRemovable(instruction)` | 判断指令是否可安全移除（必要条件而非充分条件） |
| `IsMarkedAsDead(instruction)` | 判断指令是否已被标记为删除 |
| `HasSideEffect()` | 计算中是否包含有副作用的指令 |
| `CanExpandIntoSingleInstruction()` | 是否可内联展开为单条指令（仅 root + 参数） |
| `OnlyContainsSendRecv()` | 是否仅包含 send/recv 指令 |

### 4.6 比较与哈希

| 方法 | 说明 |
|------|------|
| `Equal(other)` | 功能等价性比较（支持 layout 敏感/不敏感，支持自定义 computation 比较器） |
| `EqualIgnoringChannelIdValues(other)` | 忽略 channel ID 值的等价比较 |
| `EqualIgnoringExecutionThread(other)` | 忽略执行线程的等价比较 |
| `operator==` / `operator!=` | 基于 layout 敏感 Equal 的运算符 |
| `AbslHashValue` (友元) | 哈希计算（后序遍历 + 指令哈希缓存） |

### 4.7 序列化与打印

| 方法 | 说明 |
|------|------|
| `ToString()` | 字符串表示 |
| `Print(Printer*)` | 通过 Printer 打印 |
| `ToCord()` | Cord 表示（高效字符串） |
| `ToProto()` | 序列化为 HloComputationProto |
| `CreateFromProto(proto, map)` | 从 proto 反序列化（静态工厂方法） |

### 4.8 标识与命名

| 方法 | 说明 |
|------|------|
| `name()` | 返回计算名称 |
| `SetAndSanitizeName(name)` | 设置名称（自动规范化为 `[a-zA-Z_][a-zA-Z0-9_.-]*`） |
| `UniquifyName(uniquer/module)` | 通过 NameUniquer 确保名称唯一 |
| `unique_id()` | 返回计算在模块内的唯一 ID |
| `SetUniqueId(id)` | 设置唯一 ID（仅 HloModule 调用） |
| `execution_thread()` | 返回执行线程名称 |

### 4.9 调用关系

| 方法 | 说明 |
|------|------|
| `callee_computations()` | 返回此计算被调用的子计算及其调用次数 |
| `caller_computations()` | 返回调用此计算的计算及其调用次数 |
| `caller_instructions(opcode)` | 返回调用此计算的具体指令 |
| `GetUniqueCaller(opcode)` | 返回唯一调用者（如果有且仅有一个） |
| `FusionInstruction()` | 返回拥有此计算的 fusion 指令（否则返回 nullptr） |
| `MakeEmbeddedComputationsList()` | 返回所有嵌入计算的列表（拓扑排序） |

---

## 五、私有成员变量

| 成员 | 类型 | 说明 |
|------|------|------|
| `unique_id_` | `int64_t` | 模块内唯一 ID，未加入 Module 时为 -1 |
| `root_instruction_` | `HloInstruction*` | 计算的根指令（输出） |
| `parent_` | `HloModule*` | 所属模块（反向引用），仅 HloModule 可设置 |
| `instruction_and_type_` | `uintptr_t` | **位打包**：高位存 `HloInstruction*`，低 3 位存 `InstructionType`（利用指针 8 字节对齐特性） |
| `callers_` | `uintptr_t` | **位打包**：低位存 `CallersType`（0=单指令,1=HashMap），高位存 `HloInstruction*` 或 `flat_hash_map*` |
| `param_instructions_` | `InstructionVector` | 参数指令列表 |
| `instructions_` | `HloInstructionList` | 所有指令的列表（`vector<HloInstructionInfo>`） |
| `instruction_count_` | `int64_t` | 未被标记删除的指令数量 |
| `to_be_deleted_` | `PtrVec<HloInstruction*>` | 待删除指令的临时存放区 |
| `execution_thread_` | `std::string` | 执行线程，默认 `"main"` |
| `name_` | `std::string` | 计算名称 |
| `callee_computations_` | `btree_map<HloComputation*, int>` | 被调用计算→调用次数 |
| `caller_computations_` | `btree_map<HloComputation*, int>` | 调用者计算→调用次数 |
| `next_instruction_unique_id_` | `int32_t` | 下一条指令将分配的内部 ID |
| `topological_sort_node_` | `TopologicalSortNode<HloComputation>` | 模块内计算拓扑排序节点 |

---

## 六、关键设计模式与实现细节

### 6.1 两阶段删除（Two-Phase Deletion）

```
RemoveInstruction()  →  标记为 dead，移入 to_be_deleted_
       ↓
Cleanup()  →  物理释放内存，压缩 instructions_ 向量
```

这样设计是为了在 Pass 执行期间，HloInstruction 的内部指针保持稳定（即使有指令被创建和移除）。

### 6.2 位打包优化（Bit Packing）

- `instruction_and_type_`：利用 `HloInstruction*` 8 字节对齐（低 3 位始终为 0），将 `InstructionType` 存储在低 3 位
- `callers_`：低 1 位存储 `CallersType`（0 = 单个 `HloInstruction*`，1 = `flat_hash_map*`）。只有一个调用者时直接存指针，多个调用者时才使用哈希表——节省内存

### 6.3 构建器模式（Builder Pattern）

`HloComputation::Builder` 提供分步构建接口，构造函数为 private，只能通过 `Builder::Build()` 或 `CreateFromProto()` 创建实例。

### 6.4 友元关系

- `friend class HloModule` — HloModule 通过 `set_parent()` 和 `SetUniqueId()` 管理 computation
- `friend class HloInstruction` — HloInstruction 通过 `AddCallee()` / `RemoveCallee()` 维护调用关系

### 6.5 调用关系双向维护

`AddCallee(caller, callee)` 同时更新：
- 此计算的 `callee_computations_`
- callee 的 `caller_computations_`
- Module 的 `topological_sort_`（若在同一模块）
- callee 的 `callers_`（单指针或 HashMap）

### 6.6 指令后序遍历

使用非递归 DFS（显式栈）+ `VisitMap` 位图实现，支持：
- 从 root 开始的标准后序遍历
- 从任意指令开始的子图遍历
- 考虑 channel 依赖（collective operations 必须按 channel ID 分组执行）
- Reshape 优先的特殊排序（用于某些优化场景）

### 6.7 克隆机制

`CloneWithReplacements()` 支持：
- 指令替换映射（可替换为其他指令或 nullptr 表示移除）
- 额外参数注入
- 自定义新 root（单指令或 tuple）
- 保持控制依赖关系
- 按原始顺序重排克隆指令

### 6.8 Cleanup 的稳定压缩

`Cleanup()` 使用 erase-remove 惯用法，手动实现（而非 `std::erase`）以同时维护从 `local_id_` 到 `instructions_` 索引的反向映射。

---

## 七、与外部类的交互流程

```
HloModule
  │
  ├── AddComputation(unique_ptr<HloComputation>)
  │     └── computation->set_parent(this)
  │
  └── HloPassInterface::Run(module)
        └── 遍历 computations
              └── 对 instructions 进行分析/替换/删除/新增
                    ├── AddInstruction() → instruction->set_parent(this)
                    ├── RemoveInstruction() → 两阶段删除
                    ├── ReplaceInstruction() → 更新 use-def 链
                    └── Cleanup() → 物理释放
```

---

## 八、方法分类汇总

| 分类 | 主要方法数 | 核心功能 |
|------|-----------|---------|
| 指令生命周期管理 | ~12 | Add/Remove/Replace/Cleanup |
| 参数管理 | ~7 | Add/Remove/ReplaceParameter |
| 遍历与访问 | ~6 | PostOrder/ForEach/Accept/AcceptOrdered |
| 计算创建与变换 | ~8 | Fusion/Call/Async/Clone/DeepCopy |
| 查询判断 | ~12 | IsFusion/IsEntry/HasSideEffect/IsSafelyRemovable/Equal |
| 序列化打印 | ~8 | ToString/Print/ToProto/CreateFromProto |
| 标识命名 | ~6 | name/unique_id/execution_thread/UniquifyName |
| 调用关系 | ~6 | callee/caller/FusionInstruction/GetUniqueCaller |
| 内部辅助 | ~8 | AddInstructionInternal/SetInstruction/RemoveInstructionImpl/ComputePostOrder |
