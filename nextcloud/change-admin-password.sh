#!/bin/bash

PASSWORD=$1

if [ -z $PASSWORD  ]; then
  echo "usage: $0 {password}"
  exit 0
fi

DOCUMENT_ROOT="/var/www/html"

export OC_PASS=$PASSWORD
su -s /bin/sh www-data -c "${DOCUMENT_ROOT}/occ user:resetpassword --password-from-env admin"

