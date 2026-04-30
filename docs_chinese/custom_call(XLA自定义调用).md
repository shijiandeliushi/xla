> 本文翻译自 docs/custom_call.md

# XLA 自定义调用

本文档介绍如何使用 XLA FFI 库编写和使用 XLA 自定义调用。自定义调用是一种在 HLO 模块中向 XLA 编译器（在编译时）描述外部“操作”的机制，而 XLA FFI 是一种在运行时向 XLA 注册此类操作实现的机制。FFI 代表“外部函数接口”，它是一组 C API，定义了 XLA 调用用其他编程语言编写的外部代码的二进制接口（ABI）。XLA 为用 C++ 编写的 XLA FFI 提供了仅头文件的绑定，这些绑定向最终用户隐藏了底层 C API 的所有低级细节。

> **注意** 自定义调用 API/ABI 使用 PJRT 风格的版本控制（主版本号，次版本号），但目前它仍处于试验阶段，随时可能被破坏。一旦 API/ABI 最终确定，我们打算提供类似于 PJRT 的稳定性保证。

> **注意** 使用自定义调用宏 API 注册的函数，其 HLO 可见的名称不尊重 C++ 命名空间。因此，不同库注册的函数完全可能发生意外冲突！API 会拒绝此类重复注册，但为了避免大型项目中的问题，最安全的选择是：要么在 `XLA_REGISTER_CUSTOM_CALL` 注册宏和自定义调用目标引用中，对所有函数引用进行完整的命名空间限定；要么直接在函数名中使用 C 风格的命名空间。

## JAX + XLA 自定义调用

