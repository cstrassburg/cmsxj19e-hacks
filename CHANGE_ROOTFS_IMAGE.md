# How to change the ROOTFS squashfs image
- extract ROOTFS
- change the files
- create a new image
-
First, it is important that you have a ROOTFS.bin. Either from the tf_update.img or from your own reading of the partition or the flash chip.

see: 
 - how to extract tf_recovery.img or tf_update.img
 - how to dump the flash
 - how to tead the flash with ch341a

If you have th ROOTFS.bin, you can extract the whole camera filesystem with a few commands.
At first change the dir to your FW-Image and then run:
```
$ unsquashfs ROOTFS.bin
```
This will create a directory ``squashfs-root`` with the content of the read only partition of the camera linux system.
But now you can modifiy it. 

```
$ ls -a  squashfs-root/
.   bin     data          dev  lib    linuxrc  mnt       opt   root  sbin  tmp         usr
..  config  default.prop  etc  lib32  media    mstar_ko  proc  run   sys   ueventd.rc  var

```
You can change the content freely or use my patch-scripts. 
Important are the directories ``etc/init.d/``, ``bin`` and ``etc`` itself.

After changing the Squashfs partition, you can repack it as follows:

```
$ mksquashfs squashfs-root/ NEW_ROOTFS.bin -noappend  -comp xz 

```


Now you have a modified RootFS image. However, since the memory area of the flash is larger than the created file, we have to extend it. This is done as follows:
```
dd if=/dev/zero of=./NEW_ROOTFS.bin bs=1 count=$(( 7733248 - $(stat -c%s ./NEW_ROOTFS.bin) )) seek=$(stat -c%s ./NEW_ROOTFS.bin)
```
This will fill your RootFS file up to 7733248 bytes. 

