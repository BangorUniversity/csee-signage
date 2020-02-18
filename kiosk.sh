#!/bin/bash

xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -root &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

sleep 15 

/usr/bin/chromium-browser --check-for-update-interval=604800 --noerrdialogs --disable-infobars --kiosk https://bit.ly/csee-foyer &

while true; do
	sleep 300

	wget -q --spider http://google.com

	if [ $? -eq 0 ]; then
		echo "Connection confirmed, refreshing"
		xdotool keydown ctrl+r; xdotool keyup ctrl+r;
	else
		echo "No connection, not refreshing"
	fi	
done