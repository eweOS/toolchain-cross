#!/bin/bash

source aarch64.env

mkdir -pv $SYSROOT
mkdir -pv $INITRAMFS
mkdir -pv $DISTDIR

mkdir -pv $XDG_BIN
ln -s `which lld` $XDG_BIN/${CROSS_COMPILE}ld
ln -s `which lld` $XDG_BIN/${CROSS_COMPILE}ld.lld
ln -s `which clang` $XDG_BIN/${CROSS_COMPILE}gcc
ln -s `which clang` $XDG_BIN/${CROSS_COMPILE}clang
ln -s `which clang++` $XDG_BIN/${CROSS_COMPILE}g++
ln -s `which clang++` $XDG_BIN/${CROSS_COMPILE}clang++
for i in ar nm objcopy objdump ranlib strip;do
  ln -s `which llvm-$i` $XDG_BIN/${CROSS_COMPILE}$i
done

