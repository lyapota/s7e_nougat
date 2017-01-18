#!/sbin/sh
mount /system;
	cp -f /system/aroma/ap_*.prop /tmp/aroma;
        chmod 777 /tmp/aroma/ap_*.prop
umount /system;
exit 0
