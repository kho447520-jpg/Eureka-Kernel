device.name4=
device.name5=
supported.versions=
supported.patchlevels=
'; } # end properties

# shell variables
if [ -e /dev/block/platform/13500000.dwmmc0/by-name/BOOT ]; then
	block=/dev/block/platform/13500000.dwmmc0/by-name/BOOT;
elif [ -e /dev/block/platform/13500000.dwmmc0/by-name/boot ]; then
	block=/dev/block/platform/13500000.dwmmc0/by-name/boot;
fi

is_slot_device=0;
ramdisk_compression=auto;

## AnyKernel methods (DO NOT CHANGE)
. tools/ak3-core.sh;

## AnyKernel file attributes
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;

## AnyKernel install
# Chỉ flash kernel Image, KHÔNG flash DTB/DTBO
# (LineageOS có DTB/DTBO riêng, flash đè sẽ gây bootloop)
split_boot;
ui_print "- Installing HaubaiKernel";
flash_boot;

ui_print " ";
ui_print "- Installation finished successfully";
ui_print " ";
ui_print "- Thank you for using HaubaiKernel :)";
ui_print " ";

## end install
