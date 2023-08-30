#!/bin/bash

cd /var/www/html

## disable apps
sudo -u www-data ./occ app:disable calendar # Calendar
sudo -u www-data ./occ app:disable circles # Circle
sudo -u www-data ./occ app:disable notify_push # Client Push
sudo -u www-data ./occ app:disable contacts # Contacts
sudo -u www-data ./occ app:disable contactsinteraction # Contacts Interaction
sudo -u www-data ./occ app:disable dashboard # Dashboard
sudo -u www-data ./occ app:disable deck # Deck
sudo -u www-data ./occ app:disable federation # Federation
sudo -u www-data ./occ app:disable firstrunwizard # First run wizard 
sudo -u www-data ./occ app:disable logreader # Log Reader
sudo -u www-data ./occ app:disable serverinfo # Monitoring
sudo -u www-data ./occ app:disable nextcloud-aio # Nextcloud All-in-One 
sudo -u www-data ./occ app:disable nextcloud_announcements # Nextcloud announcements 
sudo -u www-data ./occ app:disable richdocuments # Nextcloud Office 
sudo -u www-data ./occ app:disable notes # Notes
sudo -u www-data ./occ app:disable photos # Photos
sudo -u www-data ./occ app:disable privacy # Privacy
sudo -u www-data ./occ app:disable recommendations # Recommendations
sudo -u www-data ./occ app:disable related_resources # Related Resources
sudo -u www-data ./occ app:disable support # Support
sudo -u www-data ./occ app:disable spreed # Talk
sudo -u www-data ./occ app:disable tasks # Tasks
sudo -u www-data ./occ app:disable survey_client # Usage survey 
sudo -u www-data ./occ app:disable user_status # User status 
sudo -u www-data ./occ app:disable weather_status # Weather status

## install apps
sudo -u www-data ./occ app:install groupfolders # Group folders

