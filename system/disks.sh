# sd* (scsi диск)
ls /dev/sd*
# cr* (cd приводы)
ls /dev/sr*
# Програмка для удобного просмотра дисков
lsscsi -s

# ОС обменивается с этими устройствами данными в виде блоков данных фиксированной длины
# b - блочное устройство
ls -l /dev/sda
stat /dev/sda

# c - character device – символьное устройство
ls -l /dev/input/mouse0
stat /dev/input/mouse0

# fdisk - для работы с дисками (и parted)
sudo fdisk /dev/sda # n - t - w
sudo fdisk -l /dev/sda # Информация о разделе
sudo mkfs.ext4 /dev/sda1 # Форматнуть раздел  
sudo mkfs.ext4 /dev/sda2 
sudo mkfs.ext4 /dev/sda3

# Псевдограффика
sudo cfdisk /dev/sda

# Блочные устройства в древовидной форме
lsblk 

# Идентификаторы дисков
ll -R /dev/disk