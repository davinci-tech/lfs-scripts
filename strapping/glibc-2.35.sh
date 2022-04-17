### Glibc-2.35

if [ -z $LFS ] || [ -z $LFS_TGT ] ; then
	echo "LFS or LFS_TGT variable is not set!"
	echo "Bye bye..."
	exit 1
fi

tar xvf glibc-2.35.tar.xz
pushd glibc-2.35
	case $(uname -m) in
	    i?86)   ln -sfv ld-linux.so.2 $LFS/lib/ld-lsb.so.3
	    ;;
	    x86_64) ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64
	            ln -sfv ../lib/ld-linux-x86-64.so.2 $LFS/lib64/ld-lsb-x86-64.so.3
	    ;;
    esac
    
    patch -Np1 -i ../glibc-2.35-fhs-1.patch
    mkdir -pv build

    pushd build
    	echo "rootsbindir=/usr/sbin" > configparms
    	../configure                             \
	      --prefix=/usr                      \
	      --host=$LFS_TGT                    \
	      --build=$(../scripts/config.guess) \
	      --enable-kernel=3.2                \
	      --with-headers=$LFS/usr/include    \
	      libc_cv_slibdir=/usr/lib
	    make -j1
	    make install -j4 DESTDIR=$LFS
	    sed '/RTLDLIST=/s@/usr@@g' -i $LFS/usr/bin/ldd
	    $LFS/tools/libexec/gcc/$LFS_TGT/11.2.0/install-tools/mkheaders
    popd
popd
rm -drf glibc-2.35

### Note that this script script won't check to see if the compiler runs correctly