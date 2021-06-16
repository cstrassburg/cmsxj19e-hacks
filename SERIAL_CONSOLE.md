# Serial console
- [connecting serial console](#connecting-serial-console)
- [interrupting boot sequence](#interrupting-boot-sequence) 



## connecting serial console
On the PCB are some test pads, in the area of the flash chip you can find the RX, TX and GND pads.

>> TODO: Picture Serial wires

- open putty or miniterm and connect to a serial port of you USB tty stick  eg. /dev/ttyUSB0, ,speed: 115200
- connect the 3 wires GND, RX and TX from the stick:
  - GND - GND 
  - TX  - RX 
  - RX  - TX

- plug the main power USB wire into a 5V power supply or your notebook and see the camera booting
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
Disable MMU and D-cache before jump to UBOOTí

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

_[sdmmc_0] mmc_core_init
_[sdmmc_0] Card Detect Fail!
** Bad device mmc 0 **
there's no sdcard, ignore dfu

                  MXIC REMS: 0xC2,0x17
Flash is detected (0x0509, 0xC2, 0x20, 0x18)
SF: Detected nor0 with total size 16 MiB
SF: 2097152 bytes @ 0x50000 Read: OK
##  Booting kernel from Legacy Image at 22000000 ...
   Image Name:   MVX2##I6g05c28aeKL_LX409####[BR:
   Image Type:   ARM Linux Kernel Image (lzma compressed)
   Data Size:    1570388 Bytes = 1.5 MiB
   Load Address: 20008000
   Entry Point:  20008000
   Verifying Checksum ... OK
   Uncompressing Kernel Image ...
[XZ] !!!reserved 0x21000000 length=0x 1000000 for xz!!
   XZ: uncompressed size=0x334000, ret=7
OK
ERR: Can't find KIMG header and initrd address, 0x00000000
atags:0x20000000

Starting kernel ...

Booting Linux on physical CPU 0x0
Linux version 4.9.84 (ubuntu@f363d561821d) (gcc version 4.9.4 (Buildroot 2017.08-gc7bbae9) ) #3 PREEMPT Sat Sep 19 19:26:06 CST 2020
CPU: ARMv7 Processor [410fc075] revision 5 (ARMv7), cr=50c53c7d
CPU: div instructions available: patching division code
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
early_atags_to_fdt() success
OF: fdt:Machine model: INFINITY6 SSC009A-S01A QFN88
[ERROR] LX_MEM, LX_MEM2, LX_MEM3 should be aligned to 1MB
[ERROR] LX_MEM, LX_MEM2, LX_MEM3 should be aligned to 1MB
[ERROR] LX_MEM, LX_MEM2, LX_MEM3 should be aligned to 1MB
LXmem is 0x3fc6000 PHYS_OFFSET is 0x20000000
Add mem start 0x20000000 size 0x3fc6000!!!!

LX_MEM  = 0x20000000, 0x3fc6000
LX_MEM2 = 0x0, 0x0
LX_MEM3 = 0x0, 0x0
EMAC_LEN= 0x0
DRAM_LEN= 0x0
deal_with_reserve_mma_heap memblock_reserve success mma_config[0].reserved_start=
0x22ac6000

cma: Reserved 2 MiB at 0x22800000
Memory policy: Data cache writeback
CPU: All CPU(s) started in SVC mode.
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 16198
Kernel command line: console=ttyS0,115200 root=/dev/mtdblock2 rootfstype=squashfs ro init=/linuxrc LX_MEM=0x3fc6000 mma_heap=mma_heap_name0,miu=0,sz=0x1500000
PID hash table entries: 256 (order: -2, 1024 bytes)
Dentry cache hash table entries: 8192 (order: 3, 32768 bytes)
Inode-cache hash table entries: 4096 (order: 2, 16384 bytes)
Memory: 37552K/65304K available (1842K kernel code, 201K rwdata, 1016K rodata, 100K init, 134K bss, 25704K reserved, 2048K cma-reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xffc00000 - 0xfff00000   (3072 kB)
    vmalloc : 0xc4000000 - 0xff800000   ( 952 MB)
    lowmem  : 0xc0000000 - 0xc3fc6000   (  63 MB)
    modules : 0xbf800000 - 0xc0000000   (   8 MB)
      .text : 0xc0008000 - 0xc01d4cb0   (1844 kB)
      .init : 0xc02ef000 - 0xc0308000   ( 100 kB)
      .data : 0xc0308000 - 0xc033a4d8   ( 202 kB)
       .bss : 0xc033c000 - 0xc035db74   ( 135 kB)
SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=1, Nodes=1
Preemptible hierarchical RCU implementation.
        Build-time adjustment of leaf fanout to 32.
NR_IRQS:16 nr_irqs:16 16
ms_init_main_intc: np->name=ms_main_intc, parent=gic
ms_init_pm_intc: np->name=ms_pm_intc, parent=ms_main_intc
ss_init_gpi_intc: np->name=ms_gpi_intc, parent=ms_main_intc
Find CLK_cpupll_clk, hook ms_cpuclk_ops
arm_arch_timer: Architected cp15 timer(s) running at 6.00MHz (virt).
clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x1623fa770, max_idle_ns: 440795202238 ns
sched_clock: 56 bits at 6MHz, resolution 166ns, wraps every 4398046511055ns
Switching to timer-based delay loop, resolution 166ns
console [ttyS0] enabled
Calibrating delay loop (skipped), value calculated using timer frequency.. 12.00 BogoMIPS (lpj=60000)
pid_max: default: 4096 minimum: 301
Mount-cache hash table entries: 1024 (order: 0, 4096 bytes)
Mountpoint-cache hash table entries: 1024 (order: 0, 4096 bytes)
CPU: Testing write buffer coherency: ok
Setting up static identity map for 0x200081c0 - 0x200081f0
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 2 part 30 variant 7 rev 5
clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
futex hash table entries: 16 (order: -4, 448 bytes)
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations


Version : MVX2##I6g05c28aeKL_LX409####[BR:HEAD]#XVM

GPIO: probe end[ss_gpi_intc_domain_alloc] hw:42 -> v:51
[MS_PM_INTC] hw:20 -> v:53
hw-breakpoint: found 5 (+1 reserved) breakpoint and 4 watchpoint registers.
hw-breakpoint: maximum watchpoint size is 8 bytes.
Linux video capture interface: v2.00
MSYS:  INIT DONE. TICK=0x01544244
Advanced Linux Sound Architecture Driver Initialized.
clocksource: Switched to clocksource arch_sys_counter
NET: Registered protocol family 2
TCP established hash table entries: 1024 (order: 0, 4096 bytes)
TCP bind hash table entries: 1024 (order: 2, 20480 bytes)
TCP: Hash tables configured (established 1024 bind 1024)
UDP hash table entries: 128 (order: 0, 6144 bytes)
UDP-Lite hash table entries: 128 (order: 0, 6144 bytes)
NET: Registered protocol family 1
hw perfevents: enabled with armv7_cortex_a7 PMU driver, 5 counters available
workingset: timestamp_bits=30 max_order=14 bucket_order=0
squashfs: version 4.0 (2009/01/31) Phillip Lougher
jffs2: version 2.2. Â© 2001-2006 Red Hat, Inc.
io scheduler noop registered
io scheduler deadline registered (default)
libphy: Fixed MDIO Bus: probed
i2c /dev entries driver
1f221000.uart0: ttyS0 at MMIO 0x0 (irq = 39, base_baud = 10800000) is a unknown
1f221200.uart1: ttyS1 at MMIO 0x0 (irq = 40, base_baud = 10800000) is a unknown
URDMA rx_buf=0xC2842000(phy:0x22842000) tx_buf=0xC2843000(phy:0x22843000) size=0x1000
1f220400.uart2: ttyS2 at MMIO 0x0 (irq = 42, base_baud = 10800000) is a unknown
[ms_gpioi2c] sda-gpio=8, scl-gpio=9
[__infinity_wdt_get_clk_rate] of_clk_get failed
check_osc_clk get much clk error from DTS
[SAR] infinity_sar_probe
MSYS: DMEM request: [BDMA_FSP_WBUFF]:0x00000100
MSYS: DMEM request: [BDMA_FSP_WBUFF]:0x00000100 success, CPU phy:@0x22844000, virt:@0xC2844000
[Ser flash] phys=0x22844000, virt=0xc2844000, bus=0x02844000
[FSP] MXIC REMS: 0xC2,0x17
[FSP] Flash is detected (0x0509, 0xC2, 0x20, 0x18) ver1.1
[FSP] 1-1-1 FAST_READ MODE
mtd .name = NOR_FLASH, .size = 0x01000000 (16MiB)
 .erasesize = 0x00010000 .numeraseregions = 0
MXP_PARTS!!
MXP found at mxp_offset[3]=0x00020000, size=0x1000
Creating 6 MTD partitions on "NOR_FLASH":
0x000000000000-0x000000050000 : "BOOT"
0x000000050000-0x000000250000 : "KERNEL"
0x000000250000-0x0000009b0000 : "ROOTFS"
0x0000009b0000-0x000000fe0000 : "DATA"
0x000000fe0000-0x000000ff0000 : "CONFIG"
0x000000ff0000-0x000001000000 : "FACTORY"
MSYS: DMEM request: [AESDMA_ENG]:0x00001000
MSYS: DMEM request: [AESDMA_ENG]:0x00001000 success, CPU phy:@0x22845000, virt:@0xC2845000
MSYS: DMEM request: [AESDMA_ENG1]:0x00001000
MSYS: DMEM request: [AESDMA_ENG1]:0x00001000 success, CPU phy:@0x22846000, virt:@0xC2846000
infinity_aes soc:aesdma: MSTAR AES engine enabled.
cryptodev: driver aesdmadev loaded.
[ms_cpufreq_init] cpu current clk=796917760
[ms_pwm_probe][118] 0xc27f1710
NET: Registered protocol family 17
ThumbEE CPU extension supported.
hctosys: unable to open rtc device (rtc0)
OF: fdt:not creating '/sys/firmware/fdt': CRC check failed
ALSA device list:
  No soundcards found.
VFS: Mounted root (squashfs filesystem) readonly on device 31:2.
devtmpfs: mounted
Freeing unused kernel memory: 100K
This architecture does not have kernel memory protection.
+ source /etc/hooks/pre-init
+ exec chroot . /bin/busybox linuxrc
[ss_gpi_intc_domain_alloc] hw:67 -> v:59
[ss_gpi_intc_domain_alloc] hw:68 -> v:60
net.ipv4.ip_local_reserved_ports = 54322,54321,54320
random: factory: uninitialized urandom read (4 bytes read)
Starting logging: OK
random: factory: uninitialized urandom read (4 bytes read)
78:8B:2A:BF:51:9F
random: fix_tz: uninitialized urandom read (4 bytes read)
random: sissylog: uninitialized urandom read (4 bytes read)
RPC: Registered named UNIX socket transport module.
RPC: Registered udp transport module.
RPC: Registered tcp transport module.
RPC: Registered tcp NFSv4.1 backchannel transport module.
>> [sdmmc] ms_sdmmc Driver Initializing...
>> [sdmmc] ms_sdmmc_probe
>> [sdmmc_0] MIE IRQ: 48
>> [sdmmc_0] CDZ IRQ: 50
>> [sdmmc_0] Enable SDIO Interrupt Mode!
>> [sdmmc_0] Get CD => (0)

>> [sdmmc_0] CDZ... (EJT) OK!
>> [sdmmc_0] Get CD => (0)
>> [sdmmc_0] Int CDZ use Ext GPIO IRQ: (50)
>> [sdmmc_0] Probe Platform Devices...(Ret:0)
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
Mstar_ehc_init version:20180309
Sstar-ehci-1 H.W init
CHIP_FUNCTION SET. ID=4, param=1
Get power-enable-pad from DTS GPIO(65535)
Failed to request USB0-power-enable GPIO(255)
Titania3_series_start_ehc start
[USB] config miu select [70] [e8] [ef] [ef]
[USB] enable miu lower bound address subtraction
[USB] init squelch level 0x2
[USB] no platform_data, device tree coming
[USB][EHC] dma coherent_mask 0xffffffffffffffff mask 0xffffffffffffffff
BC disable
[USB] soc:Sstar-ehci-1 irq --> 45
Sstar-ehci-1 soc:Sstar-ehci-1: EHCI Host Controller
Sstar-ehci-1 soc:Sstar-ehci-1: new USB bus registered, assigned bus number 1
Sstar-ehci-1 soc:Sstar-ehci-1: irq 45, io mem 0xfd284800
usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
usb usb1: Product: EHCI Host Controller
usb usb1: Manufacturer: Linux 4.9.84 ehci_hcd
usb usb1: SerialNumber: mstar
hub 1-0:1.0: USB hub found
hub 1-0:1.0: 1 port detected
SCSI subsystem initialized
usbcore: registered new interface driver usb-storage
mstar notify driver install successfully
==20180309==> hub_port_init 1 #0
Plug in USB Port1
usb 1-1: new high-speed USB device number 2 using Sstar-ehci-1
mhal: loading out-of-tree module taints kernel.
mhal driver init
[CSI]init
[CSI]probe
0request 4 lane IRQ#33
4 lane CSI IP interrupt registered.
[CSI] register driver successvif driver probe
VIF_HANDLE_VIF1: fd263200
VIF_HANDLE_PADTOP: fd203c00
VIF_HANDLE_ISPCLKGEN: fd226600
VIF_HANDLE_CLKGEN: fd207000
VIF_HANDLE_DMABASE: fd000000
[VIF] vif irq interrupt registered #34
regist ok: 37
Create device file. vif_ints,0
venc_max_clk:320MHZ
venc driver probed
jpe driver probed
[Isp_Driver_Init]
=== [isp_probe] ===
[proval] = 5
[isp_clk_index] = 5
[DrvIsp_Open]
[ISP] Request IRQ: 32, 57
[IspMid_Driver_Init]
=== [ispmid probe] ===
ispsclttl:0
module [sys] init
MI_SYSCFG_SetupMmapLoader default_config_path:/config/config_tool, argv1:/config/load_mmap,argv2:/config/mmap.ini
random: config_tool: uninitialized urandom read (4 bytes read)
Function = init_glob_miu_kranges, Line = 603, Insert KProtect for LX @ MIU: 0
Function = init_glob_miu_kranges, Line = 612, [INIT] for LX0 kprotect: from 0x20000000 to 0x23FC6000, using block 0
[CMDQ]init buffer cmdq(0x3fc6000-0xc4393000-0x1a000)
function:parese_Cmdline,pCmd_Section:0x3fc6000
mm
a_
he
ap
_n
am
e0
    miu=0,sz=1500000  reserved_start=22ac6000
r_front->miuBlockIndex:0,r_front->start_cpu_bus_pa:0x20000000,r_front->start_cpu_bus_pa+r_front->length:0x22ac6000
mi_sys_mma_allocator_create success, heap_base_addr=22ac6000 length=1500000
Sigmastar Module version: project_commit.cae39c8 sdk_commit.9528d2a build_time.20190708173224
module [sensor] init
usb 1-1: New USB device found, idVendor=148f, idProduct=7601
module [ao] init
usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
module [rgn] init
module [ai] init
module [vpe] init
module [vif] init
module [venc] init Oct 25 2019 11:23:58
module [divp] init
Connect gc2053_init_driver linear to sensor pad 0
mt7601Usta: Unknown symbol RTMPQMemAddr (err 0)
mt7601Usta: Unknown symbol RTMPQMemAddr (err 0)
mtprealloc: module license 'unspecified' taints kernel.
Disabling lock debugging due to kernel taint
==>[0]:PreBuff:0xc12e4000, DmaAddr:0x212e4000
==>[1]:PreBuff:0xc2364000, DmaAddr:0x22364000
==>[2]:PreBuff:0xc1208000, DmaAddr:0x21208000
==>[3]:PreBuff:0xc1264000, DmaAddr:0x21264000
==>[4]:PreBuff:0xc13c4000, DmaAddr:0x213c4000
==>[5]:PreBuff:0xc1258000, DmaAddr:0x21258000
==>[6]:PreBuff:0xc12e8000, DmaAddr:0x212e8000
==>[7]:PreBuff:0xc12ec000, DmaAddr:0x212ec000
==>[8]:PreBuff:0xc15f8000, DmaAddr:0x215f8000
==>[9]:PreBuff:0xc15fc000, DmaAddr:0x215fc000
==>[10]:PreBuff:0xc1bc8000, DmaAddr:0x21bc8000
==>[11]:PreBuff:0xc1bcc000, DmaAddr:0x21bcc000
==>[12]:PreBuff:0xc1b80000, DmaAddr:0x21b80000
==>[13]:PreBuff:0xc1b84000, DmaAddr:0x21b84000
==>[14]:PreBuff:0xc1200000, DmaAddr:0x21200000
==>[15]:PreBuff:0xc1204000, DmaAddr:0x21204000
==>[16]:PreBuff:0xc1268000, DmaAddr:0x21268000
==>[17]:PreBuff:0xc126c000, DmaAddr:0x2126c000
==>[18]:PreBuff:0xc13c8000, DmaAddr:0x213c8000
==>[19]:PreBuff:0xc13cc000, DmaAddr:0x213cc000
==>[20]:PreBuff:0xc1250000, DmaAddr:0x21250000
==>[21]:PreBuff:0xc1254000, DmaAddr:0x21254000
==>[22]:PreBuff:0xc1240000, DmaAddr:0x21240000
==>[23]:PreBuff:0xc1244000, DmaAddr:0x21244000
==>[24]:PreBuff:0xc1248000, DmaAddr:0x21248000
==>[25]:PreBuff:0xc124c000, DmaAddr:0x2124c000
==>[26]:PreBuff:0xc1210000, DmaAddr:0x21210000
==>[27]:PreBuff:0xc1214000, DmaAddr:0x21214000
==>[28]:PreBuff:0xc1218000, DmaAddr:0x21218000
==>[29]:PreBuff:0xc121c000, DmaAddr:0x2121c000
==>[30]:PreBuff:0xc1270000, DmaAddr:0x21270000
==>[31]:PreBuff:0xc1274000, DmaAddr:0x21274000
==>[32]:PreBuff:0xc1278000, DmaAddr:0x21278000
==>[33]:PreBuff:0xc127c000, DmaAddr:0x2127c000
==>[34]:PreBuff:0xc13d0000, DmaAddr:0x213d0000
==>[35]:PreBuff:0xc13d4000, DmaAddr:0x213d4000
==>[36]:PreBuff:0xc13d8000, DmaAddr:0x213d8000
==>[37]:PreBuff:0xc13dc000, DmaAddr:0x213dc000
==>[38]:PreBuff:0xc12f0000, DmaAddr:0x212f0000
==>[39]:PreBuff:0xc12f4000, DmaAddr:0x212f4000
==>[40]:PreBuff:0xc12f8000, DmaAddr:0x212f8000
==>[41]:PreBuff:0xc12fc000, DmaAddr:0x212fc000
==>[42]:PreBuff:0xc1220000, DmaAddr:0x21220000
==>[43]:PreBuff:0xc1224000, DmaAddr:0x21224000
==>[44]:PreBuff:0xc1228000, DmaAddr:0x21228000
==>[45]:PreBuff:0xc122c000, DmaAddr:0x2122c000
==>[46]:PreBuff:0xc1230000, DmaAddr:0x21230000
==>[47]:PreBuff:0xc1234000, DmaAddr:0x21234000
==>[48]:PreBuff:0xc1238000, DmaAddr:0x21238000
==>[49]:PreBuff:0xc123c000, DmaAddr:0x2123c000
==>[50]:PreBuff:0xc12c0000, DmaAddr:0x212c0000
==>[51]:PreBuff:0xc12c4000, DmaAddr:0x212c4000
==>[52]:PreBuff:0xc12c8000, DmaAddr:0x212c8000
==>[53]:PreBuff:0xc12cc000, DmaAddr:0x212cc000
==>[54]:PreBuff:0xc12d0000, DmaAddr:0x212d0000
==>[55]:PreBuff:0xc12d4000, DmaAddr:0x212d4000
==>[56]:PreBuff:0xc12d8000, DmaAddr:0x212d8000
==>[57]:PreBuff:0xc12dc000, DmaAddr:0x212dc000
==>[58]:PreBuff:0xc13e0000, DmaAddr:0x213e0000
==>[59]:PreBuff:0xc13e4000, DmaAddr:0x213e4000
==>[60]:PreBuff:0xc13e8000, DmaAddr:0x213e8000
==>[61]:PreBuff:0xc13ec000, DmaAddr:0x213ec000
==>[62]:PreBuff:0xc13f0000, DmaAddr:0x213f0000
==>[63]:PreBuff:0xc13f4000, DmaAddr:0x213f4000
==>[64]:PreBuff:0xc13f8000, DmaAddr:0x213f8000
==>[65]:PreBuff:0xc13fc000, DmaAddr:0x213fc000
==>[66]:PreBuff:0xc1280000, DmaAddr:0x21280000
==>[67]:PreBuff:0xc1284000, DmaAddr:0x21284000
==>[68]:PreBuff:0xc1288000, DmaAddr:0x21288000
==>[69]:PreBuff:0xc128c000, DmaAddr:0x2128c000
==>[70]:PreBuff:0xc1af3000, DmaAddr:0x21af3000
==>[71]:PreBuff:0xc1af0000, DmaAddr:0x21af0000
==>[72]:PreBuff:0xc1290000, DmaAddr:0x21290000
==>[73]:PreBuff:0xc1298000, DmaAddr:0x21298000
==>[74]:PreBuff:0xc12a0000, DmaAddr:0x212a0000
==>[75]:PreBuff:0xc12a8000, DmaAddr:0x212a8000
==>[76]:PreBuff:0xc12b0000, DmaAddr:0x212b0000
==>[77]:PreBuff:0xc12b8000, DmaAddr:0x212b8000
==>[78]:PreBuff:0xc1380000, DmaAddr:0x21380000
==>[79]:PreBuff:0xc1388000, DmaAddr:0x21388000
==>[80]:PreBuff:0xc144a800, DmaAddr:0x2144a800
install prealloc ok
rtusb init rt2870 --->


=== pAd = c480c000, size = 930512 ===

allocate tx ringidx 0
RTMPQMemAddr[0]
allocate tx ringidx 1
RTMPQMemAddr[1]
allocate tx ringidx 2
RTMPQMemAddr[2]
allocate tx ringidx 3
RTMPQMemAddr[3]
allocate tx ringidx 4
RTMPQMemAddr[4]
allocate tx ringidx 5
RTMPQMemAddr[5]
allocate tx ringidx 6
RTMPQMemAddr[6]
allocate tx ringidx 7
RTMPQMemAddr[7]
allocate tx ringidx 8
RTMPQMemAddr[8]
allocate tx ringidx 9
RTMPQMemAddr[9]
allocate tx ringidx 10
RTMPQMemAddr[10]
allocate tx ringidx 11
RTMPQMemAddr[11]
allocate tx ringidx 12
RTMPQMemAddr[12]
allocate tx ringidx 13
RTMPQMemAddr[13]
allocate tx ringidx 0
RTMPQMemAddr[14]
allocate tx ringidx 1
RTMPQMemAddr[15]
allocate tx ringidx 2
RTMPQMemAddr[16]
allocate tx ringidx 3
RTMPQMemAddr[17]
allocate tx ringidx 4
RTMPQMemAddr[18]
allocate tx ringidx 5
RTMPQMemAddr[19]
allocate tx ringidx 6
RTMPQMemAddr[20]
allocate tx ringidx 7
RTMPQMemAddr[21]
allocate tx ringidx 8
RTMPQMemAddr[22]
allocate tx ringidx 9
RTMPQMemAddr[23]
allocate tx ringidx 10
RTMPQMemAddr[24]
allocate tx ringidx 11
RTMPQMemAddr[25]
allocate tx ringidx 12
RTMPQMemAddr[26]
allocate tx ringidx 13
RTMPQMemAddr[27]
allocate tx ringidx 0
RTMPQMemAddr[28]
allocate tx ringidx 1
RTMPQMemAddr[29]
allocate tx ringidx 2
RTMPQMemAddr[30]
allocate tx ringidx 3
RTMPQMemAddr[31]
allocate tx ringidx 4
RTMPQMemAddr[32]
allocate tx ringidx 5
RTMPQMemAddr[33]
allocate tx ringidx 6
RTMPQMemAddr[34]
allocate tx ringidx 7
RTMPQMemAddr[35]
allocate tx ringidx 8
RTMPQMemAddr[36]
allocate tx ringidx 9
RTMPQMemAddr[37]
allocate tx ringidx 10
RTMPQMemAddr[38]
allocate tx ringidx 11
RTMPQMemAddr[39]
allocate tx ringidx 12
RTMPQMemAddr[40]
allocate tx ringidx 13
RTMPQMemAddr[41]
allocate tx ringidx 0
RTMPQMemAddr[42]
allocate tx ringidx 1
RTMPQMemAddr[43]
allocate tx ringidx 2
RTMPQMemAddr[44]
allocate tx ringidx 3
RTMPQMemAddr[45]
allocate tx ringidx 4
RTMPQMemAddr[46]
allocate tx ringidx 5
RTMPQMemAddr[47]
allocate tx ringidx 6
RTMPQMemAddr[48]
allocate tx ringidx 7
RTMPQMemAddr[49]
allocate tx ringidx 8
RTMPQMemAddr[50]
allocate tx ringidx 9
RTMPQMemAddr[51]
allocate tx ringidx 10
RTMPQMemAddr[52]
allocate tx ringidx 11
RTMPQMemAddr[53]
allocate tx ringidx 12
RTMPQMemAddr[54]
allocate tx ringidx 13
RTMPQMemAddr[55]
RTMPQMemAddr[70]
RTMPQMemAddr[71]
RTMPQMemAddr[72]
RTMPQMemAddr[73]
RTMPQMemAddr[74]
RTMPQMemAddr[75]
RTMPQMemAddr[76]
RTMPQMemAddr[77]
RTMPQMemAddr[78]
RTMPQMemAddr[79]
RTMPQMemAddr[80]
<-- RTMPAllocTxRxRingMemory, Status=0
<-- RTMPAllocAdapterBlock, Status=0
<-- RTMPAllocAdapterBlock, Status=0
RTMP_COM_IoctlHandle():pAd->BulkOutEpAddr=0x8
RTMP_COM_IoctlHandle():pAd->BulkOutEpAddr=0x4
RTMP_COM_IoctlHandle():pAd->BulkOutEpAddr=0x5
RTMP_COM_IoctlHandle():pAd->BulkOutEpAddr=0x6
RTMP_COM_IoctlHandle():pAd->BulkOutEpAddr=0x7
RTMP_COM_IoctlHandle():pAd->BulkOutEpAddr=0x9
STA Driver version-JEDI.MP1.mt7601u.v1.12.2.2
==>WaitForAsicReady MAC_CSR0=0x76010500
==>WaitForAsicReady MAC_CSR0=0x76010500
NVM is EFUSE
Endpoint(8) is for In-band Command
Endpoint(4) is for WMM0 AC0
Endpoint(5) is for WMM0 AC1
Endpoint(6) is for WMM0 AC2
Endpoint(7) is for WMM0 AC3
Endpoint(9) is for WMM1 AC0
Endpoint(84) is for Data-In
Endpoint(85) is for Command Rsp
80211> RFICType = 3
NumOfChan ===> 58
80211> Number of channel = 0x44
80211> Number of rate = 12
80211> CurTxPower = 0 dBm
80211> TxStream = 0
crda> requlation requestion by core: 00
80211> CFG80211_Register
usbcore: registered new interface driver rt2870
exFAT: Version 1.2.9
Starting mdev...
Try copy log from TF card
mount: mounting /dev/mmcblk0p1 on /mnt/sdcard failed: No such fi/etc/init.d/S12copylog: Unable to copy log fron sdcard
le or directory
mount: mounting /dev/mmcblk0 on /mnt/sdcard failed: No such file or directory
Starting watchdog...
read-only file system detected...done
Starting network: random: imi_watchdog: uninitialized urandom read (4 bytes read)
argc=3
imi watchdog>>>reset=10,timeout=40
OK
Starting wifi ......
mount: mounting /dev/mmcblk0p1 on /mnt/sdcard failed: No such file or directory
mount: mounting /dev/mmcblk0 on /mnt/sdcard failed: No such file or directory
random: perpboot: uninitialized urandom read (4 bytes read)
random: sissylog: uninitialized urandom read (4 bytes read)
wlan0
random: iwconfig: uninitialized urandom read (4 bytes read)
random: mortoxc: uninitialized urandom read (4 bytes read)
unknown
Starting crond...
Start detecting tf_update.img mount sdcard agagin
mount: mounting /dev/mmcblk0p1 on /mnt/sdcard failed: No such file or directory
mount: mounting /dev/mmcblk0 on /mnt/sdcard failed: No such file or directory
/mnt/sdcard/tf_update.img not exist
/mnt/sdcard/tf_all.img not exist
/mnt/sdcard/tf_all_recovery.img not exist
Starting netcheck...
Starting script on data
Starting telnetd
tcpsvd: listening on 0.0.0.0:2121, starting
++++ ok
Enabling wifi STA mode
client [568] connected, module:sys
client [568] connected, module:sensor
[MHal_SNR_SetPlaneMode] Use default map
[DrvSensorSetMclk] MCLK 27M!
WPA-PSK
client [568] connected, module:vif
killall: udhcpc: no process kill[MI WRN ]: MI_VIF_IMPL_SetDevAttr[1179]: MHal_VIF_DevSetConfig u32VifDev 0, eHDRMode 0
med
client [568] connected, module:vpe
client [568] connected, module:rgn
DrvOsdSetColorInverseEn 120: Fail ID
killall: wpa_supplicant: no process killed
CmdqProcInit 658
[CMDQ0] Virtual IRQ: 31
client [568] connected, module:venc
create dev:0
create dev:1
create dev:2
[ven-m][ctx5] MheCtxAcquire Sucess mctx:c0a02800
[ss_gpi_intc_domain_alloc] hw:69 -> v:61
[DrvPWMPadSet][399] (pwmId, padId) = (4, 44)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (4, 0)
killall: hostapd: no process killed
reg=0x1F003610 clk=12000000, period=0x1
[DrvPWMPadSet][399] (pwmId, padId) = (5, 45)
[group_period_in][245] 0xc27f1710
killall: udhcpd:[group_period_in][253] (pwm_id, period) = (5, 0)
reg=0x1F003690 clk=12000000, period=0x1
[DrvPWMPadSet][399] (pwmId, padId) = (6, 46)
 no process killed
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (6, 0)
reg=0x1F003710 clk=12000000, period=0x1
[DrvPWMPadSet][399] (pwmId, padId) = (7, 47)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (7, 0)
reg=0x1F003790 clk=12000000, period=0x1
[group_stop_in][416] (pwm_id, enable) = (0, 0)
[group_enable_in][362] cannot enable/disable group 0 again. enable status = 0
[MS_PM_INTC] hw:4 -> v:62
[DrvPWMPadSet][399] (pwmId, padId) = (4, 44)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (4, 50)
reg=0x1F003610 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (5, 45)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (5, 50)
reg=0x1F003690 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (6, 46)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (6, 50)
reg=0x1F003710 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (7, 47)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (7, 50)
reg=0x1F003790 clk=12000000, period=0x1d4bf
[group_round_in][334] (pwm_id, round) = (1, 256)
================> UP : RTMP_SEM_EVENT_WAIT(STA)
1. LDO_CTR0(6c) = a64799, PMU_OCLEVEL c
2. LDO_CTR0(6c) = a6478d, PMU_OCLEVEL 6
==>WaitForAsicReady MAC_CSR0=0x76010500
FW Version:0.1.00
Build:7640
Bui
ld Time: 
2
0
1
5
1
1
1
8
2
1
1
8
_
_
_
_

ILM Length = 52136(bytes)
DLM Length = 0(bytes)
Loading FW
.
.
.
.

RTMP_TimerListAdd: add timer obj c489a38c!
RTMP_TimerListAdd: add timer obj c489a3b8!
RTMP_TimerListAdd: add timer obj c489a3e4!
RTMP_TimerListAdd: add timer obj c489a360!
RTMP_TimerListAdd: add timer obj c489a2dc!
RTMP_TimerListAdd: add timer obj c489a308!
RTMP_TimerListAdd: add timer obj c482f124!
RTMP_TimerListAdd: add timer obj c481e550!
RTMP_TimerListAdd: add timer obj c481e580!
RTMP_TimerListAdd: add timer obj c482f1b8!
RTMP_TimerListAdd: add timer obj c482f0cc!
RTMP_TimerListAdd: add timer obj c482f18c!
RTMP_TimerListAdd: add timer obj c482f0f8!
==>WaitForAsicReady MAC_CSR0=0x76010500
random: fast init done
[ven-m][ctx5] _MheOn channel:0 Sucess
client [568] connected, module:divp
DivpProcInit 237
[DIP] num_parents:1! CLK_dip 320000000
ISP chip ID = 0x02
[DrvSensorGetAEMinMaxGain]nDevID 0, nSNRPadID 0, nPlane 255



===== MhalCameraOpen, 5448 begin. =====
n3DNRLevel = 1, nRotationEn = 0
nCropX:0, nCropY:0
nCropWidth:1920, nCropHeight:1080
ePixelFmt:1, eBayerID:0
eMode:0, eHdrType:0, ptMemAlloc:0xc0a52ba0
In (w, h) = (1920, 1080), Crop (1920, 1080), ROT = 0
nFlagCus3A = 0x0
ShutDelay= 2, GainDelay= 2
ISP Mload base remap: 0xFD000000
[CameraReadIqData] isp root is /config/iqfile
Load default iq size = xxx, GetDbgBufSize = 51304
R: 0, eOrit: 3
DRAM ID = 0x01
[u32HistBaseAddr]3DNR PhyL:0x23650000, Virt:0xc4b59000, MIU:0x3650000
[u32RefBaseAddr]3DNR ptMemAlloc, BufSize = 0x1fa400, BufNum = 1
dnr_engine = 0, w: 1920, h: 1080, bayerid: 0
[3DNR]BitDepth: 8-bits
[3DNR]DataMode: Linear
[3DNR]BlockWidth: 128
[3DNR]RowMode: 2K
[MHal_VIF_InputMask] HDR_MODE 0, workmode 3
[DIP] Virtual IRQ: 38

[ven-m][ctx5] MheCtxAcquire Sucess mctx:c0a02000
[ven-m][ctx5] _MheOn channel:1 Sucess
cfg_mode=9
cfg_mode=9
wmode_band_equal(): Band Equal!
Key1Str is Invalid key length(0) or Type(0)
Key2Str is Invalid key length(0) or Type(0)
Key3Str is Invalid key length(0) or Type(0)
Key4Str is Invalid key length(0) or Type(0)
[CMDQ1] Virtual IRQ: 36
###### Force at HT20 (BW_20) mode !!! ########
1. Phy Mode = 14
2. Phy Mode = 14
NVM is Efuse and its size =1d[1e0-1fc]
Efuse FreeBlock =19
ERROR!!! MT7601 E2PROM: WRONG VERSION 0xc, should be 9
3. Phy Mode = 14
AntCfgInit: primary/secondary ant 0/1
[DrvAlgo_IF_AWB_SetCTCaliAttr] StartIdx = 02, EndIdx = 07
CtParam[00] = 0041,0099,0016,0012
CtParam[04] = 0042,0087,0017,0010
CtParam[08] = 0043,0077,0017,0013
CtParam[12] = 0044,0064,0019,0010
CtParam[16] = 0046,0054,0019,0008
CtParam[20] = 0051,0046,0026,0012
CtParam[24] = 0077,0043,0020,0014
CtParam[28] = 0097,0039,0018,0013
CtParam[32] = 0115,0037,0015,0012
CtParam[36] = 0130,0035,0010,0010
Please Change ParaMode into Night Mode first!!!!!client [568] connected, module:ai
[MI WRN ]: _MI_AI_CreateDevice[1473]: ai mma buffer addr, phy addr[62382080] vir addr[c4e99000], phy[0] vir[0].
No connection! Set fake rssi= -80!!!
---> InitFrequencyCalibration
InitFrequencyCalibrationMode:Unknow mode = 3
InitFrequencyCalibration: frequency offset in the EEPROM = 106(0x6a)
<--- InitFrequencyCalibration
RTMPSetPhyMode: channel is out of range, use first channel=1
MCS Set = ff 00 00 00 00
<==== STA : rt28xx_init, Status=0
80211> re-init bands...
80211> RFICType = 1
NumOfChan ===> 14
80211> Number of channel = 0x44
80211> Number of rate = 12
80211> CurTxPower = 0 dBm
80211> TxStream = 1
0x1300 = 00064300
RTMPDrvOpen(1):Check if PDMA is idle!
RTMPDrvOpen(2):Check if PDMA is idle!
CntlOidSsidProc():CNTL - 0 BSS of 0 BSS match the desire <================ UP : RTMP_SEM_EVENT_UP(STA)
(6)SSID - 11n-AP
client [568] connected, module:ao
Successfully initialized wpa_supplicant
No connection! Set fake rssi= -80!!!
rfkill: Cannot open RFKILL control device
No connection! Set fake rssi= -80!!!
<<<MI_RGN_IMPL_GetDisplayAttr[1780] pstChnPort and handle not matched.
<<<MI_RGN_IMPL_SetDisplayAttr[1737] pstChnPort and handle not matched.

80211> CFG80211_OpsPmksaFlush ==>
Successfully initialized wpa_supplicant
No connection! Set fake rssi= -80!!!
[group_stop_in][416] (pwm_id, enable) = (1, 0)
[DrvPWMPadSet][399] (pwmId, padId) = (7, 47)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (7, 50)
reg=0x1F003790 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (6, 46)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (6, 50)
reg=0x1F003710 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (5, 45)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (5, 50)
reg=0x1F003690 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (4, 44)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (4, 50)
reg=0x1F003610 clk=12000000, period=0x1d4bf
[group_round_in][334] (pwm_id, round) = (1, 512)
No connection! Set fake rssi= -80!!!
Mrfkill: Cannot open RFKILL control device
pIoctlScan->ScanType=0
No connection! Set fake rssi= -80!!!
MT7601_ChipSwitchChannel: SwitchChannel#1(RF=15, 1T)
No connection! Set fake rssi= -80!!!
MT7601_ChipSwitchChannel: SwitchChannel#2(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#3(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#4(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#5(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#6(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#7(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#8(RF=15, 1T)
No connection! Set fake rssi= -80!!!
MT7601_ChipSwitchChannel: SwitchChannel#9(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#10(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#11(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#12(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#13(RF=15, 1T)
MT7601_ChipSwitchChannel: SwitchChannel#14(RF=15, 1T)
80211> CFG80211_OpsPmksaFlush ==>
ctrl_iface exists and seems to be in use - cannot override it
Delete '/var/run/wpa_supplicant/wlan0' manually if it is not used anymore
Failed to initialize control interface '/var/run/wpa_supplicant'.
You may have another wpa_supplicant process already running or the file was
left by an unclean termination of wpa_supplicant in which case you will need
to manually remove this file before starting wpa_supplicant again.

nl80211: deinit ifname=wlan0 disabled_11b_rates=0
No connection! Set fake rssi= -80!!!
MT7601_ChipSwitchChannel: SwitchChannel#1(RF=15, 1T)
80211> cfg80211_scan_done
[1114][Debug][CFG80211OS_ScanEnd] FlgIsAborted = 0
No connection! Set fake rssi= -80!!!
No connection! Set fake rssi= -80!!!
80211> Connect bssid f4:92:bf:51:97:46
CntlOidSsidProc():CNTL - 2 BSS of 11 BSS match the desire
(8)SSID - testlan5
CntlOidSsidProc: Found BSSID(f4:92:bf:51:97:46)
MT7601_ChipSwitchChannel: SwitchChannel#6(RF=15, 1T)
PeerBeaconAtJoinAction(): HT-CtrlChannel=6, CentralChannel=>6
PeerBeaconAtJoinAction(): Set CentralChannel=6
MT7601_ChipSwitchChannel: SwitchChannel#6(RF=15, 1T)
!!!Infra LINK UP !!!
!!! LINK UP !!! (Density =6, )
!!! LINK UP !!!  ClientStatusFlags=d1)
!!! LINK UP !! (StaActive.bHtEnable =1)
LinkUP AP supports 20/40 BSS COEX, Dot11BssWidthTriggerScanInt[300]
chuangmi_camera_ipc019e
udhcpc: started, v1.31.0
udhcpc: sending discover
STASendPacket --> Drop packet before port secured !!!
udhcpc: sending discover
STASendPacket --> Drop packet before port secured !!!
[group_stop_in][416] (pwm_id, enable) = (1, 0)
[DrvPWMPadSet][399] (pwmId, padId) = (4, 44)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (4, 50)
reg=0x1F003610 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (5, 45)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (5, 50)
reg=0x1F003690 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (6, 46)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (6, 50)
reg=0x1F003710 clk=12000000, period=0x1d4bf
[DrvPWMPadSet][399] (pwmId, padId) = (7, 47)
[group_period_in][245] 0xc27f1710
[group_period_in][253] (pwm_id, period) = (7, 50)
reg=0x1F003790 clk=12000000, period=0x1d4bf
[group_round_in][334] (pwm_id, round) = (1, 256)
udhcpc: performing DHCP renew
udhcpc: sending discover
RTMP_TimerListAdd: add timer obj c48e7fa4!
Rcv Wcid(1) AddBAReq
Start Seq = 00000000
RTMP_TimerListAdd: add timer obj c48e9dc4!
udhcpc: sending select for 192.168.0.147
udhcpc: lease of 192.168.0.147 obtained, lease time 259200
deleting routers
adding dns 192.168.0.113
get ip addr :
192.168.0.147
```
- wait until camara has booted and press some times the ENTER key or write something
```
udhcpc: lease of 192.168.0.147 obtained, lease time 259200
deleting routers
adding dns 192.168.0.113
get ip addr :
192.168.0.123


test
        
```
if you can see what you write, your TX-> RX is working. If not, check the cable or solder points.

## interrupting boot sequence
If your console connect ist working you can interrupt the boot sequence:

- unplug the power supply from the camera 
- hold the ENTER key down and power your camera up

you can see: 
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
SigmaStar # 
SigmaStar # 
SigmaStar # 
SigmaStar # 

```

YEAH. You are on the uBoot console!

If your camera is booting the kernel, check key stroke repeat is on and start a second try.  


If you are on the prompt type ``?`` and press ENTER, you get a command overview:

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

check and copy the env, sometimes you need it later 
``printenv``

```
SigmaStar # printenv
baudrate=115200
bootargs=console=ttyS0,115200 root=/dev/mtdblock2 rootfstype=squashfs ro init=/linuxrc LX_MEM=0x3fc6000 mma_heap=mma_heap_name0,miu=0,sz=0x1500000
bootcmd=sf probe 0;sf read 0x22000000 ${sf_kernel_start} ${sf_kernel_size};bootm 0x22000000
bootdelay=0
cpu_part_start=14950000
ethact=sstar_emac
ethaddr=00:30:1b:ba:02:db
fileaddr=23b82cf8
filesize=a3
gatewayip=172.17.190.1
ipaddr=172.17.190.5
netmask=255.255.255.0
serverip=172.17.190.64
sf_kernel_size=200000
sf_kernel_start=50000
sf_part_size=6b0000
sf_part_start=950000
stderr=serial
stdin=serial
stdout=serial
```

next step  FLASH ROM from SD-CARD

- copy rootfs to the sd-card
- plug sd card in to the camera 
- 

