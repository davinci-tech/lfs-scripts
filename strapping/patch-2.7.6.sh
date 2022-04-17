### Patch 2.7.6

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf patch-2.7.6.tar.xz
pushd patch-2.7.6
	./configure \
		--prefix=/usr   \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf patch-2.7.6