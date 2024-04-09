# https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart
# https://cloud.yandex.ru/docs/cli/quickstart

# Установка CLI
curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

# Создание сервисного аккаунта
yc iam service-account create --name sa-terraform

# Узнать id сервисного аккаунта
yc iam service-account list
yc iam service-account get sa-terraform

# Список всех организаций 
yc organization-manager organization list

# Назначение сервисному аккаунту ролей, необходимых для управления ресурсами Yandex Cloud
# https://cloud.yandex.ru/docs/iam/concepts/access-control/roles
# https://cloud.yandex.ru/docs/cli/cli-ref/

yc resource-manager cloud add-access-binding b1gq1vm9avgo4de0cv74 \
  --role resource-manager.clouds.owner \
  --subject serviceAccount:ajega1gt0a07h726kndm

# Настроика профиля CLI для выполнения операций от имени сервисного аккаунта

yc iam key create \
  --service-account-id ajega1gt0a07h726kndm \
  --output key.json

yc config profile create sa-terraform
yc config set cloud-id b1gq1vm9avgo4de0cv74
yc config set folder-id b1gcc0190kt1qemh5r08

# Аутентификационные данные в переменные окружения (env)
# Время жизни IAM-токена — не больше 12 часов, но рекомендуется запрашивать его чаще, например каждый час.
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)