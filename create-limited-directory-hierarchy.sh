if [ -z $LFS ] ; then
  echo "LFS variable is not set!"
  echo "Bye bye..."
  exit 1
fi

### Create a limited directory hierarchy so that the temporary toolchain that
#   will be compiled (Chapters 5 and 6, LFS 11.1) may be installed and used.
#   Note that when we will rebuild the packages (Chapter 8, LFS 11.1), the
#   binaries and libraries located in this directories will be overwriten.

mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv $LFS/usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

mkdir -pv $LFS/tools