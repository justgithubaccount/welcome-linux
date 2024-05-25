# Установить руль (на локальный комп (или сервер), helm cli напрямую взаимодействует с api кубика)
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

helm create my-nginx
helm install nginx-helm ./nginx-helm # Установка чарта
helm uninstall my-nginx # Удалить релиз

helm list
kubectl get pods
kubectl get services
