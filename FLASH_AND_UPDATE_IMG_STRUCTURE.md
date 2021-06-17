# Structure of tf_recovery.img, tf_update.img or a flash dump

The files tf_recovery.img or tf_update.img have the following structure.
```
0x000000-0x200000 : "KERNEL"
0x200000-0x960000 : "ROOTFS"
0x960000-0xf90000 : "DATA"
0xf90000-0xf90080 : "SIGNATURE"
```

The flashrom of the camera has 16 MB and has the following structure.

```
0x000000000000-0x000000050000 : "BOOT"
0x000000050000-0x000000250000 : "KERNEL"
0x000000250000-0x0000009b0000 : "ROOTFS"
0x0000009b0000-0x000000fe0000 : "DATA"
0x000000fe0000-0x000000ff0000 : "CONFIG"
0x000000ff0000-0x000001000000 : "FACTORY"

```


When updating via tf_recovery.img or tf_update.img, the areas KERNEL, ROOTFS and DATA are overwritten in the flash. 
The procedure that is carried out is: 

- Loading the contents from the SD card, 
- checking the signature with libsodium 
- delete the area from 0x000000050000 - 0x000000fe0000 in the flash chip
- Copy the data from the RAM to the flash chip. 

If your are in the u-Boot bootloader you can do the same with this commands, but without the signature check:
```
sf probe
fatload mmc 0 0x030000000 tf_update.img
sf erase 0x50000 0xF90000
sf write 0x030000000 0x50000 0xF90000
```
With this commands you can update every partition of the flash chip, without a spi programmer. 
You only have to adjust the addresses in the memory.

If you are going to hack the camera, you can use the scripts I have prepared.
You should be able to change the ROOTFS, use a programmer or a TTL serial stick to see what works. 
