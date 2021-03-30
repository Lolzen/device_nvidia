# NVIDIA Tegra5 "Ardbeg" development system
#
# Copyright (c) 2014-2015 NVIDIA Corporation.  All rights reserved.
#
# ------------------------------------------------
# Common options for both mobile and automotive
# ------------------------------------------------

## Common product locale
PRODUCT_LOCALES += en_US

## Common packages
$(call inherit-product-if-exists, vendor/nvidia/tegra/secureos/nvsi/nvsi.mk)
$(call inherit-product-if-exists, frameworks/base/data/videos/VideoPackage2.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/android/t124/full.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/core/nvidia-tegra-vendor.mk)
$(call inherit-product-if-exists, vendor/nvidia/tegra/ardbeg/partition-data/factory-ramdisk/factory.mk)
$(call inherit-product-if-exists, device/nvidia/platform/ardbeg/motionq/motionq.mk)

include device/nvidia/common/dalvik/tablet-10in-hdpi-2048-dalvik-heap.mk
include device/nvidia/drivers/touchscreen/maxim/maxim.mk
include device/nvidia/drivers/touchscreen/raydium/raydium.mk
include device/nvidia/drivers/comms/comms.mk
include device/nvidia/common/graphics/graphics.mk

PRODUCT_AAPT_CONFIG += mdpi hdpi xhdpi

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/bootloader/nvbootloader/odm-partner/ardbeg
else
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/odm/ardbeg
endif

PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/PM358_Hynix_2GB_H5TC4G63AFR_RDA_792MHz.cfg:flash_pm358_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/PM359_Hynix_2GB_H5TC4G63AFR_RDA_792MHz.cfg:flash_pm359_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_2GB_H5TC4G63AFR_RDA_408Mhz.cfg:flash_e1780_408.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_2GB_H5TC4G63AFR_RDA_792Mhz.cfg:flash_e1780_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_4GB_H5TC8G63AMR_PBA_792Mhz.cfg:flash_e1780_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1780_Hynix_2GB_H5TC4G63AFR_RDA_924Mhz.cfg:flash_e1780_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_4GB_H5TC8G63AMR_PBA_792Mhz.cfg:flash_e1782_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_2GB_H5TC4G63AFR_RDA_924Mhz.cfg:flash_e1782_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_4GB_H5TC8G63AMR_PBA_792Mhz_spi.cfg:flash_e1782_4gb_792_spi.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1782_Hynix_2GB_H5TC4G63AFR_RDA_924Mhz_spi.cfg:flash_e1782_924_spi.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1792_Elpida_2GB_EDFA164A2MA_JD_F_792MHz.cfg:flash_e1792_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1792_Elpida_2GB_EDFA164A2MA_JD_F_924MHz.cfg:flash_e1792_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1791_Elpida_4GB_edfa232a2ma_792MHz.cfg:flash_e1791_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1791_Elpida_4GB_edfa232a2ma_924MHz.cfg:flash_e1791_4gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1761_Hynix_4GB_H5TC4G63AFR_PBA_792Mhz.cfg:flash_e1761_4gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1761_Hynix_2GB_H5TC4G63AFR_PBA_792Mhz.cfg:flash_e1761_2gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1761_Hynix_2GB_H5TC4G63AFR_RDA_924MHz.cfg:flash_e1761_2gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1922_samsung_pop_3GB_K3QF6F60MM_924MHz.cfg:flash_e1922_3gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/E1923_samsung_pop_3GB_K3QF6F60MM_924MHz.cfg:flash_e1923_3gb_924.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/P2267_Samsung_2GB_K4E8E304EE-EGCF_792MHz.cfg:flash_p2267_2gb_792.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/eks_nokey.dat:eks.dat \
    $(NVFLASH_FILES_PATH)/nvflash/NCT_ardbeg.txt:NCT_ardbeg.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_tn8.txt:nct_tn8.txt \
    $(NVFLASH_FILES_PATH)/nvflash/nct_tn8-ffd.txt:nct_tn8-ffd.txt \
    $(NVFLASH_FILES_PATH)/partition_data/config/nvcamera.conf:system/etc/nvcamera.conf \
    $(NVFLASH_FILES_PATH)/nvflash/common_bct.cfg:bct.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/fuse_write.txt:fuse_write.txt \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_bootsplash.bmp:tn8_bootsplash.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_bootsplash_land.bmp:tn8_bootsplash_land.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/lowbat.bmp:lowbat.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charging.bmp:charging.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charged.bmp:charged.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/fullycharged.bmp:fullycharged.bmp \
    $(NVFLASH_FILES_PATH)/nvflash/charging.png:root/res/images/charger/charging.png \
    $(NVFLASH_FILES_PATH)/nvflash/charged.png:root/res/images/charger/charged.png \
    $(NVFLASH_FILES_PATH)/nvflash/fullycharged.png:root/res/images/charger/fullycharged.png \
    $(NVFLASH_FILES_PATH)/nvflash/nvbdktest_plan.txt:nvbdktest_plan.txt

