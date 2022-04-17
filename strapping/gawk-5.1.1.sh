### Gawk 5.1.1

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf gawk-5.1.1.tar.xz
pushd gawk-5.1.1
	sed -i 's/extras//' Makefile.in
	./configure \
		--prefix=/usr   \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf gawk-5.1.1