#!/bin/bash
if [ $(id -u) -eq 0 ]; then
	echo "Please do not run as root!"
	exit 1
fi

backlightname=$(ls /sys/class/backlight)
udevstring="ACTION==\"add\", SUBSYSTEM==\"backlight\", KERNEL==\"$backlightname\", GROUP=\"video\", MODE=\"0664\""
echo $udevstring > backlight.rules
sudo cp -i backlight.rules /etc/udev/rules.d/backlight.rules
sudo usermod -aG video $USER
