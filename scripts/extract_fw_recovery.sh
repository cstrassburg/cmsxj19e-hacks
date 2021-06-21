#!/bin/sh

# this script extract the 4 parts of an update image. tf_recovery.img or tf_update.img
# after extract you have 4 files in the _tf_update.img_extracted directory
# 1. KERNEL.bin
# 2. ROOTFS.bin
# 3. DATA.bin
# 4. SIGNATURE.bin

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
#echo "$SCRIPTPATH"


if [ $# -eq 0 ];  then
    echo "extract the 4 parts of an update image. tf_recovery.img or tf_update.img"
    echo "No arguments supplied"
    echo "use:"
    echo "$0 <file>                   <file> name of the tf_recovery.img or tf_update.img file" 
    exit 1
fi
if [ ! -f $1 ]; then
    echo "File: \"$1\" not found!"
    exit 1
fi


OUTDIR="_$(basename $1)_extracted"


mkdir $OUTDIR
        NAME="KERNEL"
	SIZEKERNEL=$((0x000000250000 - 0x000000050000))
	FROM=0
	dd if=$1 of=$OUTDIR/$NAME.bin bs=1 count=$SIZEKERNEL skip=$(($FROM))

	FROM=$SIZEKERNEL
        NAME="ROOTFS"
	SIZEROOTFS=$((0x0000009b0000 - 0x000000250000))
	dd if=$1 of=$OUTDIR/$NAME.bin bs=1 count=$SIZEROOTFS skip=$(($FROM))

	FROM=$(($SIZEKERNEL + $SIZEROOTFS))
	SIZEDATA=$((0x000000fe0000 - 0x0000009b0000))
	NAME="DATA"
	dd if=$1 of=$OUTDIR/$NAME.bin bs=1 count=$SIZEDATA skip=$(($FROM))
	
	NAME="SIGNATURE"
	SIZESIG=80
	FROM=$(($SIZEKERNEL + $SIZEROOTFS + $SIZEDATA))

	dd if=$1 of=$OUTDIR/$NAME.bin bs=1 count=$SIZESIG skip=$(($FROM))

