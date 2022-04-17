### Diffutils 3.8

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf diffutils-3.8.tar.xz
pushd diffutils-3.8
	./configure --prefix=/usr --host=$LFS_TGT
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf diffutils-3.8