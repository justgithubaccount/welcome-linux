adduser admin
usermod -aG sudo admin

apt update && apt upgrade && apt install ufw
ufw allow OpenSSH
ufw enable

hostnamectl set-hostname docker-vm-01