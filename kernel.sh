uname -r 
du -h /boot/vmlinuz-*
ls /lib/modules
cd /lib/modules/$(uname -r)
cat /lib/modules/$(uname -r)/modules.built
less modules.alias
modinfo radeon | less
lscpu
lspci
lsusb
lsmod
sudo lshw
sudo dmesg -wH