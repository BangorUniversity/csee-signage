#!/bin/bash

sudo systemctl stop kiosk.service
sudo systemctl disable kiosk.service

sudo cp kiosk.service /lib/systemd/system/kiosk.service

sudo systemctl enable kiosk.service
sudo systemctl start kiosk.service