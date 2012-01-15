#!/sbin/sh

exec >> /tmp/bml_over_mtd.log 2>&1

rm /data/modem.bin
/sbin/bml_over_mtd dump radio 1954 reservoir 2004 /data/modem/bin
ln -s /data/modem.bin /dev/block/bml12
