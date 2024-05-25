# Скачать kubectl (принцип взаимодейсвия так же как у helm)
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Установить
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
# Проверить
kubectl version --client
# Подключить кластер
touch ~/.kube/config # Конфиг с мастера /etc/kubernetes/admin.conf
# Проверить подключение
kubectl config view
kubectl get nodes