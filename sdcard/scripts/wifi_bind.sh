#!/bin/sh

SSID=$1
PASSWD=$2

cd /mnt/data/bin
mortoxc set nvram default key_mgmt WPA-PSK
mortoxc set nvram default miio_passwd $PASSWD
mortoxc set nvram default miio_ssid $SSID
mortoxc set nvram default bind_status ok
mortoxc sync nvram 

#exec wifi_start.sh
