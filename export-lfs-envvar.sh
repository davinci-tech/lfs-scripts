# set -x # enable debug mode

read -r -d '' text << EOF
export LFS=/mnt/lfs ; \
export LFS_TGT=$(uname -m)-lfs-linux-gnu
EOF

for file in ~/.bashrc ~/.bash_profile
do
	sed -e "\@$text@"d $file -i
	echo $text >> $file
done

# https://stackoverflow.com/questions/5864146/using-different-delimiters-in-sed-commands-and-range-addresses
