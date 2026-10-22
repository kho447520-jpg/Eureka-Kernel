# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=HaubaiKernel by Haubai Team
do.devicecheck=0
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=
device.name2=
device.name3=
device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } 

if [ -e /dev/block/platform/13500000.dwmmc0/by-name/BOOT ]; then
	block=/dev/block/platform/13500000.dwmmc0/by-name/BOOT;
elif [ -e /dev/block/platform/13500000.dwmmc0/by-name/boot ]; then
	block=/dev/block/platform/13500000.dwmmc0/by-name/boot;
fi

is_slot_device=0;
ramdisk_compression=auto;

. tools/ak3-core.sh;

set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

split_boot;
ui_print "- Installing HaubaiKernel";
flash_boot;

ui_print " ";
ui_print "- Installation finished successfully";
ui_print " ";
ui_print "- Thank you for using HaubaiKernel :)";
ui_print " ";
