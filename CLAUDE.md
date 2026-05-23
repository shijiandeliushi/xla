# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build System

OpenXLA uses **Bazel** (via Bazelisk for auto-versioning). Docker is recommended but optional thanks to hermetic CUDA rules.

### Configure backend

```sh
./configure.py --backend=CPU                     # CPU-only
./configure.py --backend=CUDA                    # GPU with auto-detect compute capabilities
./configure.py --backend=CUDA --cuda_compute_capabilities="9.0"  # GPU, manual compute cap
```

This generates `xla_configure.bazelrc` with compiler paths and tag filters.

### Build

```sh
bazel build //xla/...                           # Build all
bazel build //xla/hlo/ir:hlo                    # Build specific target
```

### Run tests

```sh
bazel test //xla/hlo/ir:hlo_opcode_test         # Single test target
bazel test //xla/hlo/ir:all                     # All tests in a package
bazel test --test_output=all //xla/hlo/ir:hlo_opcode_test  # Show test output
```

`bazel test` respects `--test_size_filters small,medium` from `xla_configure.bazelrc`, skipping large tests by default.

### Generate compile_commands.json (for IDE support)

```sh
bazel run :xla_compile_commands
```

### Linting

Linting is enforced via CI (buildifier for Bazel, clang-format for C++). The lint configs are in `build_tools/lint/`.

## Architecture

### Core IR: `xla/hlo/ir/`

The HLO (High-Level Operations) IR is the heart of the compiler. The key classes form a hierarchy:

- **`HloModule`** — top-level container holding computations, config, and metadata
- **`HloComputation`** — a function body; a DAG of `HloInstruction` nodes
- **`HloInstruction`** — a single operation in the computation graph. Opcodes are defined in `hlo_opcode.h` via the `HLO_OPCODE_LIST` macro (~100+ opcodes covering element-wise ops, collectives, control flow, fusions)

### Pass Infrastructure: `xla/hlo/pass/`

All compiler passes derive from `HloPassInterface` (in practice, `HloModulePass`). Passes are composed in `HloPassPipeline`. The `Run()` method returns whether the module was modified.

Passes are organized by purpose:
- **`xla/hlo/transforms/`** — HLO-level optimization and transform passes (algebraic simplification, fusion, scheduling, layout assignment, etc.)
- **`xla/service/`** — ~445 files covering the broader compiler service: buffer assignment, memory planning, collective decomposition, and backend-agnostic transforms. This is the largest directory in the compiler.

### HLO Builder: `xla/hlo/builder/`

Frontend-facing API for programmatically constructing HLO computations:
- **`XlaBuilder`** — builder interface for creating HLO instructions
- **`XlaComputation`** — a built computation ready for compilation

### Backends: `xla/backends/`

Each backend has two parts — a **compiler** transforming HLO into executable code, and a **runtime** executing it:
- **`xla/backends/cpu/`** — CPU backend (uses LLVM via codegen)
- **`xla/backends/gpu/`** — GPU/CUDA backend (codegen + runtime + autotuning)
- **`xla/backends/interpreter/`** — reference interpreter for debugging

### Code Generation: `xla/codegen/`

Device code generation infrastructure. Contains emitters that translate HLO to LLVM IR or device-specific kernels. Shared between backends where appropriate.

### Runtime: `xla/pjrt/`

PJRT (Pretty Much Just Another Runtime) is the unified runtime interface. `PjRtClient` provides device-agnostic APIs for compiling and executing computations. This is what JAX, PyTorch/XLA, and TensorFlow use to talk to XLA.

### Stream Executor: `xla/stream_executor/`

Hardware abstraction layer for GPUs and other accelerators. Provides a unified interface for CUDA, ROCm, and other device APIs. Handles streams, kernels, memory allocation, and BLAS libraries.

### MLIR: `xla/mlir/`

MLIR-based HLO representation that mirrors the native HLO IR. Used by some frontends (JAX, StableHLO) to produce XLA computations via MLIR dialects (mhlo, lmhlo).

### Client: `xla/client/`

High-level client library for compiling and executing XLA computations (`Client`, `LocalClient`, `CompileOnlyClient`).

### Common Utilities: `xla/`

Files at the top level provide ubiquitous utilities: `Shape`/`Layout` representation, `Literal` (concrete data values), `XlaBuilder`, status macros, and protocol buffer definitions (`xla_data.proto`, `xla.proto`).

## Key Conventions

- **C++ standard**: Google C++ Style Guide
- **Tests**: Each module has a corresponding `*_test.cc` file using Google Test. Tests are declared with the `xla_cc_test` macro from `xla.default.bzl`
- **Build visibility**: Controlled via `package_groups.bzl`; most internal targets are restricted to `:friends` groups
- **Status handling**: Use `absl::Status` / `absl::StatusOr` throughout. The `TF_ASSIGN_OR_RETURN` macro (from `status_macros.h`) is used for propagating errors
