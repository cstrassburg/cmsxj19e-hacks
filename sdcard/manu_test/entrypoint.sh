#!/bin/sh
echo "Xiaomi Hacks enabled" > /mnt/sdcard/hacks.log
if [ -f "/tmp/.factory_lock" ]; then
  rm -f /tmp/.factory_lock
fi 


echo '#!/bin/sh' > /mnt/data/bin/touch
chmod +x /mnt/data/bin/touch

/mnt/sdcard/bin/telnetd-static &


