#!/sbin/sh
rm -f /data/.supersu
rm -f /cache/.supersu

if [ -f "/tmp/aroma/ge_su_install.prop" ]; then
  INSTALL=`cat /tmp/aroma/ge_su_install.prop | grep "selected.0" | cut -f 2 -d '='`
  if [ "$INSTALL" = "2" ]; then
    # System
    echo "SYSTEMLESS=false">>/data/.supersu
  elif [ "$INSTALL" = "3" ]; then
    # Systemless Image
    echo "SYSTEMLESS=true">>/data/.supersu
    echo "BINDSBIN=false">>/data/.supersu
  elif [ "$INSTALL" = "4" ]; then
    # Systemless SBIN
    echo "SYSTEMLESS=true">>/data/.supersu
    echo "BINDSBIN=true">>/data/.supersu
  fi
fi

if [ -f "/tmp/aroma/ge_su_encrypt.prop" ]; then
  KEEPVERITY=`cat /tmp/aroma/ge_su_encrypt.prop | grep "selected.1" | cut -f 2 -d '='`
  if [ "$KEEPVERITY" = "2" ]; then
    # Remove
    echo "KEEPVERITY=false">>/data/.supersu
  elif [ "$KEEPVERITY" = "3" ]; then
    # Keep
    echo "KEEPVERITY=true">>/data/.supersu
  fi

  KEEPFORCEENCRYPT=`cat /tmp/aroma/ge_su_encrypt.prop | grep "selected.2" | cut -f 2 -d '='`
  if [ "$KEEPFORCEENCRYPT" = "2" ]; then
    # Remove
    echo "KEEPFORCEENCRYPT=false">>/data/.supersu
  elif [ "$KEEPFORCEENCRYPT" = "3" ]; then
    # Keep
    echo "KEEPFORCEENCRYPT=true">>/data/.supersu
  fi

  REMOVEENCRYPTABLE=`cat /tmp/aroma/ge_su_encrypt.prop | grep "selected.3" | cut -f 2 -d '='`
  if [ "$REMOVEENCRYPTABLE" = "2" ]; then
    # Remove
    echo "REMOVEENCRYPTABLE=true">>/data/.supersu
  elif [ "$REMOVEENCRYPTABLE" = "3" ]; then
    # Keep
    echo "REMOVEENCRYPTABLE=false">>/data/.supersu
  fi
fi

if [ -f "/tmp/aroma/ge_su_misc.prop" ]; then
  FRP=`cat /tmp/aroma/ge_su_misc.prop | grep "selected.1" | cut -f 2 -d '='`
  if [ "$FRP" = "2" ]; then
    # Enable
    echo "FRP=true">>/data/.supersu
  elif [ "$FRP" = "3" ]; then
    # Disable
    echo "FRP=false">>/data/.supersu
  fi

  BINDSYSTEMXBIN=`cat /tmp/aroma/ge_su_misc.prop | grep "selected.2" | cut -f 2 -d '='`
  if [ "$BINDSYSTEMXBIN" = "2" ]; then
    # Enable
    echo "BINDSYSTEMXBIN=true">>/data/.supersu
  elif [ "$BINDSYSTEMXBIN" = "3" ]; then
    # Disable
    echo "BINDSYSTEMXBIN=false">>/data/.supersu
  fi

  PERMISSIVE=`cat /tmp/aroma/ge_su_misc.prop | grep "selected.3" | cut -f 2 -d '='`
  if [ "$PERMISSIVE" = "2" ]; then
    # Enforcing
    echo "PERMISSIVE=false">>/data/.supersu
  elif [ "$PERMISSIVE" = "3" ]; then
    # Permissive
    echo "PERMISSIVE=true">>/data/.supersu
  fi
fi
