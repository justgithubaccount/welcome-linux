# Глянуть инфо о дисках в системе
df -h

# Создадим таблицу разделов и два раздела
echo -e "g\nn\n\n\n+200M\nn\n\n\n+400M\np\nw\n" | sudo fdisk /dev/sdb

# Cоздадим pv (physical volume)
sudo pvcreate /dev/sdb

# Посмотрим что получилось 
sudo pvs
sudo pvdisplay /dev/sdb

# Создадим vg (volume group)
sudo vgcreate myvg /dev/sdb
sudo vgs

# Посмотрим что получилось
sudo vgdisplay myvg

# Создадим lv (logical volume)
sudo lvcreate myvg -n mylv -l 80%FREE
sudo lvs

# Посммотрим что получилось
sudo lvdisplay myvg/mylv

# Установим ФС
sudo mkfs.ext4 /dev/myvg/mylv