sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d snowsync.ru -d
sudo certbot renew --dry-run