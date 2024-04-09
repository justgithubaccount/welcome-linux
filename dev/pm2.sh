# https://pm2.io/docs/runtime/guide/installation/

npm install pm2 -g
apt update && apt install sudo curl && curl -sL https://raw.githubusercontent.com/Unitech/pm2/master/packager/setup.deb.sh | sudo -E bash -
pm2 completion install

pm2 start index.js
pm2 list
pm2 stop 0