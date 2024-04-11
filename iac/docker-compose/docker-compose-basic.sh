docker-compose logs -f --tail 100 # Глянуть логи
docker-compose logs service-name -f --tail 100 # Глянуть логи отдельного сервиса
docker-compose down -v --rmi local # to stop and remove all containers, networks, volumes, and related images