#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PATH := device/amazon/soho

-include device/amazon/bowser-common/BoardConfigCommon.mk

BLOCK_BASED_OTA := false

# TI OMAP4470
TARGET_BOARD_OMAP_CPU := 4470

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bowser
TARGET_UBOOT_DIR := bootable/amazon/soho/u-boot
TARGET_UBOOT_CONFIG := soho_config

# Compatibilty
TARGET_NEEDS_TEXT_RELOCATIONS := true

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/boot.mk
BOARD_KERNEL_CMDLINE := console=tty0 mem=1G vmalloc=496M init=/init androidboot.console=tty0 androidboot.hardware=bowser
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_KERNEL_SOURCE := kernel/ti/omap
TARGET_KERNEL_CONFIG := android_soho_defconfig
TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8

ifneq (,$(strip $(wildcard $(TARGET_KERNEL_SOURCE)/drivers/gpu/ion/ion_page_pool.c)))
export BOARD_USE_TI_LIBION := false
endif

# eMMC
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 6835024
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1302069248
BOARD_HAS_NO_REAL_SDCARD := true

# TWRP
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.bowser
DEVICE_RESOLUTION := 800x1280
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_CPU_TEMP := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
