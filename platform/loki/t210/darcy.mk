# NVIDIA Tegra 210 "darcy" development system
#
# Copyright (c) 2015-2016, NVIDIA Corporation.  All rights reserved.

## All essential packages
$(call inherit-product, device/nvidia/soc/t210/device-t210.mk)
$(call inherit-product, device/nvidia/product/tv/device.mk)
$(call inherit-product, device/nvidia/platform/t210/device.mk)

## Install GMS if available
$(call inherit-product-if-exists, 3rdparty/google/gms-apps/tv/64/products/gms.mk)
PRODUCT_PROPERTY_OVERRIDES += \
        ro.com.google.clientidbase=android-nvidia

## Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_NAME := darcy
PRODUCT_DEVICE := t210
PRODUCT_MODEL := darcy
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=320

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=23

ifeq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PROPERTY_OVERRIDES += persist.convertible.usb.mode=host
else
PRODUCT_PROPERTY_OVERRIDES += persist.convertible.usb.mode=device
endif

# Add HDMI CRC Test for userdebug build
ifeq ($(TARGET_BUILD_VARIANT),userdebug)
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/apps/diagsuite/bin/HDMI/random_1080p.bmp:vendor/tests/HDMI/random_1080p.bmp) \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/apps/diagsuite/bin/HDMI/random_2160p.bmp:vendor/tests/HDMI/random_2160p.bmp) \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/apps/diagsuite/bin/release/factory_flow_script/diag_menu.py:hdmi_crc_test.py) \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/apps/diagsuite/bin/release/factory_flow_script/station_xml/tests_station_parse.xml:station_parse.xml) \
    $(call find-copy-subdir-files,*,vendor/nvidia/tegra/apps/diagsuite/bin/release/factory_flow_script,factory_flow_script)

PRODUCT_PACKAGES += \
    hdmi_tester \
    hdmi_crc
endif

## Values of PRODUCT_NAME and PRODUCT_DEVICE are mangeled before it can be
## used because of call to inherits, store their values to use later in this
## file below
_product_name := $(strip $(PRODUCT_NAME))
_product_device := $(strip $(PRODUCT_DEVICE))

# This flag is required in order to differentiate between platforms that use
# Keymaster1.0 vs the legacy keymaster 0.3 service.
USES_KEYMASTER_1 := true

## Copy gpsconfig file
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/gpsconfig-wf-t210ref.xml:system/etc/gps/gpsconfig.xml)

PRODUCT_PACKAGES += \
    PlexMediaServer \
    NvXtraMediaV \
    NvIgnition

#SHIELD user registration
PRODUCT_PACKAGES += \
    NvRegistration

## common for mp and diag images, for a single sku.
$(call inherit-product, $(LOCAL_PATH)/darcy_common.mk)

## Factory scripts, common for mp images, among multiple skus.
$(call inherit-product-if-exists, vendor/nvidia/diag/common/mp_common.mk)

## common apps for all skus
$(call inherit-product-if-exists, vendor/nvidia/loki/skus/darcy.mk)
$(call inherit-product-if-exists, vendor/nvidia/loki/skus/foster_common.mk)

## nvidia apps for this sku
$(call inherit-product-if-exists, vendor/nvidia/$(_product_device)/skus/$(_product_name).mk)

## 3rd-party apps for this sku
$(call inherit-product-if-exists, 3rdparty/applications/prebuilt/common/$(_product_name).mk)
$(call inherit-product-if-exists, vendor/nvidia/loki/skus/tegrazone_next.mk)

## eks2 data blob
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, device/nvidia/platform/t210/eks2/eks2_darcy.dat:vendor/app/eks2/eks2.dat)

## Clean local variables
_product_name :=
_product_device :=

