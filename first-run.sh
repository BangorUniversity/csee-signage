#!/bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt -y full-upgrade

sudo apt -y purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt -y purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt clean
sudo apt -y autoremove

sudo apt -y install xdotool unclutter sed git

#sudo crontab -l > temp_cron

#echo new cron into cron file
echo "0 8 * * 1-5 /opt/vc/bin/tvservice -p && chvt 6 && chvt 7" >> temp_cron
echo "0 18 * * * /opt/vc/bin/tvservice -o" >> temp_cron
echo "0 7 * * 1 root (apt -y update && apt -y upgrade) > /dev/null && /sbin/shutdown -r now" >> temp_cron
sudo echo "30 7 * * 1-5 \$(cd /home/pi/scsee-signage/ && git pull && sudo bash update.sh)" >> temp_cron

#install new cron file
sudo crontab temp_cron
rm temp_cron

cd /home/pi/scsee-signage/
git clone https://github.com/BangorUniversity/scsee-signage
cd scsee-signage

sudo chown 777 kiosk.sh
sudo cp kiosk.service /lib/systemd/system/kiosk.service

sudo systemctl enable kiosk.service

sudo bash /usr/lib/raspi-config/init_resize.sh

sudo reboot