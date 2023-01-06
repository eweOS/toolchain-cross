source aarch64.env

cd $DISTDIR/llvm-project-15.0.6.src && mkdir build-host && cd build-host

cmake ../llvm -DLLVM_ENABLE_PROJECTS='clang;compiler-rt;lld;lldb;clang-tools-extra' -GNinja -DCMAKE_BUILD_TYPE=Release

ninja llvm-tblgen clang-tblgen lldb-tblgen 
