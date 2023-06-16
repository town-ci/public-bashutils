#!/bin/bash

function check_nvme1n1_exists(){

echo "1. nvme1n1 exists ?"
if [ `lsblk | egrep "^nvme1n1" | wc -l` -ne 0 ]; then
  lsblk | egrep "^nvme1n1"
  echo "OK"
  echo ""
else
  echo "nvme1n1 not found, or many"
  exit 1
fi

}

function check_no_file-system(){

echo "2. no file-system ?"
if [ "`file -s /dev/nvme1n1`" = "/dev/nvme1n1: data"  ] ; then
  file -s /dev/nvme1n1
  echo "OK"
  echo ""
else
  echo "file-system exists or another error occured ."
  exit 1
fi

}

function create_file-system(){

echo "3. create file-system on /dev/nvme1n1"
mkfs -t xfs /dev/nvme1n1

if [ $? -eq 0 ]; then
  echo "file-system created !"
  echo ""
else
  echo "An error occured ."
  exit 1
fi

}

function mount_nvme1n1(){

echo "4. mount /dev/nvme1n1 to /mnt/ncdata"
mount /dev/nvme1n1 /mnt/ncdata

if [ $? -eq 0 ]; then
  echo "/dev/nvme1n1 mounted !"
  echo ""
else
  echo "An error occured ."
  exit 1
fi

}

function add_mount-info(){

echo "5. add mount-info to /etc/fstab"
TMPUUID=`blkid | grep nvme1n1 | awk '{print $2}' | tr -d '\"'`

if [ `grep "$TMPUUID" /etc/fstab | wc -l` -eq 0 ]; then
  echo "$TMPUUID /mnt/ncdata xfs defaults,nofail 0 2" >> /etc/fstab
  echo "OK"
  echo ""
else
  echo "$TMPUUID already exists in /etc/fstab"
  exit 1
fi

}

function check_result(){
echo "Result"
echo "[lsblk | grep disk]"
lsblk | grep disk
echo ""

echo "[df -h]"
df -h

}

check_nvme1n1_exists
check_no_file-system
create_file-system
mount_nvme1n1
add_mount-info
check_result
