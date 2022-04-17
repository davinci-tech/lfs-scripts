### Download all the necessary tarballs

cat > wget-list.tmp << EOF
https://download.savannah.gnu.org/releases/acl/acl-2.3.1.tar.xz
https://download.savannah.gnu.org/releases/attr/attr-2.5.1.tar.gz
https://ftp.gnu.org/gnu/autoconf/autoconf-2.71.tar.xz
https://ftp.gnu.org/gnu/automake/automake-1.16.5.tar.xz
https://ftp.gnu.org/gnu/bash/bash-5.1.16.tar.gz
https://github.com/gavinhoward/bc/releases/download/5.2.2/bc-5.2.2.tar.xz
https://ftp.gnu.org/gnu/binutils/binutils-2.38.tar.xz
https://ftp.gnu.org/gnu/bison/bison-3.8.2.tar.xz
https://www.sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz
https://github.com/libcheck/check/releases/download/0.15.2/check-0.15.2.tar.gz
https://ftp.gnu.org/gnu/coreutils/coreutils-9.0.tar.xz
https://dbus.freedesktop.org/releases/dbus/dbus-1.12.20.tar.gz
https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.3.tar.gz
https://ftp.gnu.org/gnu/diffutils/diffutils-3.8.tar.xz
https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.46.5/e2fsprogs-1.46.5.tar.gz
https://sourceware.org/ftp/elfutils/0.186/elfutils-0.186.tar.bz2
https://github.com/eudev-project/eudev/releases/download/v3.2.11/eudev-3.2.11.tar.gz
https://prdownloads.sourceforge.net/expat/expat-2.4.6.tar.xz
https://prdownloads.sourceforge.net/expect/expect5.45.4.tar.gz
https://astron.com/pub/file/file-5.41.tar.gz
https://ftp.gnu.org/gnu/findutils/findutils-4.9.0.tar.xz
https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
https://ftp.gnu.org/gnu/gawk/gawk-5.1.1.tar.xz
https://ftp.gnu.org/gnu/gcc/gcc-11.2.0/gcc-11.2.0.tar.xz
https://ftp.gnu.org/gnu/gdbm/gdbm-1.23.tar.gz
https://ftp.gnu.org/gnu/gettext/gettext-0.21.tar.xz
https://ftp.gnu.org/gnu/glibc/glibc-2.35.tar.xz
https://ftp.gnu.org/gnu/gmp/gmp-6.2.1.tar.xz
https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz
https://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz
https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz
https://ftp.gnu.org/gnu/grub/grub-2.06.tar.xz
https://ftp.gnu.org/gnu/gzip/gzip-1.11.tar.xz
https://github.com/Mic92/iana-etc/releases/download/20220207/iana-etc-20220207.tar.gz
https://ftp.gnu.org/gnu/inetutils/inetutils-2.2.tar.xz
https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz
https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.16.0.tar.xz
https://files.pythonhosted.org/packages/source/J/Jinja2/Jinja2-3.0.3.tar.gz
https://www.kernel.org/pub/linux/utils/kbd/kbd-2.4.0.tar.xz
https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-29.tar.xz
https://www.greenwoodsoftware.com/less/less-590.tar.gz
https://www.linuxfromscratch.org/lfs/downloads/11.1/lfs-bootscripts-20210608.tar.xz
https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.63.tar.xz
https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.5.tar.gz
https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
https://www.kernel.org/pub/linux/kernel/v5.x/linux-5.16.9.tar.xz
https://ftp.gnu.org/gnu/m4/m4-1.4.19.tar.xz
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz
https://download.savannah.gnu.org/releases/man-db/man-db-2.10.1.tar.xz
https://www.kernel.org/pub/linux/docs/man-pages/man-pages-5.13.tar.xz
https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-2.0.1.tar.gz
https://github.com/mesonbuild/meson/releases/download/0.61.1/meson-0.61.1.tar.gz
https://ftp.gnu.org/gnu/mpc/mpc-1.2.1.tar.gz
https://www.mpfr.org/mpfr-4.1.0/mpfr-4.1.0.tar.xz
https://invisible-mirror.net/archives/ncurses/ncurses-6.3.tar.gz
https://github.com/ninja-build/ninja/archive/v1.10.2/ninja-1.10.2.tar.gz
https://www.openssl.org/source/openssl-3.0.1.tar.gz
https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz
https://www.cpan.org/src/5.0/perl-5.34.0.tar.xz
https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.17.tar.xz
https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.4.tar.xz
https://www.python.org/ftp/python/3.10.2/Python-3.10.2.tar.xz
https://www.python.org/ftp/python/doc/3.10.2/python-3.10.2-docs-html.tar.bz2
https://ftp.gnu.org/gnu/readline/readline-8.1.2.tar.gz
https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz
https://github.com/shadow-maint/shadow/releases/download/v4.11.1/shadow-4.11.1.tar.xz
https://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz
https://github.com/systemd/systemd/archive/v250/systemd-250.tar.gz
https://anduin.linuxfromscratch.org/LFS/systemd-man-pages-250.tar.xz
https://download.savannah.gnu.org/releases/sysvinit/sysvinit-3.01.tar.xz
https://ftp.gnu.org/gnu/tar/tar-1.34.tar.xz
https://downloads.sourceforge.net/tcl/tcl8.6.12-src.tar.gz
https://downloads.sourceforge.net/tcl/tcl8.6.12-html.tar.gz
https://ftp.gnu.org/gnu/texinfo/texinfo-6.8.tar.xz
https://www.iana.org/time-zones/repository/releases/tzdata2021e.tar.gz
https://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.xz
https://www.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.4.tar.xz
https://anduin.linuxfromscratch.org/LFS/vim-8.2.4383.tar.gz
https://cpan.metacpan.org/authors/id/T/TO/TODDR/XML-Parser-2.46.tar.gz
https://tukaani.org/xz/xz-5.2.5.tar.xz
https://zlib.net/zlib-1.2.12.tar.xz
https://github.com/facebook/zstd/releases/download/v1.5.2/zstd-1.5.2.tar.gz
https://www.linuxfromscratch.org/patches/lfs/11.1/binutils-2.38-lto_fix-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/bzip2-1.0.8-install_docs-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/coreutils-9.0-i18n-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/coreutils-9.0-chmod_fix-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/glibc-2.35-fhs-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/kbd-2.4.0-backspace-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/perl-5.34.0-upstream_fixes-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/sysvinit-3.01-consolidated-1.patch
https://www.linuxfromscratch.org/patches/lfs/11.1/systemd-250-upstream_fixes-1.patch
EOF

