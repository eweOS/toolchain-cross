source aarch64.env

cd $DISTDIR/musl-1.2.3
make distclean
./configure --prefix=/usr --syslibdir=/usr/lib LIBCC=/usr/lib/clang/15.0.6/lib/linux/libclang_rt.builtins-${TARGET_CPU}.a
make -j13
DESTDIR=$SYSROOT make install
