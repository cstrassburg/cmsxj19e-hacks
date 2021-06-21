#!/bin/sh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`
#echo "$SCRIPTPATH"
LAYOUTFILE="$SCRIPTPATH/layout.txt"


if [ $# -eq 0 ];  then
    echo "Copy BOOT.bin, KERNEL.bin, ROOT.bin DATA.bin CONFIG.bin FACTORY.bin to a full rom file, you can flash directly to the flash chip using ch341a"
    echo "No arguments supplied"
    echo "use:"
    echo "$0 <boot.bin> <kernel.bin> <root.bin> <data.bin> <config.bin> <factory.bin>  "
    exit 1
fi
if [ ! -f $1 ]; then
    echo "File: \"$1\" not found!"
    exit 1
fi


OUTFILE="full_flash.rom"



while read line 
do
        FROM=$(echo $line|cut -c1-14);
        TO=$(echo $line|cut -c16-29);
        SIZE=$(($TO - $FROM));
        NAME=$(echo $line|cut -d"\"" -f2) ;
        echo $NAME $FROM $TO $SIZE;
done < $LAYOUTFILE

 dd if=$1 of=$OUTFILE bs=1 seek=$((0x0000000000))
 dd if=$2 of=$OUTFILE bs=1 seek=$((0x00000050000))
 dd if=$3 of=$OUTFILE bs=1 seek=$((0x000000250000))
 dd if=$4 of=$OUTFILE bs=1 seek=$((0x0000009b0000))
 dd if=$5 of=$OUTFILE bs=1 seek=$((0x000000fe0000))
 dd if=$6 of=$OUTFILE bs=1 seek=$((0x000000ff0000))
