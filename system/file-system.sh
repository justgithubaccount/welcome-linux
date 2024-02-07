# Размер блока (физический)
cat /sys/class/block/sda/queue/physical_block_size
# Размер блока (логический)
cat /sys/class/block/sda/queue/logical_block_size

# Использование диска
sudo apt install sysstat
iostat 

# Инфо о модуле ядра для файловой системы
modinfo ext4 | head