ifeq ($(APPEND_DTB_TO_KERNEL), true)
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_emmc_full.cfg:flash.cfg
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_spi_sata_full.cfg:flash_spi_sata.cfg
else
ifeq ($(BUILD_NV_CRASHCOUNTER),true)
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_cc_fastboot_dtb_emmc_full.cfg:flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_cc_fastboot_nvtboot_dtb_spi_sata_full.cfg:flash_spi_sata.cfg
else
PRODUCT_COPY_FILES += \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_nct_dtb_emmc_full.cfg:flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_dtb_spi_sata_full.cfg:flash_spi_sata.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/android_fastboot_nvtboot_nct_dtb_emmc_full.cfg:flash_nct.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/laguna_android_fastboot_nvtboot_dtb_emmc_full.cfg:laguna_flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full.cfg:tn8_flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full_signed.cfg:tn8_flash_signed.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full_mfgtest.cfg:tn8diag_flash.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full_mfgtest_signed.cfg:tn8diag_flash_signed.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/ga_android_fastboot_nvtboot_dtb_emmc_full.cfg:ga_android_fastboot_nvtboot_dtb_emmc_full.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/ga_android_fastboot_nvtboot_dtb_emmc_full_signed.cfg:ga_android_fastboot_nvtboot_dtb_emmc_full_signed.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/ga_android_fastboot_nvtboot_dtb_emmc_full_mfgtest.cfg:ga_android_fastboot_nvtboot_dtb_emmc_full_mfgtest.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/ga_android_fastboot_nvtboot_dtb_emmc_full_mfgtest_signed.cfg:ga_android_fastboot_nvtboot_dtb_emmc_full_mfgtest_signed.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/sb_android_fastboot_nvtboot_dtb_emmc_full_signed.cfg:sb_flash_signed.cfg \
    $(NVFLASH_FILES_PATH)/nvflash/sb_android_fastboot_nvtboot_dtb_emmc_full.cfg:sb_flash.cfg
endif
endif

NVFLASH_FILES_PATH :=

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:system/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.hardware.hdmi.cec.xml:system/etc/permissions/android.hardware.hdmi.cec.xml

# OPENGL AEP permission file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:system/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists,frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml)

