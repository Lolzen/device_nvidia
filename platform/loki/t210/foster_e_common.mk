# NVIDIA Tegra7 "foster_e" development system
#
# Copyright (c) 2014-2016, NVIDIA Corporation.  All rights reserved.

## This is the file that is common for all Foster_e skus(foster_e_base, foster_e_hdd).

ifeq ($(PLATFORM_IS_AFTER_M),)
HOST_PREFER_32_BIT := true
endif


PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_profiles_foster_e.xml:system/etc/media_profiles.xml

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS_AUDIO),TRUE)
PRODUCT_COPY_FILES += \
    device/nvidia/platform/loki/t210/audio_policy_foster.conf:system/etc/audio_policy.conf

PRODUCT_PACKAGES += \
    NvPeripheralService
else
PRODUCT_COPY_FILES += \
    device/nvidia/platform/t210/audio_policy_noenhance.conf:system/etc/audio_policy.conf
endif

PRODUCT_COPY_FILES += \
    device/nvidia/platform/loki/t210/nvaudio_conf_foster.xml:system/etc/nvaudio_conf.xml \
    device/nvidia/platform/loki/t210/audio_effects.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.conf \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

PRODUCT_COPY_FILES += device/nvidia/tegraflash/t210/rp2_binaries/rp2_disable_frp.bin:rp2.bin
ifneq (,$(filter $(TARGET_BUILD_VARIANT),userdebug eng))
    ifneq ($(wildcard vendor/nvidia/loki/utils/otadiff),)
        PRODUCT_PACKAGES += \
	    otadiff_core \
	    otadiff_compare \
	    otadiff_config \
	    otadiff_device_whisperer \
	    otadiff_io \
	    otadiff.cfg \
	    otadiff.whitelist.cfg \
	    README \
	    split_bootimg \
	    extract-ikconfig
    endif
endif

# Genesys IO board with USB hub firmware bin for foster
LOCAL_FOSTER_GENESYS_FW_PATH=vendor/nvidia/foster/firmware/P1963-Genesys
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_FOSTER_GENESYS_FW_PATH)/GL3521-latest.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/GL3521_foster.bin) \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_FOSTER_GENESYS_FW_PATH)/GL_latest.ini:$(TARGET_COPY_OUT_VENDOR)/firmware/GL_SS_HUB_ISP_foster.ini) \
    $(call add-to-product-copy-files-if-exists, vendor/nvidia/loki/utils/genesysload/geupdate.sh:$(TARGET_COPY_OUT_VENDOR)/bin/geupdate.sh)

PRODUCT_PACKAGES += \
    libtegra_sata_hal \
    rp3_image \
    genesys_hub_update \
    NvAccStService \
    sil_load \
    BluetoothMidiService

TARGET_SYSTEM_PROP    += device/nvidia/platform/loki/t210/system.prop

HDCP_POLICY_CHECK := true

# FW check
LOCAL_FW_CHECK_TOOL_PATH=device/nvidia/common/fwcheck
LOCAL_FW_XML_PATH=vendor/nvidia/loki/skus
PRODUCT_COPY_FILES += $(call add-to-product-copy-files-if-exists, $(LOCAL_FW_XML_PATH)/fw_version.xml:$(TARGET_COPY_OUT_VENDOR)/etc/fw_version.xml) \
	$(call add-to-product-copy-files-if-exists, $(LOCAL_FW_CHECK_TOOL_PATH)/fw_check.py:fw_check.py)

PRODUCT_COPY_FILES += \
    device/nvidia/platform/loki/gpio_ir_recv.idc:system/usr/idc/gpio_ir_recv.idc

# Foster LED Firmware bin
LOCAL_FOSTER_LED_FW_PATH=vendor/nvidia/foster/firmware/P1961-Cypress/ReleasedHexFiles/Application
PRODUCT_COPY_FILES += \
    $(call add-to-product-copy-files-if-exists, $(LOCAL_FOSTER_LED_FW_PATH)/cypress_latest.cyacd:$(TARGET_COPY_OUT_VENDOR)/firmware/psoc_foster_fw.cyacd)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hdmi.wake_on_hotplug = 0

# Sensor package definition
SENSOR_BUILD_VERSION		:= default
SENSOR_HAL_API			:= 1.4
SENSOR_HAL_VERSION		:= nvs
HAL_OS_INTERFACE		:= NvsAos.cpp
SENSOR_FUSION_VENDOR		:=
SENSOR_FUSION_VERSION		:= no_fusion
SENSOR_FUSION_BUILD_DIR		:= no_fusion.nvs
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.sensors=$(SENSOR_BUILD_VERSION).api_v$(SENSOR_HAL_API).$(SENSOR_FUSION_VERSION).$(SENSOR_HAL_VERSION)
PRODUCT_PACKAGES += \
    sensors.$(SENSOR_BUILD_VERSION).api_v$(SENSOR_HAL_API).$(SENSOR_FUSION_VERSION).$(SENSOR_HAL_VERSION)

# Wi-Fi country code system properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.factory.wifi=/factory/wifi_config \
    ro.factory.wifi.lbs=true

# Define Netflix nrdp properties
PRODUCT_COPY_FILES += device/nvidia/platform/loki/t210/nrdp.modelgroup.xml:system/etc/permissions/nrdp.modelgroup.xml

# nDiscovery
PRODUCT_COPY_FILES += $(LOCAL_PATH)/../../../common/init.ndiscovery.rc:root/init.ndiscovery.rc

PRODUCT_PROPERTY_OVERRIDES += \
        ro.nrdp.modelgroup=SHIELDANDROIDTV

PRODUCT_PROPERTY_OVERRIDES += \
        ro.nrdp.audio.otfs=true

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=21

# Test binaries for FactorySysChecker
PRODUCT_PACKAGES += \
    check_eks \
    dx_provTest \
    eks_hdcprx \
    testapp_vrr \
    test_vudu
    #tlkstoragedemo_client

# Android N enabled DEXPREOPT by default, but we just want it for user image to keep consistent behavior with M
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),user)
    WITH_DEXPREOPT := false
  endif
endif

# Get rid of dex preoptimization
FOSTER_E_DONT_DEXPREOPT_MODULES := \
    AtvRemoteService
$(call add-product-dex-preopt-module-config,$(FOSTER_E_DONT_DEXPREOPT_MODULES),disable)

