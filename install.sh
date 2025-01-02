country='USA'
echo 'g
n


+1G
t
1
n


+4G
t

swap
n



p
w' | fdisk /dev/sda
mkfs.xfs /dev/sda3
mkswap /dev/sda2
cd /mnt/gentoo
mount /dev/sda3 .
mkdir efi
mirror=$(mirrorselect -S -s3 -b4 -c $country -o | grep -m1 -oe 'https.*\w')
wget $mirror/releases/amd64/autobuilds/$(wget -nv -O - $mirror/releases/amd64/autobuilds/latest-stage3.txt | grep -o -e '^.*stage3-amd64-openrc-[0-9].*\.tar\.xz')
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
