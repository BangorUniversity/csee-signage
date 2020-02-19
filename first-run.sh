#!/bin/bash

sudo apt update
sudo apt -y upgrade
sudo apt -y full-upgrade

sudo apt -y purge wolfram-engine scratch scratch2 nuscratch sonic-pi idle3 -y
sudo apt -y purge smartsim java-common minecraft-pi libreoffice* -y

sudo apt clean
sudo apt -y autoremove

sudo apt -y install xdotool unclutter sed git libcec3 cec-utils

cd /home/pi/scsee-signage/
sudo bash git-reset.sh
sudo bash service-update.sh

sudo bash /usr/lib/raspi-config/init_resize.sh

sudo reboot