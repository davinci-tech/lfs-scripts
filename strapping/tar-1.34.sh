### Tar 1.34

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf tar-1.34.tar.xz
pushd tar-1.34
	./configure \
		--prefix=/usr                     \
        --host=$LFS_TGT                   \
        --build=$(build-aux/config.guess)
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf tar-1.34