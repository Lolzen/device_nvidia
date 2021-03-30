# Copyright (c) 2014-2016, NVIDIA Corporation.  All rights reserved.
#
# Shield Tablet 8 common makefile

## All essential packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/nvidia/platform/ardbeg/device.mk)

## Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_DEVICE := shieldtablet
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

# WAR for android M
ifeq ($(PLATFORM_IS_AFTER_LOLLIPOP),1)
ifeq ($(PLATFORM_IS_AFTER_M),)
HOST_PREFER_32_BIT := true
endif
endif

WITH_DEXPREOPT := false

## Fury LBH  feature
-include vendor/nvidia/fury/tools/lbh/fury.mk

# _product_private_path is cleared in wx_ product makefiles
_product_private_path := vendor/nvidia/shieldtablet

# Wi-Fi country code system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.factory.wifi.lbs=true
