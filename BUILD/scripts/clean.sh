#!/sbin/sh
# ========================================
# script Apollo kernels
# ========================================
# Created by lyapota

PARAM=$1

if [ "$PARAM." == "." ]; then
  PARAM="1"
fi

# Remove SU images
rm -rf /data/magisk.apk
rm -rf /cache/magisk.log /cache/last_magisk.log /cache/magiskhide.log \
       /cache/magisk /cache/magisk_merge /cache/magisk_mount /cache/unblock 2>/dev/null

rm -rf /data/SuperSU.apk

if [ $PARAM == "3" ] || [ $PARAM == "1" ]; then
  rm -rf /data/magisk.log /data/magisk.img /data/magisk_merge.img /data/stock_boot.img \
         /data/busybox /data/magisk /data/custom_ramdisk_patch.sh 2>/dev/null
fi

if [ $PARAM == "2" ] || [ $PARAM == "1" ]; then
  rm -rf /data/su.img /data/stock_boot*.gz /data/supersu /supersu /data/adb/su/suhide
fi

