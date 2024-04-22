# Настройки mkfs
head /etc/mke2fs.conf

# Cоздать ФС (ext4) на диске (разделе) /dev/sda2
sudo mkfs.ext4 /dev/sda2

# Доп. инфа о ФС
sudo tune2fs -l /dev/sda2

### Перенос /home на другой диск
# Проверить на открытые файлы
lsof +D /home

# Примонтировать диск sdb2 в /mnt
mount /dev/sdb2 /mnt/

# Копировать /home в /mnt
mv -v /home/* /mnt

# Проверка все ли перенеслось
ls /mnt /home
du -h /mnt | tail -1

# Отмонтируем sdb2
umount /mnt

# Получаем UUID диска и добавляем в fstab
blkid /dev/sdb2 | cut -d ' ' -f2 >> /etc/fstab # /home ext4 defaults,noatime 0 1

# Монтируем (система знает куда монтировать sdb2 на основе fstab)
mount /home

### Ошибка в fstab
# Посмотреть логи
journalctl -xb

# Проверить fs
fsck /dev/sdb2 # xfs_repair (для xfs)
