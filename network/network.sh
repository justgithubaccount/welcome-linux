# Просмотр сетевых интерфейсов (команды можно не дописовать до конца)
ip a 
ip address
# Список маршрутов
ip r
ip route show

sudo ip link set enp0s3 down # Выключить
sudo ip link set enp0s3 down # Включить

# Список DNS серверов
cat /etc/resolv.conf

# Трассировочка
sudo apt install traceroute
# Нслукап
sudo apt install dnsutils

# Cетевой демон Network Manager (для постоянных настроек)
sudo apt install network-manager
# Запуск в псевдографике
sudo nmtui

# Проверить открыт ли порт 22
ss -tuln | grep ':22 ' | grep 'LISTEN'

# Разрешить ICMP
sudo iptables -A INPUT -p icmp --icmp-type echo-request -j ACCEPT
sudo iptables -A OUTPUT -p icmp --icmp-type echo-reply -j ACCEPT