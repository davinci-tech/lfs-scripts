### Gzip 1.11

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf gzip-1.11.tar.xz
pushd gzip-1.11
	./configure --prefix=/usr --host=$LFS_TGT
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf gzip-1.11