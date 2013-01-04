#!/bin/sh
echo $1
date
echo timeout $2s adb -s $1 logcat -b events | grep -m 1  "I/notification_enqueue(" 
timeout $2s adb -s $1 logcat -b events | grep -m 1  "I/notification_enqueue("
date
echo "End notify"
