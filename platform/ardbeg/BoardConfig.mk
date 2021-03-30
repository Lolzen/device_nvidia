TARGET_BOARD_PLATFORM := tegra
TARGET_TEGRA_VERSION := t124
TARGET_TEGRA_FAMILY := t12x

# CPU options
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true

BOARD_BUILD_BOOTLOADER := true

TARGET_KERNEL_DT_NAME ?= tegra124-ardbeg

REFERENCE_DEVICE := ardbeg

ifeq ($(NO_ROOT_DEVICE),1)
  TARGET_PROVIDES_INIT_RC := true
else
  TARGET_PROVIDES_INIT_RC := false
endif

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := true

ifeq ($(NV_ANDROID_FRAMEWORK_ENHANCEMENTS_AUDIO), TRUE)
USE_CUSTOM_AUDIO_POLICY := 1
else
USE_CUSTOM_AUDIO_POLICY := 0
endif

BOARD_SUPPORT_NVOICE := true
BOARD_SUPPORT_NVAUDIOFX := true

TARGET_USERIMAGES_USE_EXT4 := true
ifeq ($(TARGET_PRODUCT), sb_na_wf)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
else
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1342177280
endif
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 12799754240
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_SUPPORT_PARAGON_FUSE_UFSD := true

USE_OPENGL_RENDERER := true

# OTA
TARGET_RECOVERY_UPDATER_LIBS += libnvrecoveryupdater
TARGET_RECOVERY_UI_LIB := librecovery_ui_default libfscheck
TARGET_RECOVERY_UPDATER_EXTRA_LIBS += libfs_mgr
TARGET_RECOVERY_FSTAB = device/nvidia/platform/ardbeg/fstab.ardbeg

BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/nvidia/platform/ardbeg/bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

# powerhal
BOARD_USES_POWERHAL := true

# Temp WAR for Android-M
# Wifi related defines
BOARD_WIFI_CHIP             := BCM43241
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_OP_MODE_PARAM   := "/sys/module/bcmdhd/parameters/op_mode"
WIFI_DRIVER_MODULE_ARG      := "iface_name=wlan0"
WIFI_DRIVER_MODULE_NAME     := "bcmdhd"

# GPS
BOARD_GPS_LIBRARIES := true

# Default HDMI mirror mode
# Crop (default) picks closest mode, crops to screen resolution
# Scale picks closest mode, scales to screen resolution (aspect preserved)
# Center picks a mode greater than or equal to the panel size and centers;
#     if no suitable mode is available, reverts to scale
BOARD_HDMI_MIRROR_MODE := Scale

# NVDPS can be enabled when display is set to continuous mode.
BOARD_HAS_NVDPS := true

# Allow this variable to be overridden to n for non-secure OS build
SECURE_OS_BUILD ?= y
ifeq ($(SECURE_OS_BUILD),y)
    SECURE_OS_BUILD := tlk
endif

# Uncomment below line to use Nvidia's GPU-accelerated RS driver by default
# OVERRIDE_RS_DRIVER := libnvRSDriver.so

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
# BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

include device/nvidia/common/BoardConfig.mk

# Use CMU-style config with Nvcms
NVCMS_CMU_USE_CONFIG := false

-include 3rdparty/trustedlogic/samples/hdcp/tegra3/build/arm_android/config.mk

# Icera modem definitions
-include device/nvidia/common/icera/BoardConfigIcera.mk

# Raydium touch definitions
include device/nvidia/drivers/touchscreen/raydium/BoardConfigRaydium.mk

# Maxim touch definitions
include device/nvidia/drivers/touchscreen/maxim/BoardConfigMaxim.mk

# BOARD_WIDEVINE_OEMCRYPTO_LEVEL
# The security level of the content protection provided by the Widevine DRM plugin depends
# on the security capabilities of the underlying hardware platform.
# There are Level 1/2/3. To run HD contents, should be Widevine level 1 security.
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 1

# Dalvik option
DALVIK_ENABLE_DYNAMIC_GC := true

# Using the NCT partition
TARGET_USE_NCT := true
# LBH related defines
# use LBH partition and resources in it
BOARD_HAVE_LBH_SUPPORT := true

#Use tegra health HAL library
BOARD_HAL_STATIC_LIBRARIES := libhealthd.tegra

#Display static images for charging
BOARD_CHARGER_STATIC_IMAGE := true

#Shutdown on charge complete, from charging loop
BOARD_CHARGER_SHUTDOWN_ON_COMPLETE := true

# sepolicy
BOARD_SEPOLICY_DIRS += device/nvidia/platform/ardbeg/sepolicy/

# seccomp policy
BOARD_SECCOMP_POLICY = device/nvidia/platform/ardbeg/seccomp/

# Per-application sizes for shader cache
MAX_EGL_CACHE_SIZE := 128450560
MAX_EGL_CACHE_ENTRY_SIZE := 262144

ifeq ($(wildcard vendor/nvidia/tegra/core-private),vendor/nvidia/tegra/core-private)
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/bootloader/nvbootloader/odm-partner/ardbeg
else
    NVFLASH_FILES_PATH := vendor/nvidia/tegra/odm/ardbeg
endif
NVFLASH_CFG_BASE_FILE := $(NVFLASH_FILES_PATH)/nvflash/tn8_android_fastboot_nvtboot_dtb_emmc_full.cfg
NVFLASH_FILES_PATH :=

# GPU/EMC floor for glcomposer composition
HWC_GLCOMPOSER_CPU_FREQ_MIN := 960000
HWC_GLCOMPOSER_CPU_FREQ_MAX := -1
HWC_GLCOMPOSER_CPU_FREQ_PRIORITY := 15
HWC_GLCOMPOSER_GPU_FREQ_MIN := 324000
HWC_GLCOMPOSER_GPU_FREQ_MAX := -1
HWC_GLCOMPOSER_GPU_FREQ_PRIORITY := 15
HWC_GLCOMPOSER_EMC_FREQ_MIN := 396000
