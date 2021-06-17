# Xiaomi imilab A1 Camera hacks (cmsxj19e - ipc019e)

!!! This project is currently under development and works only up to Frimware 3.8.5_0165 !!!

Don't upgrade the camera to firmware 3.5.8_0166 !!! 

On firmware 3.5.8_0166 Imilab changes the public key and the bootloader, so you can not easy downgrade and this scripts are not working.

If you can get a telnet connection to the camera, great, you can do anything with that.Downgrade, patch RootFS, change DATA partition, backup the firmware... How, you can find out here

If your camera does not open a telnet port, there are other ways to change it initially. I have meanwhile worked out several ways, which you can find here. One is to use the SPI programmer CH341a, the second is to use the serial console and a TTL adapter. Both require disassembling the camera. I am still working on a way without having to open the camera. If you have an idea, let me know. 

These ways described here work not only for the Xiaomi imilab A1 but probably for all Xiaomi Imilab cameras as they are very similar. I can't test it though, as I don't have them.

If your cam is on this firmware look into "modifying firmware > 3.5.8_0165"


- [supported devices](#supported-devices)
- [install instructions](#install)
- [next steps](#next-steps)
- [device information](#device-information)
- [serial connection](SERIAL_CONSOLE.md)
- [modifying firmware > 3.5.8_0165](#firmware-hack)
- [bootloader](#bootloader)
- 
## Supported devices

Model Name(s) | Picture
--- | ---
cmsxj19e|![cmsxj19e](images/cmsxj19e.jpg)


## Install

### With Mi Home App

1. Configure the camera using the Mi Home app
2. copy the content of sdcard folder to a SD-Card, 
3. insert the card into the cam and 
4. power the camera on 
5. telnet to the camera IP 
6. login as "root", password "" 
You are root!

### Without Mi Home App

If you don't want to use the Mi Home App, you can install telnet/ash without a connection to the Mi servers. 
You can use a new camera or one after a reset.

1. Put the content of sdcard folder to a SD-Card
2. Insert the card into the camera
3. Power the camera on. 
4. Wait until a voice speak to you
5. Connect to the open AP with an notebook. You get an IP from the camera (192.168.14.10)
6. Telnet to 192.168.14.1 

You are root!

7. WiFi setup...
 /mnt/sdcard/scripts/wifi_.sh
8. 
9. reboot


## next steps

1. rtsp
2. Motor driver 
3. mount ext2fs on sd
4. mount nfs 
5. cut connection to mi servers
6. solve problems with dropbear

## Serial connection



[output 1](serial_output_1.txt)

## Firmware Hack

If you have firmware version greater than 3.5.8_0165 you have to modify the firmware reading, changing and writing rhe flash rom directly.

Imilab changes the key inside the firmware and signed it, so you can't downgrade the firmware and can't apply this scripts directy (for the moment).

1. disassembly the camera
2. read flash 
3. modify flash
4. write flash 
5. test 
6. assembly the camera
7. boot and root

### What do you need 

- ch341a SPI programmer
- linux system 

### Steps

#### disassembly the camera

#### read the flashrom
```
sudo flashrom --programmer ch341a_spi -c "MX25L12835F/MX25L12845E/MX25L12865E" -r backup2.bin
```

#### modify the flashrom 

#### write the flashrom

#### test

Allways test before you assembly the system


#### assembly the camera

#### boot and root



## Device information

cpu: [Star SSC 323](images/IMG_20210607_164115.jpg)

Flash: [MX25L12833F](images/IMG_20210607_164201.jpg) [Datasheet](https://www.macronix.com/Lists/Datasheet/Attachments/7447/MX25L12833F,%203V,%20128Mb,%20v1.0.pdf)

```
# uname -a
Linux mijia_camera 4.9.84 #3 PREEMPT Wed May 27 10:01:08 CST 2020 armv7l GNU/Linux
```
```
# cat /proc/cpuinfo 
processor       : 0
model name      : ARMv7 Processor rev 5 (v7l)
BogoMIPS        : 15.05
Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls vfpv4 idiva idivt vfpd32 lpae evtstrm 
CPU implementer : 0x41
CPU architecture: 7
CPU variant     : 0x0
CPU part        : 0xc07
CPU revision    : 5

Hardware        : SStar Soc (Flattened Device Tree)
Revision        : 0000
Serial          : 0000000000000000
```
```
# mount
/dev/root on / type squashfs (ro,relatime)
devtmpfs on /dev type devtmpfs (rw,relatime,size=18776k,nr_inodes=4694,mode=755)
proc on /proc type proc (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=666)
tmpfs on /dev/shm type tmpfs (rw,relatime,mode=777)
tmpfs on /tmp type tmpfs (rw,relatime)
tmpfs on /run type tmpfs (rw,nosuid,nodev,relatime,mode=755)
sysfs on /sys type sysfs (rw,relatime)
none on /sys/kernel/debug type debugfs (rw,relatime)
/dev/mtdblock3 on /mnt/data type jffs2 (rw,relatime)
devpts on /dev/pts type devpts (rw,relatime,gid=5,mode=620,ptmxmode=666)
/dev/mmcblk0p1 on /mnt/sdcard type vfat (rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=iso8859-1,shortname=mixed,errors=remount-ro)
cloud on /tmp/cloud type tmpfs (rw,nosuid,nodev,noexec,noatime,nodiratime,size=1024k)

```

```
# cat /proc/partitions 
major minor  #blocks  name

  31        0        320 mtdblock0
  31        1       2048 mtdblock1
  31        2       7552 mtdblock2
  31        3       6336 mtdblock3
  31        4         64 mtdblock4
  31        5         64 mtdblock5
 179        0    7880704 mmcblk0
 179        1    7796736 mmcblk0p1
```

```
# lsmod 
Module                  Size  Used by    Tainted: P  
exfat                  77142  0 
mt7601Usta            903751  1 
mtprealloc              2171  1 mt7601Usta
drv_ms_cus_gc2053_MIPI_new     6671  0 
cfg80211              175553  1 mt7601Usta
mi_divp                41983  0 
mi_venc               177429  0 
mi_vif                 33979  0 
mi_vpe                 80020  0 
mi_ai                  69020  0 
mi_rgn                 87853  2 mi_divp,mi_vpe
mi_ao                  52293  0 
mi_sensor              23016  0 
mi_sys                418288  8 mi_divp,mi_venc,mi_vif,mi_vpe,mi_ai,mi_rgn,mi_ao,mi_sensor
mi_common               8870  9 mi_divp,mi_venc,mi_vif,mi_vpe,mi_ai,mi_rgn,mi_ao,mi_sensor,mi_sys
mhal                 1196195 10 drv_ms_cus_gc2053_MIPI_new,mi_divp,mi_venc,mi_vif,mi_vpe,mi_ai,mi_rgn,mi_ao,mi_sensor,mi_sys
ms_notify               1342  0 
sd_mod                 22065  0 
usb_storage            39043  0 
scsi_mod              101106  2 sd_mod,usb_storage
ehci_hcd               34278  0 
usbcore               131853  3 mt7601Usta,usb_storage,ehci_hcd
usb_common              3756  1 usbcore
vfat                    6827  1 
fat                    43088  1 vfat
kdrv_sdmmc             28472  0 
mmc_block              20684  2 
mmc_core               86396  2 kdrv_sdmmc,mmc_block
nfsv2                  11056  0 
nfs                   108706  1 nfsv2
lockd                  39929  2 nfsv2,nfs
sunrpc                175969  3 nfsv2,nfs,lockd
grace                   2730  1 lockd
nls_utf8                1457  0 
cifs                  166591  0 
```
## Bootloader 

Output from the bootloader interrupted in loading kernel

``?`` shows help and all available commands


```
IPL g2cd6de2
D-05
64MB
BIST0_0001-OK
Load IPL_CUST from NOR
MXP found at 0x00020000
offset:00010000
Checksum OK

IPL_CUSTg2cd6de2
MXP found at 0x00020000
runUBOOT()
[SPI_NOR]
 -Verify CRC32 passed!
 -Decompress XZ
  u32HeaderSize=0x00000040
  u32Loadsize=0x0001a270
  decomp_size=0x00047abc
Disable MMU and D-cache before jump to UBOOT▒

U-Boot 2015.01 (Sep 19 2020 - 19:24:19), Build: jenkins-ipc019e_3.5.8_0165-13

Version: I6g05c28ae
I2C:   ready
DRAM:
gpio debug MHal_GPIO_Pad_Set:606
gpio[14] is 0
gpio debug MHal_GPIO_Pad_Set:606
gpio[14] is 1
WARNING: Caches not enabled
MMC:   MStar SD/MMC: 0
nor_flash_mxp allocated success!!
MXIC REMS: 0xC2,0x17
Flash is detected (0x0509, 0xC2, 0x20, 0x18)
SF: Detected nor0 with total size 16 MiB
MXP found at mxp_offset[2]=0x00020000, size=0x1000
env_offset=0x4F000 env_size=0x1000
MXIC REMS: 0xC2,0x17
Flash is detected (0x0509, 0xC2, 0x20, 0x18)
SF: Detected nor0 with total size 16 MiB
In:    serial
Out:   serial
Err:   serial
Net:   Net Initialization Skipped
No ethernet found.
SigmaStar #


SigmaStar #
SigmaStar # ?
?       - alias for 'help'
base    - print or set address offset
bootm   - boot application image from memory
bootp   - boot image via network using BOOTP/TFTP protocol
cmp     - memory compare
cp      - memory copy
crc32   - checksum calculation
dbg     - set debug message level. Default level is INFO
dcache  - enable or disable data cache
debug   - Disable uart rx via PAD_DDCA to use debug tool
dhcp    - boot image via network using DHCP/TFTP protocol
dstar   - script via SD/MMC
eeprom  - EEPROM sub-system
env     - environment handling commands
estar   - script via network
fatinfo - print information about filesystem
fatload - load binary file from a dos filesystem
fatls   - list files in a directory (default /)
fatread - FAT fatread with FSTART
fatsize - determine a file's size
go      - start application at address 'addr'
gpio    - Config gpio port
help    - print command description/usage
i2c     - I2C sub-system
icache  - enable or disable instruction cache
initDbgLevel- Initial varaible 'dbgLevel'
loop    - infinite loop on address range
md      - memory display
mm      - memory modify (auto-incrementing address)
mmc     - MMC sub system
mmcinfo - display MMC info
mssdmmc - Mstar SD/MMC IP Verification System
mstar   - script via TFTP
mw      - memory write (fill)
mxp     - MXP function for Mstar MXP partition
nm      - memory modify (constant address)
ping    - send ICMP ECHO_REQUEST to network host
printenv- print environment variables
reset   - Perform RESET of the CPU
riu     - riu  - riu command

run     - run commands in an environment variable
saveenv - save environment variables to persistent storage
setenv  - set environment variables
sf      - SPI flash sub-system
sfbin   - for uploading sf image to a server(via network using TFTP protocol)
srcfg   - sensor pin and mclk configuration.
tftpboot- boot image via network using TFTP protocol
version - print monitor, compiler and linker version


```
