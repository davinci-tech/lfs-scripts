### GCC-11.2.0 Pass 1

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
		../configure                  \
		    --target=$LFS_TGT         \
		    --prefix=$LFS/tools       \
		    --with-glibc-version=2.35 \
		    --with-sysroot=$LFS       \
		    --with-newlib             \
		    --without-headers         \
		    --enable-initfini-array   \
		    --disable-nls             \
		    --disable-shared          \
		    --disable-multilib        \
		    --disable-decimal-float   \
		    --disable-threads         \
		    --disable-libatomic       \
		    --disable-libgomp         \
		    --disable-libquadmath     \
		    --disable-libssp          \
		    --disable-libvtv          \
		    --disable-libstdcxx       \
		    --enable-languages=c,c++
		make -j4
		make install -j4
	popd
	cat gcc/limitx.h gcc/glimits.h gcc/limity.h > \
  		`dirname $($LFS_TGT-gcc -print-libgcc-file-name)`/install-tools/include/limits.h
popd
rm -drf gcc-11.2.0