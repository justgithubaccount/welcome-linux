#!/bin/bash
# https://cloud.yandex.ru/docs/cli/quickstart

curl -sSL https://storage.yandexcloud.net/yandexcloud-yc/install.sh | bash

YC_TOKEN="" # OAuth token
YC_CLOUD_ID="" # Cloud ID
YC_FOLDER_ID="" # Folder ID
YC_ZONE="ru-central1-b" # default zone

yc config set token $YC_TOKEN
yc config set cloud-id $YC_CLOUD_ID
yc config set folder-id $YC_FOLDER_ID
yc config set compute-default-zone $YC_ZONE

yc config list