### Xz 5.2.5

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf xz-5.2.5.tar.xz
pushd xz-5.2.5
	./configure \
		--prefix=/usr                     \
        --host=$LFS_TGT                   \
        --build=$(build-aux/config.guess) \
        --disable-static                  \
        --docdir=/usr/share/doc/xz-5.2.5
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf xz-5.2.5