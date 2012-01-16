#!/sbin/sh

mount -o remount,rw /

exec >> /tmp/bml_over_mtd.log 2>&1

rm /data/modem.bin
/sbin/bml_over_mtd dump radio 1954 reservoir 2004 /data/modem.bin
ln -s /data/modem.bin /dev/block/bml12

if [ ! -e /data/efs.bin ]
then
	/sbin/bml_over_mtd dump efs 2002 reservoir 2004 /data/efs.bin
fi
ln -s /data/efs.bin /dev/nvs

mount -o remount,ro /
