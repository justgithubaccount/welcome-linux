# Подробный вывод инфы о файле/папке
stat README.md

# Смена владельца
sudo chown -R jeff file{001..005}

# Смена группы
sudo chown :amazon file{001..005}

# Cмена владельцы и группы разом
sudo chown bill:microsoft file{006..010}

# Отдельная команда для смены группы
sudo chgrp amazon file007

### Cмена разрешений
# Цифровой способ
sudo chmod 777 file{001..005} # -rwxrwxrwx
sudo chmod 644 file{006..007} # -rw-r--r--
sudo chmod 040 file{008..009} # ----r-----

### Cмена разрешений
# Cимфольный способ
sudo chmod -x file{001..005}   # -rw-rw-rw- | 666
sudo chmod go-w file{001..005} # -rw-r--r-- | 644
sudo chmod uo+r file{008..009} # -r--r--r-- | 444
sudo chmod u+w file{008..009}  # -rw-r--r-- | 644

### Sticky Bit
# Файлы в директории смогут удалять только владельцы файлов
# Так же удалять файлы помимо владельца, сможет владелец директории и root
sudo chmod +t ~/fs # drwxr-xr-t
sudo chmod 1770 ~/fs

### SUID (setuid) - запуск файла от имени владельца
sudo chmod u+s file001 # -rwSr--r--
sudo chmod 4644 file001

### SGID (setgid) - запуск файлы от группы владельца
# Если использовать setgid на директорию, то все файлы
# создаваемые в этой директории, будут создаваться 
# от имени группы, владеющей этой директорией
sudo chmod g+s file002 # -rw-r-Sr--
sudo chmod 2644 file002

### Дефолтные права на создаваемые файлы
# Идея такая – берём максимальное значение
# это 777 для директорий
# 666 для файлов 
# отнимаем те дефолтные права, которые нужны
# 666 - 022 = 644
umask    # 022
umask -S # u=rwx,g=rx,o=rx

### getfacl & setfacl
# Настройка дополнительных прав
sudo setfacl -m u:larry:r-- file009  # Добавить юзера с права на чтение
sudo setfacl -m g:google:rwx file010 # Добавить группу с полными правами