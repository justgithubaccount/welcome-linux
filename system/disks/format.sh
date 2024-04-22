# Отмантировать диск
sudo umount /media/jenya/Data
sudo umount /media/jenya/01DA88C390398560

# d -> w -> g -> n -> w
echo -e "d\n\nd\ng\nn\n\n\n\nw\n" | sudo fdisk /dev/nvme1n1

# Создать фс ext4
sudo mkfs.ext4 /dev/nvme1n1p1

# Примапить обратно
sudo mkdir -p /mnt/data
sudo mount /dev/nvme1n1p1 /mnt/data

# Узнать uuid
lsblk -f

# Добавить в fstab
sudo nano /etc/fstab

# Добавить в конец файла в fstab
UUID=d24033b0-e766-470e-b36c-28888bcd7e41 /mnt/data ext4 defaults 0 0
