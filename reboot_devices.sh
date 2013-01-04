#!/bin/sh
export ADB_DEVICE_ARG="-s ${ANDROID_SERIAL:-"955ED215BB322D218E0059C65A6D128"}"
export ADB_DEVICE_ARG2="-s ${ANDROID_SERIAL2:-"38E36136411CBE01882C4B4E9A222CA"}"
echo $ADB_DEVICE_ARG
echo $ADB_DEVICE_ARG2
HOUR=$(date +%H)
MIN=$(date +%M)
mod=$(($HOUR % 2))
if [ $mod -eq 0 ] && [ $MIN -gt 48 ]; then
	echo "Rebooting..."
	adb $ADB_DEVICE_ARG reboot && adb $ADB_DEVICE_ARG2 reboot
else
	echo "doing nothing so far...";
fi
