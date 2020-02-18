#!/bin/bash

#sudo crontab -l > temp_cron

#echo new cron into cron file
echo "59 7 * * 1-5 /opt/vc/bin/tvservice -p && chvt 6 && chvt 7" >> temp_cron
echo "01 8 * * 1-5 /opt/vc/bin/tvservice -p && chvt 6 && chvt 7" >> temp_cron
echo "0 18 * * * /opt/vc/bin/tvservice -o" >> temp_cron
echo "0 7 * * 1 root (apt -y update && apt -y upgrade) > /dev/null && /sbin/shutdown -r now" >> temp_cron
sudo echo "30 7 * * 1-5 \$(cd /home/pi/scsee-signage/ && git pull && sudo bash update.sh)" >> temp_cron

#install new cron file
sudo crontab temp_cron
rm temp_cron