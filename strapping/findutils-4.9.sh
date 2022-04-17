### Findutils 4.9

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf findutils-4.9.0.tar.xz
pushd findutils-4.9.0
	./configure \
		--prefix=/usr                   \
        --localstatedir=/var/lib/locate \
        --host=$LFS_TGT                 \
        --build=$(build-aux/config.guess)
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf findutils-4.9.0