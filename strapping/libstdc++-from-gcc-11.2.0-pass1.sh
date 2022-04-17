### Libstdc++ from GCC-11.2.0 Pass 1

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf gcc-11.2.0.tar.xz
pushd gcc-11.2.0
	mkdir -pv build
	pushd build	
	../libstdc++-v3/configure           \
	    --host=$LFS_TGT                 \
	    --build=$(../config.guess)      \
	    --prefix=/usr                   \
	    --disable-multilib              \
	    --disable-nls                   \
	    --disable-libstdcxx-pch         \
	    --with-gxx-include-dir=/tools/$LFS_TGT/include/c++/11.2.0
		make -j4
		make install -j4 DESTDIR=$LFS
	popd
popd
rm -drf gcc-11.2.0