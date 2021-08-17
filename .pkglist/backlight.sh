#!/bin/bash
if [ $(id -u) -eq 0 ]; then
	echo "Please do not run as root!"
	exit 1
fi

sudo cp -i backlight.rules /etc/udev/rules.d/backlight.rules
sudo usermod -aG video $USER
