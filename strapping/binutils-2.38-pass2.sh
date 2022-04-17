### Binutils-2.38 Pass 2

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf binutils-2.38.tar.xz
pushd binutils-2.38
	sed '6009s/$add_dir//' -i ltmain.sh
	mkdir -v build
	pushd build
		../configure                   \
		    --prefix=/usr              \
		    --build=$(../config.guess) \
		    --host=$LFS_TGT            \
		    --disable-nls              \
		    --enable-shared            \
		    --disable-werror           \
		    --enable-64-bit-bfd
	    make -j4
	    make install -j4 DESTDIR=$LFS
    popd
popd
rm -drf binutils-2.38