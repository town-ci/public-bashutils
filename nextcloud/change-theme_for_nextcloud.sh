#!/bin/bash

SCRIPT_PATH=`echo $(cd $(dirname $0);pwd)`

MOUNTDATA_DIR="/mnt/ncdata"
DOCUMENT_ROOT="/var/www/html"

if [ ! -d "${MOUNTDATA_DIR}" ]; then
  echo "/mnt/ncdata not found ."
  exit 1
fi

sudo -u www-data mkdir -p ${MOUNTDATA_DIR}/kurojica/images/
sudo -u www-data cp ${SCRIPT_PATH}/images/kurojica-favicon.ico ${MOUNTDATA_DIR}/kurojica/images/
sudo -u www-data cp ${SCRIPT_PATH}/images/kurojica-logo.svg ${MOUNTDATA_DIR}/kurojica/images/

sudo -u www-data ${DOCUMENT_ROOT}/occ theming:config name "クロジカ大容量ファイル管理"
sudo -u www-data ${DOCUMENT_ROOT}/occ theming:config url "https://kurojica.com/storage/"
sudo -u www-data ${DOCUMENT_ROOT}/occ theming:config color "#000000"

sudo -u www-data ${DOCUMENT_ROOT}/occ theming:config logo ${MOUNTDATA_DIR}/kurojica/images/kurojica-logo.svg
sudo -u www-data ${DOCUMENT_ROOT}/occ theming:config logoheader ${MOUNTDATA_DIR}/kurojica/images/kurojica-logo.svg
sudo -u www-data ${DOCUMENT_ROOT}/occ theming:config favicon ${MOUNTDATA_DIR}/kurojica/images/kurojica-favicon.ico

