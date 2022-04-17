if [ -z $LFS ] ; then
	echo "LFS variable is not set!"
	echo "Bye bye..."
	exit 1
fi

### Create a new user on the host system named lfs which
#   will be used to compile all the necessary packages
#   for the temporary toolchain before entering in the
#   chroot enviroment. This is crucial because one single
#   command from the root user could destroy the entire
#   host system. Note that this script will create the
#   user, will set up the enviroment and will log you
#   in as the lfs user. This means that you need to
#   manually call the rest of the script.
#   (or, if you want scripting, change this script
#   using https://unix.stackexchange.com/questions/394461/linux-switch-user-and-execute-command-immediately
#   as a reference)
groupadd lfs
useradd -s /bin/bash -g lfs -m -k /dev/null lfs

chown -v lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) chown -v lfs $LFS/lib64 ;;
esac
chown -v lfs $LFS/sources

### Set up the enviroment
#   To recover the bash.bashrc file, run the restore-bash-bashrc.sh script
[ ! -e /etc/bash.bashrc ] || mv -v /etc/bash.bashrc /etc/bash.bashrc.NOUSE

### Firstly, the shell spawned by the su - lfs command
#   is a bash login shell; this means that it will read
#   the contents from /etc/profile and ~/.bash_profile
#   before doing something... but there is a catch. You
#   see, this shell preserves the enviroment variables
#   from the host system, and this enviroment variables
#   could interfere in the build process of our cross
#   toolchain. To prevent that from happening, we will
#   put in ~/.bash_profile this command which will simply
#   replace our current shell with a new one. The -i flag
#   will delete all of the enviroment variables, and just
#   the HOME, TERM and PS1 will be preserved.
cat > /home/lfs/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\n\W\[$(tput sgr0)\]\n\e[0;32m$(whoami)\e[m \033[95mλ\033[0m  ' /bin/bash
EOF

### This new shell is a non login shell and is the shell
#   that will be used for compiling our toolchain. Because
#   is a non login shell, the configuration files are not
#   in the ~/.bash_profile anymore, but in the ~/.bashrc.
#   Here we will setup our enviroment by declaring the
#   LFS, LFS_TGT and PATH variables and all kind of other stuff.
#   See the Chapter 4, LFS 11.1 for more infos.
cat > /home/lfs/.bashrc << "EOF"
set +h
umask 022
export LFS=/mnt/lfs
export LC_ALL=POSIX
export LFS_TGT=$(uname -m)-lfs-linux-gnu
export PATH=/usr/bin
if [ ! -L /bin ]; then export PATH=/bin:$PATH; fi
export PATH=$LFS/tools/bin:$PATH
export CONFIG_SITE=$LFS/usr/share/config.site
alias ls='ls --color=auto'
EOF

### Login as lfs
# su - lfs