docker compose run --rm certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    -d zabbix.snowsync.ru \
    --email mail@domain.com \
    --agree-tos \
    --no-eff-email

docker compose run --rm certbot certonly \
    --webroot \
    --webroot-path=/var/www/certbot \
    -d zabbix.snowsync.ru \
    --email mail@domain.com \
    --agree-tos \
    --no-eff-email