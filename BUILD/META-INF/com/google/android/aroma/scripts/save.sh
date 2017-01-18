#!/sbin/sh
mount /system;
if [ ! -d /system/aroma ]; then
	mkdir /system/aroma;
else
    rm -f /system/aroma/ap_*.prop;
fi

for f in `find /tmp/aroma/*.prop -type f -mtime -1`; do
    cp -f $f /system/aroma/;
done

umount /system;
exit 0
