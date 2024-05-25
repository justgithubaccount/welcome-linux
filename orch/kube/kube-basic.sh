# Показать все поды
kubectl get pods
# Cписок всех сервисов в текущем неймспейсе
kubectl get services 
# Получить айпишники нод
kubectl get nodes -o wide

# Применить деплоймент
kubectl apply -f nginx-deployment.yml

# Инфо о конфиге (текущей конфигурации - ~/.kube/config)
kubectl config view
# Кластер инфо
kubectl cluster-info

# Инфо о подах в системном неймспейсе
kubectl get pods -n kube-system -o wide
# Инфо о конкретном поде
kubectl describe pod calico-kube-controllers-5b9b456c66-nbphh -n kube-system

# Инфо о текущем контексте
kubectl config current-context

# Инфо о сервисах
kubectl get deployments -o yaml
kubectl get services -o yaml
kubectl describe deployment nginx-deployment
kubectl describe service nginx-service

# Полный конфиг 
kubectl get all --all-namespaces -o yaml > full-cluster-config.yaml