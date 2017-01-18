#!/sbin/sh
# ========================================
# script Apollo kernels
# ========================================
# Created by lyapota

val1=$1

        case $val1 in
        	1)
		  BOOT="boot-hero2lte.img"
        	  ;;
        	2)
		  BOOT="boot-herolte.img"
        	  ;;
        esac

echo "unpack $BOOT"
mv -f /tmp/"$BOOT" /tmp/AIK/boot.img

cd /tmp/AIK
chmod 755 unpackimg.sh;
./unpackimg.sh boot.img
rm -f boot.img

