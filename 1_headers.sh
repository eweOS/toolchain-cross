#!/bin/bash

source aarch64.env

cd $DISTDIR && wget -qO- https://mirrors.tuna.tsinghua.edu.cn/kernel/v6.x/linux-6.1.3.tar.xz | tar xvJ && mv linux-6.1.3 linux && cd linux
sed -i \
    -e '/^CC/s@gcc@clang@g' \
    -e '/^HOSTCC/s@gcc@clang@g' Makefile

make ARCH=$TARGET_ARCH INSTALL_HDR_PATH=$SYSROOT/usr headers_install

cd $DISTDIR && wget -qO- https://musl.libc.org/releases/musl-1.2.3.tar.gz | tar xvz && cd musl-1.2.3

./configure --prefix=/usr --syslibdir=/usr/lib
DESTDIR=$SYSROOT make install-headers
