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

YEAH. You are on the uBoot console


next step  FLASH ROM from SD-CARD

