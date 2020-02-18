#!/bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt -y full-upgrade

sudo apt -y purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt -y purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt clean
sudo apt -y autoremove

sudo apt -y install xdotool unclutter sed git

sudo bash install_cron.sh

cd /home/pi/scsee-signage/
git clone https://github.com/BangorUniversity/scsee-signage
cd scsee-signage

sudo chown 777 kiosk.sh
sudo cp kiosk.service /lib/systemd/system/kiosk.service

sudo systemctl enable kiosk.service

sudo bash /usr/lib/raspi-config/init_resize.sh

sudo reboot