有关将自定义调用和 XLA FFI 与 JAX 集成的端到端示例，请参阅 [JAX 文档](https://jax.readthedocs.io/en/latest/ffi.html)

## XLA FFI 绑定

XLA FFI 绑定是对自定义调用签名的编译时规范：自定义调用参数、属性及其类型，以及通过执行上下文传递的附加参数（例如，GPU 后端的 GPU 流）。XLA FFI 绑定可以绑定到任何具有兼容 `operator()` 签名的 C++ 可调用对象（函数指针、lambda 等）。构造的处理程序会解码 XLA FFI 调用帧（由稳定的 C API 定义），对所有参数进行类型检查，并将解码后的结果转发给用户定义的回调。

XLA FFI 绑定 heavily 依赖于模板元编程，以便能够将构造的处理程序编译成最高效的机器代码。每个自定义调用参数的运行时开销在几纳秒的数量级。

XLA FFI 自定义点作为模板特化实现，用户可以定义如何解码其自定义类型，例如，可以为用户定义的 `enum class` 类型定义自定义解码。

### 从自定义调用返回错误

自定义调用实现必须返回 `xla::ffi::Error` 值，以向 XLA 运行时指示成功或错误。它类似于 `absl::Status`，并具有相同的错误代码集。我们不使用 `absl::Status`，因为它没有稳定的 ABI，在动态加载的自定义调用库和 XLA 本身之间传递它是不安全的。

```c++
// 总是返回错误的处理程序。
auto always_error = Ffi::Bind().To(
    []() { return Error(ErrorCode::kInternal, "Oops!"); });

// 总是返回成功的处理程序。
auto always_success = Ffi::Bind().To(
    []() { return Error::Success(); });

```

### 缓冲区参数和结果

XLA 对结果使用目标传递风格：自定义调用（或任何其他 XLA 操作）不会为结果分配内存，而是写入由 XLA 运行时传递的目标。XLA 使用静态缓冲区分配，并在编译时根据所有值的生存期为其分配缓冲区。

传递给 FFI 处理程序的结果被包装在 `Result<T>` 模板中，它具有类似指针的语义： `operator->` 提供对底层参数的访问。

`AnyBuffer` 参数和结果允许访问任何数据类型的自定义调用缓冲区参数。当自定义调用具有适用于多种数据类型的通用实现，并且自定义调用实现根据数据类型进行运行时调度时，这非常有用。`AnyBuffer` 提供对缓冲区数据类型、维度和指向缓冲区本身的指针的访问。

```mlir
%0 = "stablehlo.custom_call"(%arg0) {
  call_target_name = "foo",
  api_version = 4 : i32
} : (tensor<2x2xf32>) -> tensor<2x2xf32>
```


```c++
// 任意维度和数据类型的缓冲区。
auto handler = Ffi::Bind().Arg<AnyBuffer>().Ret<AnyBuffer>().To(
    [](AnyBuffer arg, Result<AnyBuffer> res) -> Error {
      void* arg_data = arg.untyped_data();
      void* res_data = res->untyped_data();
      return Error::Success();
    });
```

### 带约束的缓冲区参数和结果

`Buffer` 允许添加对缓冲区数据类型和维度的约束，如果运行时参数与 FFI 处理程序签名不匹配，处理程序将自动检查这些约束并向 XLA 运行时返回错误。
```c++
// 任意维度、F32 数据类型的缓冲区。
auto handler = Ffi::Bind().Arg<Buffer<F32>>().Ret<Buffer<F32>>().To(
    [](Buffer<F32> arg, Result<Buffer<F32>> res) -> Error {
      float* arg_data = arg.typed_data();
      float* res_data = res->typed_data();
      return Error::Success();
    });
```

```c++
// 维度为 2、F32 数据类型的缓冲区。
auto handler = Ffi::Bind().Arg<BufferR2<F32>>().Ret<BufferR2<F32>>().To(
    [](BufferR2<F32> arg, Result<BufferR2<F32>> res) -> Error {
      float* arg_data = arg.typed_data();
      float* res_data = res->typed_data();
      return Error::Success();
    });
```

### 可变参数和结果

如果自定义调用的不同实例中参数和结果的数量可能不同，则可以在运行时使用 `RemainingArgs` 和 `RemainingRets` 进行解码。

```
auto handler = Ffi::Bind().RemainingArgs().RemainingRets().To(
    [](RemainingArgs args, RemainingRets results) -> Error {
      ErrorOr<AnyBuffer> arg = args.get<AnyBuffer>(0);
      ErrorOr<Result<AnyBuffer>> res = results.get<AnyBuffer>(0);

      if (!arg.has_value()) {
        return Error(ErrorCode::kInternal, arg.error());
      }

      if (!res.has_value()) {
        return Error(ErrorCode::kInternal, res.error());
      }

      return Error::Success();
    });
```

可变参数和结果可以在常规参数和结果之后声明，但在可变参数之后绑定常规参数和结果是非法的。

```c++
auto handler =
    Ffi::Bind()
        .Arg<AnyBuffer>()
        .RemainingArgs()
        .Ret<AnyBuffer>()
        .RemainingRets()
        .To([](AnyBuffer arg, RemainingArgs args, AnyBuffer ret,
               RemainingRets results) -> Error { return Error::Success(); });
```

### Attributes

XLA FFI 支持将作为 `mlir::DictionaryAttr`  传递的`custom_call` `backend_config` 自动解码为 FFI 处理程序参数。

注意：有关详细信息，请参阅 [stablehlo RFC](https://github.com/openxla/stablehlo/blob/main/rfcs/20240312-standardize-customcallop.md)以及 `stablehlo.custom_call` 操作规范。

```mlir
%0 = "stablehlo.custom_call"(%arg0) {
  call_target_name = "foo",
  backend_config= {
    i32 = 42 : i32,
    str = "string"
  },
  api_version = 4 : i32
} : (tensor<f32>) -> tensor<f32>
```

在此示例中，自定义调用有一个缓冲区参数和两个属性，XLA FFI 可以自动解码它们并将它们传递给用户定义的可调用对象。

```c++
auto handler = Ffi::Bind()
  .Arg<BufferR0<F32>>()
  .Attr<int32_t>("i32")
  .Attr<std::string_view>("str")
  .To([](BufferR0<F32> buffer, int32_t i32, std::string_view str) {
    return Error::Success();
  });
```

### 用户定义的枚举属性

XLA FFI 可以自动将整数 MLIR 属性解码为用户定义的枚举。枚举类必须具有相同的底层整数类型，并且必须使用 XLA FFI 显式注册解码。


```mlir
%0 = "stablehlo.custom_call"(%arg0) {
  call_target_name = "foo",
  backend_config= {
    command = 0 : i32
  },
  api_version = 4 : i32
} : (tensor<f32>) -> tensor<f32>
```

```c++
enum class Command : int32_t {
  kAdd = 0,
  kMul = 1,
};

XLA_FFI_REGISTER_ENUM_ATTR_DECODING(Command);

auto handler = Ffi::Bind().Attr<Command>("command").To(
    [](Command command) -> Error { return Error::Success(); });
```

### 绑定所有自定义调用属性

可以以字典的形式访问所有自定义调用属性，并仅延迟解码运行时需要的属性。

```c++
auto handler = Ffi::Bind().Attrs().To([](Dictionary attrs) -> Error {
  ErrorOr<int32_t> i32 = attrs.get<int32_t>("i32");
  return Error::Success();
});
```

### 用户定义的结构体属性

XLA FFI 可以将字典属性解码为用户定义的结构体。

```mlir
%0 = "stablehlo.custom_call"(%arg0) {
  call_target_name = "foo",
  backend_config= {
    range = { lo = 0 : i64, hi = 42 : i64 }
  },
  api_version = 4 : i32
} : (tensor<f32>) -> tensor<f32>
```

在上面的示例中， `range` 是一个 `mlir::DictionaryAttr` 属性，可以不通过名称访问字典字段，而是自动解码为 C++ 结构体。解码必须使用`XLA_FFI_REGISTER_STRUCT_ATTR_DECODING` 宏显式注册（它在幕后定义了 `::xla::ffi` 命名空间中的模板特化，因此该宏必须添加到全局命名空间）。

```c++
struct Range {
  int64_t lo;
  int64_t hi;
};

XLA_FFI_REGISTER_STRUCT_ATTR_DECODING(Range, StructMember<int64_t>("lo"),
                                             StructMember<int64_t>("hi"));

auto handler = Ffi::Bind().Attr<Range>("range").To([](Range range) -> Error{
  return Error::Success();
});
```

自定义属性可以像任何其他属性一样从字典中加载。在下面的示例中，所有自定义调用属性都解码为一个`Dictionary`，并且可以通过名称访问 `range`。

```c++
auto handler = Ffi::Bind().Attrs().To([](Dictionary attrs) -> Error {
  ErrorOr<Range> range = attrs.get<Range>("range");
  return Error::Success();
});
```

## 在 CPU 上创建自定义调用

您可以通过 XLA 的客户端 API 创建表示自定义调用的 HLO 指令。例如，以下代码在 CPU 上使用自定义调用计算 `A[i] = B[i %128]+ C[i]` 。（当然，您可以用常规 HLO 完成此操作，而且应该这样做！）

```c++
#include "xla/client/xla_builder.h"
#include "xla/service/custom_call_target_registry.h"

void do_it() {
  xla::XlaBuilder b("do_it");
  xla::XlaOp param0 =
      xla::Parameter(&b, 0, xla::ShapeUtil::MakeShape(xla::F32, {128}), "p0");
  xla::XlaOp param1 =
      xla::Parameter(&b, 1, xla::ShapeUtil::MakeShape(xla::F32, {2048}), "p1");
  xla::XlaOp custom_call =
      xla::CustomCall(&b, "do_custom_call", /*operands=*/{param0, param1},
        /*shape=*/xla::ShapeUtil::MakeShape(xla::F32, {2048}),
        /*opaque=*/"", /*has_side_effect=*/false,
        /*output_operand_aliasing=*/{}, /*literal=*/nullptr,
        /*schedule=*/CustomCallSchedule::SCHEDULE_NONE,
        /*api_version=*/CustomCallApiVersion::API_VERSION_TYPED_FFI);
}

// 将自定义调用参数约束为一维 F32 数据类型的缓冲区。
using BufferF32 = xla::ffi::BufferR1<xla::ffi::DataType::F32>;

// 将自定义调用实现为 C++ 函数。请注意，我们可以使用 XLA FFI 定义的 `Buffer` 类型，它允许我们访问缓冲区数据类型和形状。
xla::ffi::Error do_custom_call(BufferF32 in0, BufferF32 in1,
                               xla::ffi::Result<BufferF32> out) {
  size_t d0 = in0.dimensions[0];
  size_t d1 = in1.dimensions[0];

  // 检查维度是否兼容。
  assert(out->dimensions[0] == d1 && "unexpected dimensions");

  for (size_t i = 0; i < d1; ++i) {
    out->data[i] = in0.data[i % d0] + in1.data[i];
  }
}

// 显式定义 XLA FFI 处理程序签名并将其绑定到 `do_custom_call` 实现。
// XLA FFI 处理程序可以从自定义调用函数自动推断类型签名，但它依赖于神奇的模板元编程，
// 显式绑定提供了一个额外的类型检查级别，并清楚地表明了自定义调用作者的意图。
XLA_FFI_DEFINE_HANDLER(handler, do_custom_call,
                       ffi::Ffi::Bind()
                           .Arg<Buffer>()
                           .Arg<Buffer>()
                           .Ret<Buffer>());

// 在 "Host" 平台上向 XLA FFI 注册 `handler`。
XLA_FFI_REGISTER_HANDLER(xla::ffi::GetXlaFfiApi(), "do_custom_call",
                         "Host", handler);
```

## 在 GPU 上创建自定义调用

使用 XLA FFI 注册 GPU 自定义调用几乎相同，唯一的区别是对于 GPU，您需要请求底层平台流（CUDA 或 ROCM 流）以便能够在设备上启动内核。以下是一个 CUDA 示例，执行与上述 CPU 代码相同的计算 (`A[i] = B[i % 128] + C[i]`)。

```c++
void do_it() { /* 与上述实现相同 */ }

__global__ custom_call_kernel(const float* in0, const float* in1, float* out) {
  size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
  out[idx] = in0[idx % 128] + in1[idx];
}

void do_custom_call(CUstream stream, BufferF32 in0, BufferF32 in1,
                    xla::ffi::Result<BufferF32> out) {
  size_t d0 = in0.dimensions[0];
  size_t d1 = in1.dimensions[0];
  size_t d2 = out->dimensions[0];

  assert(d0 == 128 && d1 == 2048 && d2 == 2048 && "意外的维度");

  const int64_t block_dim = 64;
  const int64_t grid_dim = 2048 / block_dim;
  custom_call_kernel<<<grid_dim, block_dim, 0, stream>>>(
    in0.data, in1.data, out->data);
}

XLA_FFI_DEFINE_HANDLER(handler, do_custom_call,
                       ffi::Ffi::Bind()
                           .Ctx<xla::ffi::PlatformStream<CUstream>>()
                           .Arg<BufferF32>()
                           .Arg<BufferF32>()
                           .Ret<BufferF32>());

XLA_FFI_REGISTER_HANDLER(xla::ffi::GetXlaFfiApi(), "do_custom_call",
                         "CUDA", handler);
```

首先请注意，GPU 自定义调用函数仍然是在 CPU 上执行的函数。 `do_custom_call`CPU 函数负责在 GPU 上排队工作。此处它启动了一个 CUDA 内核，但它也可以执行其他操作，比如调用 cuBLAS。

参数和结果也位于主机上，`data` 成员包含指向设备（即 GPU）内存的指针。传递给自定义调用处理程序的缓冲区具有底层设备缓冲区的形状，因此自定义调用可以从中计算内核启动参数。

## 向自定义调用传递元组

考虑以下自定义调用。

```c++
using xla::ShapeUtil;
using xla::F32;
Shape p0_shape = ShapeUtil::MakeTuple({
    ShapeUtil::MakeShape(F32, {32}),
    ShapeUtil::MakeTuple({
        ShapeUtil::MakeShape(F32, {64}),
        ShapeUtil::MakeShape(F32, {128}),
    }),
    ShapeUtil::MakeShape(F32, {256}),
});
xla::XlaOp p0 = xla::Parameter(0, p0_shape, "p0");

Shape out_shape = ShapeUtil::MakeTuple({
  ShapeUtil::MakeShape(F32, {512}),
  ShapeUtil::MakeShape(F32, {1024}),
});
xla::CustomCall(&b, "do_custom_call", /*operands=*/{p0}, out_shape, ...);
```

在 CPU 和 GPU 上，元组在内存中表示为一个指针数组。当 XLA 调用带有元组参数或结果的自定义调用时，它会将其展平并作为常规缓冲区参数或结果传递。

### 作为临时缓冲区的元组输出

自定义调用的元组输入是一种便利，但它们并非严格必需。如果我们不支持自定义调用的元组输入，您始终可以在将元组传递给自定义调用之前使用 get-tuple-element 将其解包。

另一方面，元组输出确实允许您做一些否则无法做到的事情。

拥有元组输出的一个明显原因是，元组输出是自定义调用（或任何其他 XLA 操作）返回多个独立数组的方式。

但不太明显的是，元组输出也是为自定义调用提供临时内存的一种方式。是的，一个输出可以代表一个临时缓冲区。考虑一下，输出缓冲区具有这样的特性：操作可以写入它，并且在写入之后可以从中读取。这正是您对临时缓冲区的要求。

在上面的例子中，假设我们想将 `F32[1024]` 用作临时缓冲区。那么我们可以像上面那样编写 HLO，并且我们根本不读取自定义调用输出的元组索引 1。
