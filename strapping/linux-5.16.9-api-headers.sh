### Linux-5.16.9 API headers

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf linux-5.16.9.tar.xz
pushd linux-5.16.9
	make mrproper
	make headers_install -j4
	cp -rv usr/include $LFS/usr
popd
rm -drf linux-5.16.9