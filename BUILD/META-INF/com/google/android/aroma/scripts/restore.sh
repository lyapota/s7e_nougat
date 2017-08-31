#!/sbin/sh
mount /system;
	cp -f /system/aroma/he_*.prop /tmp/aroma;
        chmod 777 /tmp/aroma/he_*.prop
umount /system;
exit 0
