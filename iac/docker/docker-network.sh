docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' zabbix-server # Узнать ip сервиса