PRODUCT_COPY_FILES += \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.ardbeg.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.laguna.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.tn8.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.ardbeg_sata.rc \
  $(LOCAL_PATH)/ueventd.ardbeg.rc:root/ueventd.green-arrow.rc \
  $(LOCAL_PATH)/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
  $(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
  $(LOCAL_PATH)/Vendor_0955_Product_7210.kl:system/usr/keylayout/Vendor_0955_Product_7210.kl \
  $(LOCAL_PATH)/Vendor_0955_Product_7212.kl:system/usr/keylayout/Vendor_0955_Product_7212.kl \
  $(LOCAL_PATH)/Vendor_0955_Product_7214.kl:system/usr/keylayout/Vendor_0955_Product_7214.kl \
  $(LOCAL_PATH)/Vendor_0955_Product_7214.idc:system/usr/keylayout/Vendor_0955_Product_7214.idc \
  $(LOCAL_PATH)/../loki/Vendor_28de_Product_1102.kl:system/usr/keylayout/Vendor_28de_Product_1102.kl \
  $(LOCAL_PATH)/../loki/Vendor_28de_Product_1142.kl:system/usr/keylayout/Vendor_28de_Product_1142.kl \
  $(LOCAL_PATH)/../../common/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
  $(LOCAL_PATH)/../../drivers/touchscreen/raydium_ts.idc:system/usr/idc/touch.idc \
  $(LOCAL_PATH)/../../drivers/touchscreen/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
  $(LOCAL_PATH)/../../common/init.ussrd.rc:root/init.ussrd.rc \
  $(LOCAL_PATH)/../../common/ussr_setup.sh:system/bin/ussr_setup.sh \
  $(LOCAL_PATH)/ussrd.conf:system/etc/ussrd.conf \
  $(LOCAL_PATH)/../../common/set_hwui_params.sh:system/bin/set_hwui_params.sh \
  $(LOCAL_PATH)/../../drivers/touchscreen/touch_fusion.idc:system/usr/idc/touch_fusion.idc

# t124 SOC rc files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../common/init.none.rc:root/init.none.rc \
    $(LOCAL_PATH)/../../soc/t124/init.t124.rc:root/init.t124.rc \
    $(LOCAL_PATH)/../../common/init.tegra_sata.rc:root/init.tegra_sata.rc \
    $(LOCAL_PATH)/../../common/init.tegra_emmc.rc:root/init.tegra_emmc.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.tn8:root/fstab.tn8 \
    $(LOCAL_PATH)/fstab.ardbeg:root/fstab.ardbeg

ifeq ($(PLATFORM_VERSION_LETTER_CODE),m)
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/../../common/init.tegra_m.rc:root/init.tegra.rc
else
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/../../common/init.tegra.rc:root/init.tegra.rc
endif

# ardbeg rc files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/power.ardbeg.rc:system/etc/power.ardbeg.rc \
    $(LOCAL_PATH)/power.tn8.rc:system/etc/power.tn8.rc \
    $(LOCAL_PATH)/init.ardbeg.rc:root/init.ardbeg.rc \
    $(LOCAL_PATH)/init.laguna.rc:root/init.laguna.rc \
    $(LOCAL_PATH)/init.tn8.rc:root/init.tn8.rc \
    $(LOCAL_PATH)/init.recovery.tn8.rc:root/init.recovery.tn8.rc \
    $(LOCAL_PATH)/init.tn8_common.rc:root/init.tn8_common.rc \
    $(LOCAL_PATH)/init.tn8_emmc.rc:root/init.tn8_emmc.rc \
    $(LOCAL_PATH)/init.ardbeg_sata.rc:root/init.ardbeg_sata.rc \
    $(LOCAL_PATH)/fstab.laguna:root/fstab.laguna \
    $(LOCAL_PATH)/fstab.ardbeg_sata:root/fstab.ardbeg_sata \
    $(LOCAL_PATH)/init.tn8.usb.rc:root/init.tn8.usb.rc \
    $(LOCAL_PATH)/../../common/init.nv_dev_board.usb.rc:root/init.nv_dev_board.usb.rc \
    $(LOCAL_PATH)/../../common/init.tlk.rc:root/init.tlk.rc \
    $(LOCAL_PATH)/../../common/init.hdcp.rc:root/init.hdcp.rc \
    $(LOCAL_PATH)/init.green-arrow.rc:root/init.green-arrow.rc \
    $(LOCAL_PATH)/init.green-arrow_common.rc:root/init.green-arrow_common.rc \
    $(LOCAL_PATH)/init.green-arrow_emmc.rc:root/init.green-arrow_emmc.rc \
    $(LOCAL_PATH)/init.green-arrow_usb.rc:root/init.green-arrow_usb.rc \
    $(LOCAL_PATH)/fstab.green-arrow:root/fstab.green-arrow

ifeq ($(NO_ROOT_DEVICE),1)
  PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init_no_root_device.rc:root/init.rc
endif

# Face detection model
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/core/include/ft/model_frontalface.xml:system/etc/model_frontal.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../common/cluster:system/bin/cluster \
    $(LOCAL_PATH)/../../common/cluster_get.sh:system/bin/cluster_get.sh \
    $(LOCAL_PATH)/../../common/cluster_set.sh:system/bin/cluster_set.sh \
    $(LOCAL_PATH)/../../common/dcc:system/bin/dcc \
    $(LOCAL_PATH)/../../common/hotplug:system/bin/hotplug \
    $(LOCAL_PATH)/../../common/mount_debugfs.sh:system/bin/mount_debugfs.sh

PRODUCT_COPY_FILES += \
    device/nvidia/platform/ardbeg/nvcms/device.cfg:system/lib/nvcms/device.cfg

PRODUCT_COPY_FILES += \
    device/nvidia/platform/ardbeg/audioConfig_qvoice_icera_pc400.xml:system/etc/audioConfig_qvoice_icera_pc400.xml \
    device/nvidia/platform/ardbeg/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    device/nvidia/platform/ardbeg/nvaudio_fx.xml:system/etc/nvaudio_fx.xml

PRODUCT_COPY_FILES += \
    device/nvidia/platform/ardbeg/enctune.conf:system/etc/enctune.conf

PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/bcm4752_next/glgps_nvidiategraandroid:system/bin/glgps_nvidiaTegra2android \
    vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/bcm4752_next/gps.nvidiategraandroid.so:system/lib/hw/gps.brcm.so

ifneq ($(wildcard vendor/nvidia/tegra/core-private),)
    BCMBINARIES_PATH := vendor/nvidia/tegra/3rdparty/bcmbinaries
else ifneq ($(wildcard vendor/nvidia/tegra/prebuilt/ardbeg/3rdparty/bcmbinaries),)
    BCMBINARIES_PATH := vendor/nvidia/tegra/prebuilt/ardbeg/3rdparty/bcmbinaries
else ifneq ($(wildcard vendor/nvidia/tegra/prebuilt/shieldtablet/3rdparty/bcmbinaries),)
    BCMBINARIES_PATH := vendor/nvidia/tegra/prebuilt/shieldtablet/3rdparty/bcmbinaries
endif

PRODUCT_COPY_FILES += \
    $(BCMBINARIES_PATH)/bcm43241/bluetooth/AB113_BCM43241B0_0012_Azurewave_AW-AH691_TEST.HCD:system/etc/firmware/bcm43241.hcd \
    $(BCMBINARIES_PATH)/bcm43241/wlan/sdio-ag-pno-p2p-proptxstatus-dmatxrc-rxov-pktfilter-keepalive-aoe-vsdb-wapi-wl11d-sr-srvsdb-opt1.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/fw_bcmdhd.bin \
    $(BCMBINARIES_PATH)/bcm43241/wlan/bcm943241ipaagb_p100_hwoob.txt:system/etc/nvram_43241.txt

BCMBINARIES_PATH :=

# Nvidia Miracast
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../common/miracast/com.nvidia.miracast.xml:system/etc/permissions/com.nvidia.miracast.xml

# NvBlit JNI library
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/graphics-partner/android/frameworks/Graphics/com.nvidia.graphics.xml:system/etc/permissions/com.nvidia.graphics.xml

#enable Widevine drm
PRODUCT_PROPERTY_OVERRIDES += drm.service.enabled=true

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_CHARACTERISTICS := tablet

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/../../product/tablet/overlay-tablet/$(PLATFORM_VERSION_LETTER_CODE)
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/../../common/overlay-common/$(PLATFORM_VERSION_LETTER_CODE)

# Enable secure USB debugging in user release build
ifeq ($(TARGET_BUILD_TYPE),release)
ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.adb.secure=1
endif
endif

# Copy public/private tnspecs
ifeq ($(wildcard vendor/nvidia/tegra/tnspec_data/ardbeg/tnspec.json),vendor/nvidia/tegra/tnspec_data/ardbeg/tnspec.json)
PRODUCT_COPY_FILES += vendor/nvidia/tegra/tnspec_data/ardbeg/tnspec.json:tnspec.json
else ifeq ($(wildcard vendor/nvidia/ardbeg/tnspec.json),vendor/nvidia/ardbeg/tnspec.json)
PRODUCT_COPY_FILES += vendor/nvidia/ardbeg/tnspec.json:tnspec.json
else ifeq ($(wildcard $(LOCAL_PATH)/tnspec.json),$(LOCAL_PATH)/tnspec.json)
PRODUCT_COPY_FILES += $(LOCAL_PATH)/tnspec.json:tnspec-public.json
endif

# OTA version definition.  Depends on environment variable NV_OTA_VERSION
# being set prior to building.
ifneq ($(NV_OTA_VERSION),)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.build.version.ota = $(NV_OTA_VERSION)
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.build.version.ota = UN_INIT
endif

