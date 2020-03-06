#!/bin/bash

#sudo crontab -l > temp_cron

echo "0 8 * * 2-5 /sbin/shutdown -r now" >> temp_cron
echo "0 8 * * 1 root (apt -y update && apt -y upgrade) > /dev/null && /sbin/shutdown -r now" >> temp_cron

echo "@reboot sudo bash /home/pi/scsee-signage/regular-update.sh; /opt/vc/bin/tvservice -p && chvt 6 && chvt 7; echo 'on 0' | cec-client -s -d 1" >> temp_cron

echo "0 18 * * * echo 'standby 0' | cec-client -s -d 1 && echo 'as' | cec-client -s -d 1; /opt/vc/bin/tvservice -o" >> temp_cron

sudo crontab temp_cron
rm temp_cron