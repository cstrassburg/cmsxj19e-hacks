# How to change the ROOTFS squashfs image
- extract ROOTFS
- change the files
- create a new image
-
First, it is important that you have a ROOTFS.bin. Either from the tf_update.bin or from your own reading of the partition or the flash chip.

see: 
 - how to extract tf_recovery.bin or tf_update.bin
 - how to dump the flash
 - how to tead the flash with ch341a

If you have th ROOTFS.bin, you can extract the whole camera filesystem with a few commands:
At first change the dir to your FW-Image and then run
```
$ unsquashfs ROOTFS.bin

$ ls -la 
$ cd root-squash

TODO: patch .............

$ mksquashfs squashfs-root/ newimage.squashfs -noappend  -comp xz 

```

