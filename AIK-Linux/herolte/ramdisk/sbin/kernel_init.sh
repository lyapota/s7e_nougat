#!/system/bin/sh

MODE=$1

log_print() {
  echo "($MODE) $1" >> /dev/.launch_kinit.log
}

if [ -f "/dev/.kinit" ]; then
  log_print "next start"
  exit;
fi

log_print "start"

run() {
    echo "$MODE" >> /dev/.kinit

    # Mount root as RW to apply tweaks and settings
    busybox mount -o remount,rw /

    # Synapse
    chmod 666 /sys/module/workqueue/parameters/power_efficient
    chmod -R 755 /res/*
    ln -fs /res/synapse/uci /sbin/uci
    /sbin/uci

    # default kernel params
    /sbin/kernel_params.sh

    busybox mount -o remount,ro /

    # Mount as RW to apply tweaks and settings
    busybox mount -o remount,rw /system
    busybox mount -o remount,rw /data

    # Make internal storage directory.
    if [ ! -d /data/apollo ]; then
	mkdir /data/apollo
    fi;

    # init.d support
    if [ ! -e /system/etc/init.d ]; then
       mkdir /system/etc/init.d
       chown -R root.root /system/etc/init.d
       chmod -R 755 /system/etc/init.d
    fi

    # start init.d
    for FILE in /system/etc/init.d/*; do

        su -c ${FILE}
        resSU=$?
        if [ $resSU == 0 ]; then
            echo "SU run init.d/${FILE}" >> /dev/.kinit;
        else
            /system/bin/sh ${FILE}
            echo "SH run init.d/${FILE}" >> /dev/.kinit;
        fi;

    done;
}

case $1 in
  su )
    if [ `cat /proc/mounts | grep /magisk >/dev/null 2>&1; echo $?` -ne 0 ]; then
      log_print "!init"
      exit;
    fi
    log_print "init"
    run
    ;;

  supersu )
    if [ `cat /proc/mounts | grep /su >/dev/null 2>&1; echo $?` -ne 0 ]; then
      log_print "!init"
      exit;
    fi
    log_print "init"
    run
    ;;

  service )
    log_print "late_start"
    run
    ;;

esac
