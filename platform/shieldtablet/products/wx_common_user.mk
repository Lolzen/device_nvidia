# NVIDIA Tegra5 "Ardbeg" development system
#
# Copyright (c) 2013-2016, NVIDIA Corporation.  All rights reserved.

# shared for all wx_* makefile except diagnostic makefile

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../../common/init.cal.rc:root/init.cal.rc \
    $(LOCAL_PATH)/../../../common/init.ndiscovery.rc:root/init.ndiscovery.rc \

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS),TRUE)
PRODUCT_COPY_FILES += \
frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
$(LOCAL_PATH)/../media_profiles_shieldtablet.xml:system/etc/media_profiles.xml \
$(LOCAL_PATH)/../../ardbeg/media_codecs.xml:system/etc/media_codecs.xml \
$(LOCAL_PATH)/../../ardbeg/media_codecs_performance.xml:system/etc/media_codecs_performance.xml
else
PRODUCT_COPY_FILES += \
frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
$(LOCAL_PATH)/../../ardbeg/media_profiles_noenhance.xml:system/etc/media_profiles.xml \
$(LOCAL_PATH)/../../ardbeg/media_codecs_noenhance.xml:system/etc/media_codecs.xml \
$(LOCAL_PATH)/../../ardbeg/media_codecs_performance.xml:system/etc/media_codecs_performance.xml
endif

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS_AUDIO),TRUE)
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/../../ardbeg/audio_policy.conf:system/etc/audio_policy.conf
else
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/../../ardbeg/audio_policy_noenhance.conf:system/etc/audio_policy.conf
endif

#Thermal HALs
PRODUCT_PACKAGES += \
    thermal.tn8

# Sensor package definition
# PRODUCT_* variables are defined in 'product.mk' file:
include device/nvidia/platform/shieldtablet/sensors-common.mk
PRODUCT_PROPERTY_OVERRIDES	+= ro.hardware.sensors=$(SENSOR_BUILD_VERSION).api_v$(SENSOR_HAL_API).$(SENSOR_FUSION_VERSION).$(SENSOR_HAL_VERSION)
PRODUCT_PACKAGES		+= sensors.$(SENSOR_BUILD_VERSION).api_v$(SENSOR_HAL_API).$(SENSOR_FUSION_VERSION).$(SENSOR_HAL_VERSION)
#SENSOR_BUILD_VERSION		:= default
#SENSOR_HAL_API			:= 1.3
#SENSOR_HAL_VERSION		:= nvs
#HAL_OS_INTERFACE		:= NvsAos.cpp
#SENSOR_FUSION_VENDOR		:= Invensense
#SENSOR_FUSION_VERSION		:= mpl520
#SENSOR_FUSION_BUILD_DIR	:= mpl520.nvs

# camera permission file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:system/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml


PRODUCT_LOCALES := en_US in_ID ca_ES cs_CZ da_DK de_DE en_GB es_ES es_US tl_PH fr_FR hr_HR it_IT lv_LV lt_LT hu_HU nl_NL nb_NO pl_PL pt_BR pt_PT ro_RO sk_SK sl_SI fi_FI sv_SE vi_VN tr_TR el_GR bg_BG ru_RU sr_RS uk_UA iw_IL ar_EG fa_IR th_TH ko_KR zh_CN zh_TW ja_JP

PRODUCT_AAPT_CONFIG += xlarge large

PRODUCT_PROPERTY_OVERRIDES += \
    ro.product.first_api_level=19
