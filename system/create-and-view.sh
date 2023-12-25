tail -5 /etc/passwd # Вывод последних 5 строк
tail -n +2 /etc/passwd # Вывод с определенной строки

# Вывод первых 5 строк
head -5 /etc/passwd

# Создание файла и запись данных в моменте (Ctrl+D сохранить и выйти)
cat > file1.txt

# Быстрый просмотр файла
cat /etc/passwd

# Кол-во строк в файле
wc -l /etc/passwd

grep -r "SSL_CRT_FILE" ~/github-public/react-telegram-web-app-demo # Поиск "SSL_CRT_FILE" во всех файлах в папке
grep -w amazon /etc/group # Точное вхождение

# Создать 10 файлов
touch file{01..10}