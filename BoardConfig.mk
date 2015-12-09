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

# ARM
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_SMP := true

# Kernel
TARGET_KERNEL_SOURCE := kernel/amazon/soho
TARGET_KERNEL_CONFIG := android_soho_defconfig

BOARD_KERNEL_CMDLINE := console=tty0 mem=1G vmalloc=496M init=/init androidboot.console=tty0 androidboot.hardware=bowser androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048

# Boot
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/custombootimg.mk
BOARD_BOOTIMAGE_PARTITION_SIZE := 6518784
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1302069248
BOARD_FLASH_BLOCK_SIZE := 512

# TWRP
DEVICE_RESOLUTION := 800x1280
TW_SCREEN_BLANK_ON_BOOT := true

# inherit from the proprietary version
-include vendor/amazon/soho/BoardConfigVendor.mk
