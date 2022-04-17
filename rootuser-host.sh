### Root user - Host
#   This scripts must be run on the host system,
#   as the root user. Also, the LFS variable must be set.

run () {
	sh $1 || exit $?
}

if [ -z $LFS ] ; then
  echo "LFS variable is not set!"
  echo "Bye bye..."
  exit 1
fi

run $(pwd)/check-requirements.sh
run $(pwd)/create-limited-directory-hierarchy.sh

mkdir $LFS/sources
pushd $LFS/sources
	run $(pwd)/download-tarballs.sh
popd

run $(pwd)/create-lfs-user.sh