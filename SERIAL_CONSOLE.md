# Serial console

On the PCB are some test pads, in the area of the flash chip you can find the RX, TX and GND pads.

>> TODO: Picture Serial wires

- open putty ot miniterm and connet to a serial port of you USB tty stick  eg. /dev/ttyUSB0
- conenct the 3 wires GND RX and TX from the stick:
  - GND - GND 
  - TX  - RX 
  - RX  - TX

- plug the USB wire into a 5V power supply or your notebook and see yout camera booting

>> TODO: boot log

- wait until camara has booted and press some time the ENTER key

>> TODO: boot log end 

- unplug the power supply from the camera 
- hold the ENTER key down and power your camera up

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
Disable MMU and D-cache before jump to UBOOTÍ

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

```

YEAH. You are on the uBoot console!

If you type ``?`` and press ENTER, you get a command overview:

```


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

next step  FLASH ROM from SD-CARD

