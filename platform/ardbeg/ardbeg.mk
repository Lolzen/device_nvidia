# NVIDIA Tegra5 "Ardbeg" development system
#
# Copyright (c) 2013 NVIDIA Corporation.  All rights reserved.

## All essential packages
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, device/nvidia/platform/ardbeg/device.mk)
$(call inherit-product, device/nvidia/platform/ardbeg/device-norrin.mk)
$(call inherit-product-if-exists, frameworks/base/data/sounds/AudioPackage3.mk)

## Thse are default settings, it gets changed as per sku manifest properties
PRODUCT_NAME := ardbeg
PRODUCT_DEVICE := ardbeg
PRODUCT_MODEL := ardbeg
PRODUCT_MANUFACTURER := NVIDIA
PRODUCT_BRAND := nvidia

# WAR for android M
ifeq ($(PLATFORM_IS_AFTER_LOLLIPOP),1)
ifeq ($(PLATFORM_IS_AFTER_M),)
HOST_PREFER_32_BIT := true
endif
endif

## Icera modem integration
$(call inherit-product-if-exists, $(LOCAL_PATH)/../../common/icera/icera-modules.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/../../common/icera/firmware/nvidia-e1729-tn8l/fw-cpy-nvidia-e1729-tn8l-do.mk)
$(call inherit-product-if-exists, $(LOCAL_PATH)/../../common/icera/firmware/nvidia-e1729-tn8l/fw-cpy-nvidia-e1729-tn8l-voice.mk)
PRODUCT_COPY_FILES += \
        $(call add-to-product-copy-files-if-exists, $(LOCAL_PATH)/../../drivers/comms/init.icera.rc:root/init.icera.rc) \
        $(call add-to-product-copy-files-if-exists, vendor/nvidia/tegra/icera/ril/icera-util/ril_atc.usb.config:system/etc/ril_atc.config)

## enable Wifi Access Point monitor (needed for two-step SAR backoff)
PRODUCT_PACKAGES += icera-wifiAPNotifier

## SKU specific overrides
include frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/../../product/phone/overlay-phone/$(PLATFORM_VERSION_LETTER_CODE)
PRODUCT_PROPERTY_OVERRIDES += ro.modem.vc=1

# Sensor package definition
# PRODUCT_* variables are defined in 'product.mk' file:
include device/nvidia/platform/ardbeg/sensors-common.mk
PRODUCT_PROPERTY_OVERRIDES	+= ro.hardware.sensors=$(SENSOR_BUILD_VERSION).api_v$(SENSOR_HAL_API).$(SENSOR_FUSION_VERSION).$(SENSOR_HAL_VERSION)
PRODUCT_PACKAGES		+= sensors.$(SENSOR_BUILD_VERSION).api_v$(SENSOR_HAL_API).$(SENSOR_FUSION_VERSION).$(SENSOR_HAL_VERSION)
#SENSOR_BUILD_VERSION		:= default
#SENSOR_HAL_API			:= 1.3
#SENSOR_HAL_VERSION		:= nvs
#HAL_OS_INTERFACE		:= NvsAos.cpp
#SENSOR_FUSION_VENDOR		:= Invensense
#SENSOR_FUSION_VERSION		:= mpl520
#SENSOR_FUSION_BUILD_DIR	:= mpl520.nvs


PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml


ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
PRODUCT_COPY_FILES += \
   frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
   frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
   $(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml \
   $(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml
else
PRODUCT_COPY_FILES += \
   frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
   frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
   $(LOCAL_PATH)/media_profiles_noenhance.xml:system/etc/media_profiles.xml \
   $(LOCAL_PATH)/media_codecs_noenhance.xml:system/etc/media_codecs.xml
endif

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS_AUDIO),TRUE)
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/audio_policy_noenhance.conf:system/etc/audio_policy.conf
endif

## GPS configuration
PRODUCT_COPY_FILES += \
    vendor/nvidia/tegra/3rdparty/broadcom/gps/bin/gpsconfig-ardbeg.xml:system/etc/gps/gpsconfig.xml

## Barometer sensor
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml

## Sensor/Touch calibration init.xx.rc file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../common/init.cal_fct.rc:root/init.cal.rc

# NFC packages
PRODUCT_PACKAGES += \
  libnfc \
  libnfc_jni \
  Nfc \
  Tag