wget --input-file=wget-list.tmp --continue -N --no-check-certificate

cat > md5sums.tmp << EOF
95ce715fe09acca7c12d3306d0f076b2  acl-2.3.1.tar.xz
ac1c5a7a084f0f83b8cace34211f64d8  attr-2.5.1.tar.gz
12cfa1687ffa2606337efe1a64416106  autoconf-2.71.tar.xz
4017e96f89fca45ca946f1c5db6be714  automake-1.16.5.tar.xz
c17b20a09fc38d67fb303aeb6c130b4e  bash-5.1.16.tar.gz
632344cdb052af0e06087bd3b0034126  bc-5.2.2.tar.xz
6e39cad1bb414add02b5b1169c18fdc5  binutils-2.38.tar.xz
c28f119f405a2304ff0a7ccdcc629713  bison-3.8.2.tar.xz
67e051268d0c475ea773822f7500d0e5  bzip2-1.0.8.tar.gz
50fcafcecde5a380415b12e9c574e0b2  check-0.15.2.tar.gz
0d79ae8a6124546e3b94171375e5e5d0  coreutils-9.0.tar.xz
68c5208c58236eba447d7d6d1326b821  dejagnu-1.6.3.tar.gz
6a6b0fdc72acfe3f2829aab477876fbc  diffutils-3.8.tar.xz
3da91854c960ad8a819b48b2a404eb43  e2fsprogs-1.46.5.tar.gz
2c095e31e35d6be7b3718477b6d52702  elfutils-0.186.tar.bz2
417ba948335736d4d81874fba47a30f7  eudev-3.2.11.tar.gz
22a30c888752fdda9f8dd1b7281c54b0  expat-2.4.6.tar.xz
00fce8de158422f5ccd2666512329bd2  expect5.45.4.tar.gz
18233bb0a0089dfdc7dfbc93b96f231b  file-5.41.tar.gz
4a4a547e888a944b2f3af31d789a1137  findutils-4.9.0.tar.xz
2882e3179748cc9f9c23ec593d6adc8d  flex-2.6.4.tar.gz
83650aa943ff2fd519b2abedf8506ace  gawk-5.1.1.tar.xz
31c86f2ced76acac66992eeedce2fce2  gcc-11.2.0.tar.xz
8551961e36bf8c70b7500d255d3658ec  gdbm-1.23.tar.gz
40996bbaf7d1356d3c22e33a8b255b31  gettext-0.21.tar.xz
dd571c67d85d89d7f60b854a4e207423  glibc-2.35.tar.xz
0b82665c4a92fd2ade7440c13fcaa42b  gmp-6.2.1.tar.xz
9e251c0a618ad0824b51117d5d9db87e  gperf-3.1.tar.gz
7c9cca97fa18670a21e72638c3e1dabf  grep-3.7.tar.xz
08fb04335e2f5e73f23ea4c3adbf0c5f  groff-1.22.4.tar.gz
cf0fd928b1e5479c8108ee52cb114363  grub-2.06.tar.xz
d1e93996dba00cab0caa7903cd01d454  gzip-1.11.tar.xz
81d865ce7fe4240d5abed48c3ca5fa9f  iana-etc-20220207.tar.gz
de8c1b49cbde2b30e481c61c65357ad4  inetutils-2.2.tar.xz
12e517cac2b57a0121cda351570f1e63  intltool-0.51.0.tar.gz
994c1bad2a24aa9d70e89670c5b5dfcb  iproute2-5.16.0.tar.xz
3cac5be0096fcf7b32dcbd3c53831380  kbd-2.4.0.tar.xz
e81e63acd80697d001c8d85c1acb38a0  kmod-29.tar.xz
f029087448357812fba450091a1172ab  less-590.tar.gz
0f51a074cc4faaff93b3c80e9ab27b0c  lfs-bootscripts-20210608.tar.xz
18410cec436f827e698ee9ea16ada9b7  libcap-2.63.tar.xz
294b921e6cf9ab0fbaea4b639f8fdbe8  libffi-3.4.2.tar.gz
3e725c76bfea1985e87e851ee50c2e29  libpipeline-1.5.5.tar.gz
1bfb9b923f2c1339b4d2ce1807064aa5  libtool-2.4.6.tar.xz
4d6a704bf3e249ef6189b6f17457084b  linux-5.16.9.tar.xz
0d90823e1426f1da2fd872df0311298d  m4-1.4.19.tar.xz
fc7a67ea86ace13195b0bce683fd4469  make-4.3.tar.gz
b03b76a9a00d0d6b2299b823fba4f579  man-db-2.10.1.tar.xz
3ac24e8c6fae26b801cb87ceb63c0a30  man-pages-5.13.tar.xz
8ed66d5537275df3defffb66d1fb897f  meson-0.61.1.tar.gz
9f16c976c25bb0f76b50be749cd7a3a8  mpc-1.2.1.tar.gz
bdd3d5efba9c17da8d83a35ec552baef  mpfr-4.1.0.tar.xz
a2736befde5fee7d2b7eb45eb281cdbe  ncurses-6.3.tar.gz
639f75bc2e3b19ab893eaf2c810d4eb4  ninja-1.10.2.tar.gz
7d07e849d77d276891edd579a8832bb3  openssl-3.0.1.tar.gz
78ad9937e4caadcba1526ef1853730d5  patch-2.7.6.tar.xz
df7ecb0653440b26dc951ad9dbfab517  perl-5.34.0.tar.xz
f6e931e319531b736fadc017f470e68a  pkg-config-0.29.2.tar.gz
d60613e88c2f442ebd462b5a75313d56  procps-ng-3.3.17.tar.xz
8114cd4489b95308efe2509c3a406bbf  psmisc-23.4.tar.xz
14e8c22458ed7779a1957b26cde01db9  Python-3.10.2.tar.xz
ffa52f0017baf72df9d32dec785fd6ab  python-3.10.2-docs-html.tar.bz2
12819fa739a78a6172400f399ab34f81  readline-8.1.2.tar.gz
6d906edfdb3202304059233f51f9a71d  sed-4.8.tar.xz
5a95ec069aa91508167d02fecafaa912  shadow-4.11.1.tar.xz
c70599ab0d037fde724f7210c2c8d7f8  sysklogd-1.5.1.tar.gz
dc14f92af715bcfa33cc25341730452e  sysvinit-3.01.tar.xz
9a08d29a9ac4727130b5708347c0f5cf  tar-1.34.tar.xz
87ea890821d2221f2ab5157bc5eb885f  tcl8.6.12-src.tar.gz
a0d1a5b60bbb68f2f0bd3066a19c527a  tcl8.6.12-html.tar.gz
a91b404e30561a5df803e6eb3a53be71  texinfo-6.8.tar.xz
4fdfad906ebc85fef30221c10964cce9  tzdata2021e.tar.gz
27cd82f9a61422e186b9d6759ddf1634  udev-lfs-20171102.tar.xz
755919e658c349cad9e1c7c771742d48  util-linux-2.37.4.tar.xz
3168ff48e382a1201bd0cbd0209bd3e0  vim-8.2.4383.tar.gz
80bb18a8e6240fcf7ec2f7b57601c170  XML-Parser-2.46.tar.gz
aa1621ec7013a19abab52a8aff04fe5b  xz-5.2.5.tar.xz
28687d676c04e7103bb6ff2b9694c471  zlib-1.2.12.tar.xz
072b10f71f5820c24761a65f31f43e73  zstd-1.5.2.tar.gz
3df11b6123d5bbdb0fc83862a003827a  binutils-2.38-lto_fix-1.patch
6a5ac7e89b791aae556de0f745916f7f  bzip2-1.0.8-install_docs-1.patch
1eeba2736dfea013509f9975365e4e32  coreutils-9.0-i18n-1.patch
4709df88e68279e6ef357aa819ba5b1a  coreutils-9.0-chmod_fix-1.patch
9a5997c3452909b1769918c759eff8a2  glibc-2.35-fhs-1.patch
f75cca16a38da6caa7d52151f7136895  kbd-2.4.0-backspace-1.patch
fb42558b59ed95ee00eb9f1c1c9b8056  perl-5.34.0-upstream_fixes-1.patch
4900322141d493e74020c9cf437b2cdc  sysvinit-3.01-consolidated-1.patch
EOF

md5sum -c md5sums.tmp

rm md5sums.tmp wget-list.tmp