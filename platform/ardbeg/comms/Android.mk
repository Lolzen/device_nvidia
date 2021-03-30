# Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
#
#  NVIDIA CORPORATION and its licensors retain all intellectual property
#  and proprietary rights in and to this software, related documentation
#  and any modifications thereto.  Any use, reproduction, disclosure or
#  distribution of this software and related documentation without an express
#  license agreement from NVIDIA CORPORATION is strictly prohibited.
#

#
# NFC symlink creator
#

LOCAL_PATH := $(call my-dir)

include $(NVIDIA_DEFAULTS)

LOCAL_MODULE         := nfc.symlink
LOCAL_MODULE_CLASS   := FAKE
LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT)/etc/permissions

PRIVATE_NFC_SYMLINK := /data/nfc/nfc.xml
PRIVATE_SYMLINK := $(TARGET_OUT)/etc/permissions/android.hardware.nfc.xml

LOCAL_POST_INSTALL_CMD := \
    rm -rf $(LOCAL_MODULE_PATH)/$(LOCAL_MODULE); \
    ln -sf $(PRIVATE_NFC_SYMLINK) $(PRIVATE_SYMLINK)

include $(NVIDIA_BASE)
include $(BUILD_SYSTEM)/base_rules.mk
include $(NVIDIA_POST)

$(LOCAL_BUILT_MODULE):
	@echo "Symlink: $(PRIVATE_SYMLINK) -> $(PRIVATE_NFC_SYMLINK)"
	$(hide) mkdir -p $(dir $@)
	$(hide) rm -rf $@
	$(hide) touch $@
