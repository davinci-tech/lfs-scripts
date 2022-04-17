### M4-1.4.19

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf m4-1.4.19.tar.xz
pushd m4-1.4.19
	./configure \
		--prefix=/usr   \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf m4-1.4.19