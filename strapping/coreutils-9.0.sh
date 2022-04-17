### Coreutils 9.0

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf coreutils-9.0.tar.xz
pushd coreutils-9.0
	./configure \
		--prefix=/usr                     \
        --host=$LFS_TGT                   \
        --build=$(build-aux/config.guess) \
        --enable-install-program=hostname \
        --enable-no-install-program=kill,uptime
    make -j4
    make install -j4 DESTDIR=$LFS

    mv -v $LFS/usr/bin/chroot              $LFS/usr/sbin
	mkdir -pv $LFS/usr/share/man/man8
	mv -v $LFS/usr/share/man/man1/chroot.1 $LFS/usr/share/man/man8/chroot.8
	sed -i 's/"1"/"8"/'                    $LFS/usr/share/man/man8/chroot.8
popd
rm -drf coreutils-9.0