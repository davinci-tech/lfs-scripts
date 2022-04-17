### Binutils-2.38 Pass 1

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf binutils-2.38.tar.xz
pushd binutils-2.38
	mkdir -pv build
	pushd build
		../configure \
			 --prefix=$LFS/tools \
             --with-sysroot=$LFS \
             --target=$LFS_TGT   \
             --disable-nls       \
             --disable-werror
        make -j4
        make install -j4
	popd
popd
rm -drf binutils-2.38