#!/bin/bash
# https://yandex.cloud/ru/docs/tutorials/infrastructure-management/terraform-quickstart

export YC_SA="sa-terraform-snowsync"
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

# Создание и получение необходимых данных сервисного аккаунта
yc iam service-account create --name $YC_SA
export YC_SA_ID=$(yc iam service-account get $YC_SA --format json | jq -r '.id')

# Назначение сервисному аккаунту ролей, необходимых (излишних) для управления ресурсами YC
export YC_SERVICE="resource-manager" # https://yandex.cloud/ru/docs/cli/cli-ref/managed-services/resource-manager/
export YC_RESOURCE_GRP="folder" # https://yandex.cloud/ru/docs/cli/cli-ref/managed-services/resource-manager/folder/
export YC_ROLE="editor" # https://yandex.cloud/ru/docs/iam/roles-reference#editor

yc $YC_SERVICE $YC_RESOURCE_GRP add-access-binding $YC_FOLDER_ID \
    --role $YC_ROLE \
    --subject serviceAccount:$YC_SA_ID

# Настроика профиля CLI для выполнения операций от имени сервисного аккаунта
yc iam key create \
  --service-account-id $YC_SA_ID \
  --output key.json

# Создание профиля CLI для выполнения операций от имени сервисного аккаунта
yc config profile create $YC_SA

# Конфигурация профиля
yc config set service-account-key key.json
yc config set cloud-id $YC_CLOUD_ID
yc config set folder-id $YC_FOLDER_ID