#!/bin/bash

git fetch --all
git reset --hard origin/master

sudo systemctl stop kiosk.service
sudo systemctl disable kiosk.service
sudo cp kiosk.service /lib/systemd/system/kiosk.service
sudo systemctl enable kiosk.service

sudo apt-get install libcec3 cec-utils

sudo bash install_cron.sh