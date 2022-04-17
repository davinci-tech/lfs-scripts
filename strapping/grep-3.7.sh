### Grep 3.7

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf grep-3.7.tar.xz
pushd grep-3.7
	./configure \
		--prefix=/usr   \
        --host=$LFS_TGT
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf grep-3.7