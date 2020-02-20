#!/bin/bash

#sudo crontab -l > temp_cron

#echo new cron into cron file

echo "@reboot sudo bash regular-update.sh; echo 'on 0' | cec-client -s -d 1" >> temp_cron
echo "59 7 * * 1-5 echo 'on 0' | cec-client -s -d 1" >> temp_cron
echo "0 18 * * * echo 'standby 0' | cec-client -s -d 1 && echo 'as' | cec-client -s -d 1" >> temp_cron
echo "0 7 * * 1 root (apt -y update && apt -y upgrade) > /dev/null && /sbin/shutdown -r now" >> temp_cron
echo "30 7 * * 1-5 sudo bash regular-update.sh; echo 'on 0' | cec-client -s -d 1" >> temp_cron

#install new cron file
sudo crontab temp_cron
rm temp_cron