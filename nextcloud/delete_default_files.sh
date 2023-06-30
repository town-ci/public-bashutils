#!/bin/bash

cd /var/www/html

## delete folders
sudo -u www-data ./occ files:delete /admin/files/Photos -f
sudo -u www-data ./occ files:delete /admin/files/Talk -f
sudo -u www-data ./occ files:delete /admin/files/Documents -f
sudo -u www-data ./occ files:delete /admin/files/Templates -f

## delete files
sudo -u www-data ./occ files:delete /admin/files/Nextcloud.png -f
sudo -u www-data ./occ files:delete /admin/files/Readme.md -f
sudo -u www-data ./occ files:delete /admin/files/Nextcloud\ intro.mp4 -f
sudo -u www-data ./occ files:delete /admin/files/Nextcloud\ Manual.pdf -f
sudo -u www-data ./occ files:delete /admin/files/Reasons\ to\ use\ Nextcloud.pdf -f

