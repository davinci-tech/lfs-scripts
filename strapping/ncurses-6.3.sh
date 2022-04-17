### Ncurses-6.3

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf ncurses-6.3.tar.gz
pushd ncurses-6.3
	sed -i s/mawk// configure
	mkdir build
	pushd build
	  ../configure
	  make -C include
	  make -C progs tic
	popd
	./configure \
			--prefix=/usr                \
            --host=$LFS_TGT              \
            --build=$(./config.guess)    \
            --mandir=/usr/share/man      \
            --with-manpage-format=normal \
            --with-shared                \
            --without-debug              \
            --without-ada                \
            --without-normal             \
            --disable-stripping          \
            --enable-widec
    make -j4
    make install -j4 DESTDIR=$LFS TIC_PATH=$(pwd)/build/progs/tic
    echo "INPUT(-lncursesw)" > $LFS/usr/lib/libncurses.so
popd
rm -drf ncurses-6.3