TARGET_KERNEL_DT_NAME ?= tegra124-tn8

include device/nvidia/platform/ardbeg/BoardConfig.mk

TARGET_DEVICE := shieldtablet
REFERENCE_DEVICE := shieldtablet
TARGET_SYSTEM_PROP := device/nvidia/platform/ardbeg/system.prop

APPFILTERCLASS := com.nvidia.appfilter

# Raydium library version to be used
RAYDIUM_PRODUCT_BRANCH := dev-kernel-shieldtablet8

# OTA
TARGET_RECOVERY_FSTAB := device/nvidia/platform/ardbeg/fstab.tn8

BOARD_SECCOMP_POLICY = device/nvidia/platform/shieldtablet/seccomp/

# Double buffered display surfaces reduce memory usage, but will decrease performance.
# The default is to triple buffer the display surfaces.
BOARD_DISABLE_TRIPLE_BUFFERED_DISPLAY_SURFACES := true

# clear variables that ST8 doesn't need
TARGET_KERNEL_VCM_BUILD :=
TARGET_QUICKBOOT :=
TARGET_QUICKBOOT_PRODUCTION_CONFIG :=
QUICKBOOT_PRODUCTION_CONFIG :=
QUICKBOOT_DEFAULT_CONFIG :=
TARGET_BOOT_MEDIUM :=
QUICKBOOT_TARGET_OS :=
TARGET_QB_FLASH_TOOL :=
