#!/bin/bash
cd ~
sudo rm -r scsee-signage
git clone https://github.com/BangorUniversity/scsee-signage.git
cd scsee-signage
git pull
sudo bash first-run.sh
