#!/bin/bash

source aarch64.env

cd $DISTDIR/llvm-project-15.0.6.src && mkdir build && cd build

export CMARGS=(
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DLLVM_DEFAULT_TARGET_TRIPLE="$TARGET"
    -DLLVM_HOST_TRIPLE="$TARGET"
    -DCLANG_DEFAULT_CXX_STDLIB='libc++'
    -DCLANG_DEFAULT_RTLIB='compiler-rt'
    -DLLVM_INSTALL_UTILS=ON
    -DLLVM_ENABLE_LIBCXX=ON
    -DLLVM_ENABLE_FFI=ON
    -DLLVM_INSTALL_BINUTILS_SYMLINKS=ON
    -DLLVM_BUILD_LLVM_DYLIB=ON
    -DLLVM_LINK_LLVM_DYLIB=ON
    -DLLVM_INCLUDE_BENCHMARKS=OFF
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64;RISCV"
    -DLIBCXX_HAS_MUSL_LIBC=ON
    -DLIBCXX_USE_COMPILER_RT=ON
    -DLIBCXX_INCLUDE_TESTS=OFF
    -DLIBCXX_INCLUDE_BENCHMARKS=OFF
    -DLIBCXXABI_USE_LLVM_UNWINDER=ON
    -DLIBCXX_USE_COMPILER_RT=ON
    -DLIBCXXABI_USE_COMPILER_RT=ON
    -DLIBUNWIND_USE_COMPILER_RT=ON
    -DLIBUNWIND_INSTALL_HEADERS=ON
    -DCOMPILER_RT_BUILD_SANITIZERS=OFF
    -DCOMPILER_RT_BUILD_XRAY=OFF
    -DLLVM_ENABLE_PER_TARGET_RUNTIME_DIR=OFF
    -DCMAKE_ASM_COMPILER_TARGET=$TARGET
    -DCMAKE_C_COMPILER_TARGET=$TARGET
    -DCMAKE_CXX_COMPILER_TARGET=$TARGET
    -DLLVM_TARGET_ARCH=$TARGET_CPU
    -DLLVM_TARGETS_TO_BUILD=$TARGET_CPU
    -DCMAKE_SYSROOT=$SYSROOT
    -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr
    -DLLVM_TABLEGEN=$DISTDIR/llvm-project-15.0.6.src/build-host/bin/llvm-tblgen
    -DCLANG_TABLEGEN=$DISTDIR/llvm-project-15.0.6.src/build-host/bin/clang-tblgen
)

cmake "${CMARGS[@]}" \
    -DLLVM_ENABLE_PROJECTS="clang;compiler-rt;libunwind;lld;libcxxabi;libcxx" \
    ../llvm

ninja
ninja install