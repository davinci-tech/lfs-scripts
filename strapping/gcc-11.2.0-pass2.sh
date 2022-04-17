### GCC-11.2.0 Pass 2

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf gcc-11.2.0.tar.xz
pushd gcc-11.2.0
	tar xvf ../mpfr-4.1.0.tar.xz
	tar xvf ../gmp-6.2.1.tar.xz
	tar xvf ../mpc-1.2.1.tar.gz
	mv mpfr-4.1.0 mpfr
	mv gmp-6.2.1 gmp
	mv mpc-1.2.1 mpc

	case $(uname -m) in
  		x86_64)
	    sed -e '/m64=/s/lib64/lib/' \
	        -i.orig gcc/config/i386/t-linux64
	 ;;
	esac

	mkdir -pv build
	pushd build
		mkdir -pv $LFS_TGT/libgcc
		ln -s ../../../libgcc/gthr-posix.h $LFS_TGT/libgcc/gthr-default.h
		../configure                                       \
		    --build=$(../config.guess)                     \
		    --host=$LFS_TGT                                \
		    --prefix=/usr                                  \
		    CC_FOR_TARGET=$LFS_TGT-gcc                     \
		    --with-build-sysroot=$LFS                      \
		    --enable-initfini-array                        \
		    --disable-nls                                  \
		    --disable-multilib                             \
		    --disable-decimal-float                        \
		    --disable-libatomic                            \
		    --disable-libgomp                              \
		    --disable-libquadmath                          \
		    --disable-libssp                               \
		    --disable-libvtv                               \
		    --disable-libstdcxx                            \
		    --enable-languages=c,c++
		make -j4
		make install -j4 DESTDIR=$LFS
	popd
	ln -sv gcc $LFS/usr/bin/cc	
popd
rm -drf gcc-11.2.0