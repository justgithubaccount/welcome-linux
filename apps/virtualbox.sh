# VirtualBox Guest Additions

# Install the packages required for building kernel modules
sudo apt install build-essential dkms linux-headers-$(uname -r)

# Create a new directory and mount the ISO file
sudo mkdir -p /mnt/cdrom
sudo mount /dev/cdrom /mnt/cdrom

# Navigate to the directory and execute the VBoxLinuxAdditions.run script to install the Guest Additions
# The --nox11 option tells the installer not to spawn an xterm window
cd /mnt/cdrom
sudo sh ./VBoxLinuxAdditions.run --nox11

# Reboot
sudo shutdown -r now

# Verify that the installation was successful and the kernel module is loaded using the lsmod command
lsmod | grep vboxguest