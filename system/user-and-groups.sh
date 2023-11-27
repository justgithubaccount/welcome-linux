id john
sudo chage -l john
useradd -D
sudo useradd bill -b /home/company/it -c "Custom User Create" -g users -G google -u 1111
sudo passwd bill
chage bill
grep bill /etc/passwd /etc/group
sudo userdel -r bill

sudo groupadd amazon 
sudo gpasswd amazon -A anon
sudo gpasswd -a anon amazon 
sudo gpasswd -d anon amazon 	

sudo usermod -aG google anon

# practice 20 
sudo mkdir /home/it
sudo groupadd -g 10000 it
sudo useradd sysadmin -d /home/it -G it -u 10101 -s /bin/bash
sudo useradd helpdesk -d /home/it -G it -u 10201 -s /bin/bash
sudo useradd netadmin -d /home/it -G it -u 10301 -s /bin/bash
sudo passwd sysadmin
sudo passwd helpdesk
sudo passwd netadmin