### Bash-5.1.16

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf bash-5.1.16.tar.gz
pushd bash-5.1.16
	./configure \
		--prefix=/usr                   \
        --build=$(support/config.guess) \
        --host=$LFS_TGT                 \
        --without-bash-malloc
    make -j4
    make install -j4 DESTDIR=$LFS
    ln -sv $LFS/bin/bash $LFS/bin/sh
popd
rm -drf bash-5.1.16