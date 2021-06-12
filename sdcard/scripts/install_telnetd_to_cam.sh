#!/bin/sh


cd /mnt/data/bin
cp /mnt/sdcard/bin/telnetd-static .
echo "if pidof telnetd-static >/dev/null; then echo telnetd is running; else /mnt/data/bin/telnetd-static &; fi" >> wifi_start.sh
