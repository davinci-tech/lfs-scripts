### File 5.41

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf file-5.41.tar.gz
pushd file-5.41
	mkdir build
	pushd build
	    ../configure --disable-bzlib      \
	                 --disable-libseccomp \
	                 --disable-xzlib      \
	                 --disable-zlib
	    make
	popd
	./configure --prefix=/usr --host=$LFS_TGT --build=$(./config.guess)
	make FILE_COMPILE=$(pwd)/build/src/file -j4
	make DESTDIR=$LFS install -j4
popd
rm -drf file-5.41