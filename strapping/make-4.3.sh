### Make 4.3

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf make-4.3.tar.gz
pushd make-4.3
	./configure \
		--prefix=/usr   \
        --without-guile \
        --host=$LFS_TGT \
        --build=$(build-aux/config.guess)
    make -j4
    make install -j4 DESTDIR=$LFS
popd
rm -drf make-4.3