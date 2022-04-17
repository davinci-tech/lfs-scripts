### This script run all the necessary scripts
#   from the strapping directory

run () {
	sh $1 || exit $?
}

lfsStrappingDir=$(pwd)/strapping
pushd $LFS/sources
	run $lfsStrappingDir/binutils-2.38-pass1.sh
	run $lfsStrappingDir/gcc-11.2.0-pass1.sh
	run $lfsStrappingDir/glibc-2.35.sh
	run $lfsStrappingDir/libstdc++-from-gcc-11.2.0-pass1.sh
	
	run $lfsStrappingDir/m4-1.4.19.sh
	run $lfsStrappingDir/ncurses-6.3.sh
	run $lfsStrappingDir/bash-5.1.16.sh
	run $lfsStrappingDir/coreutils-9.0.sh
	run $lfsStrappingDir/diffutils-3.8.sh
	run $lfsStrappingDir/file-5.41.sh
	run $lfsStrappingDir/findutils-4.9.sh
	run $lfsStrappingDir/gawk-5.1.1.sh
	run $lfsStrappingDir/grep-3.7.sh
	run $lfsStrappingDir/gzip-1.11.sh
	run $lfsStrappingDir/make-4.3.sh
	run $lfsStrappingDir/patch-2.7.6.sh
	run $lfsStrappingDir/sed-4.8.sh
	run $lfsStrappingDir/tar-1.34.sh
	run $lfsStrappingDir/xz-5.2.5.sh

	run $lfsStrappingDir/binutils-2.38-pass2.sh
	run $lfsStrappingDir/gcc-11.2.0-pass2.sh
popd
