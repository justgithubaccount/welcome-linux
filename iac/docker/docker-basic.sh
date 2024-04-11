docker build -t site-easy . # Cборка образа из текущей директории
docker run -dp 8080:80 site-easy # Создать контейнер на порту 8080 (порт который отдает контейнер 80)

docker build -t react-app-start -f ./react-app/Dockerfile . # Cборка образа с указанием того где находится докерфайл
docker run -dp 3030:3000 react-app-start # Создать контейнер на порту 3030 (порт который отдает контейнер 3000)

docker run -it -p 4321:80 nginx # Создать контейнер (интерактивно)

docker ps # Список запущенных контейнеров
docker ps -a # Cписок всех контейнеров
docker images # Cписок образов в системе
docker search node # Поиск образов
docker pull node:21 # Скачать с докер хаба (не только с него)

docker ps -a | grep Exited

docker rm f9fffdf39b18 # Удалить контейнер
docker rmi hello-world # Удалить образ

docker stop 209ffbc65c39 # Остановить контейнер (после того как он создан)
docker start 209ffbc65c39 # Запустить контейнер (после того как он создан)

docker tag site-just-text:v1 site-just-text:v2 # Копировать образ

docker exec -it 4b4f0c002bba /bin/bash # Зайти в контейнер
docker commit 4b4f0c002bba site-just-text:v3 # Сохранить состояние контейнера в новый 

docker system prune # Удалить все неиспользуемые данные, включая неактивные контейнеры, образы, сети и тома