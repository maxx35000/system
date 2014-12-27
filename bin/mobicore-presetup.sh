#!/system/bin/sh
# Startup script for MobiCore processes #

sleep 2 
/system/bin/mcStarter tbase300

echo MobiCore startup script called...
# load kernel modules
#insmod /system/lib/modules/mcdrvmodule.ko
#insmod /system/lib/modules/mckernelapi.ko

# set device node permissions for TLC apps
chmod 700 /dev/mobicore
chmod 666 /dev/mobicore-user
chown system.system /dev/mobicore
chown radio.system /dev/mobicore-user

# mobicore trustlets
ln -s /system/app/mcRegistry/07010000000000000000000000000000.tlbin /data/app/mcRegistry/07010000000000000000000000000000.tlbin
chown system.system /data/app/mcRegistry/07010000000000000000000000000000.tlbin

# TMO Remote SIM Unlock trustlet (link if trustlet exists)
if [ -e /system/app/mcRegistry/08880000000000000000000000000000.tlbin ]; then
    ln -s /system/app/mcRegistry/08880000000000000000000000000000.tlbin /data/app/mcRegistry/08880000000000000000000000000000.tlbin
    chown system.system /data/app/mcRegistry/08880000000000000000000000000000.tlbin
fi
