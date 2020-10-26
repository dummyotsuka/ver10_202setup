
function SetupDisk() { if ls "/root/vdisk$1" ; then echo "/dev/vdisk$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/vdisk$1 bs=1024 count=300000; echo "/root/vdisk$1を再構築しました"; fi; }
echo 'function SetupDisk() { if ls "/root/vdisk$1" ; then echo "/dev/vdisk$1のディスクは研修用に準備済みです"; else dd if=/dev/zero of=/root/vdisk$1 bs=1024 count=300000; echo "/root/vdisk$1を再構築しました"; fi; }' >> /root/.bashrc
mkdir /mnt/mnt0



kill `cat /var/run/yum.pid`
wait 5

useradd lpic
passwd lpic --stdin << E
ngn-sf
ngn-sf
E
yum -y install xclock
yum -y install git
yum -y install gcc
yum -y install zlib-devel
yum -y install ncurses-devel
yum -y install dump
rm -f /etc/systemd/system/default.target
ln -s /usr/lib/systemd/system/graphical.target /etc/systemd/system/default.target
yum -y install mkisofs

SetupDisk 0
SetupDisk 1

mkfs.ext4 /root/vdisk0 << E
y
E
echo 'mount /root/vdisk0 /mnt/mnt0' >> /root/.bashrc

updatedb

yum -y groupinstall "GNOME Desktop"

yum -y install epel-release
yum -y install xrdp
yum -y install tigervnc-server
systemctl enable xrdp
systemctl start xrdp

systemctl set-default graphical.target
systemctl disable firewalld
echo "export LANG=ja_JP.UTF-8" >> /etc/bashrc
echo "export PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin" >> /etc/bashrc
echo "PS1='[\u@Client \W]\#'" >> /etc/bashrc

shutdown -h now
