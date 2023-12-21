# Вывод последних 5 строк
tail -5 /etc/passwd

# Создание файла и запись данных в моменте (Ctrl+D сохранить и выйти)
cat > file1.txt

# Быстрый просмотр файла
cat /etc/passwd 

# Кол-во строк в файле
wc -l /etc/passwd

# Поиск "SSL_CRT_FILE" во всех файлах в папке   
grep -r "SSL_CRT_FILE" ~/github-public/react-telegram-web-app-demo

# Создать 10 файлов
touch file{01..10}