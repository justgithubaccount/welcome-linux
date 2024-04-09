# Плагины SSH Credentials и SSH Build Agents    
# В настройках агента поставить галочку Treat username as secret. [?]

sudo apt install apt-transport-https
sudo apt install openssh-server
sudo apt install git
sudo apt install -y default-jre default-jdk

ssh-keygen -t rsa -C "The access key for Jenkins slaves"

cat id_rsa.pub > ~/.ssh/authorized_keys