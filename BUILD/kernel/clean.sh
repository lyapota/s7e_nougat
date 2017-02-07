#!/sbin/sh
# ========================================
# script Apollo ROM
# ========================================
# Created by lyapota

PARAM=$1

if [ "$PARAM." == "." ]; then
  PARAM="1"
fi

sed -i /timaversion/d /system/build.prop
sed -i /security.mdpp.mass/d /system/build.prop
sed -i /ro.hardware.keystore/d /system/build.prop

# Remove SU images
rm -rf /data/magisk.apk
rm -rf /cache/magisk.log /cache/last_magisk.log /cache/magiskhide.log \
       /cache/magisk /cache/magisk_merge /cache/magisk_mount /cache/unblock 2>/dev/null

rm -rf /data/SuperSU.apk

if [ $PARAM == "3" ] || [ $PARAM == "1" ]; then
  rm -rf /data/magisk.img /data/magisk_merge.img /data/stock_boot.img \
         /data/busybox /data/magisk /data/custom_ramdisk_patch.sh 2>/dev/null
fi

if [ $PARAM == "2" ] || [ $PARAM == "1" ]; then
  rm -rf /data/su.img /data/stock_boot*.gz /data/supersu /supersu
fi

