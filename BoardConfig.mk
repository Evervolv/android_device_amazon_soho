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

# TI OMAP4470
TARGET_BOARD_PLATFORM := omap4
TARGET_BOARD_PLATFORM_VARIANT := omap4-next
TARGET_BOARD_OMAP_CPU := 4470

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

# Kernel
TARGET_KERNEL_SOURCE := kernel/amazon/soho
TARGET_KERNEL_CONFIG := android_soho_defconfig

BOARD_KERNEL_CMDLINE := console=tty0 mem=1G vmalloc=496M init=/init androidboot.console=tty0 androidboot.hardware=bowser androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048

# eMMC
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/custombootimg.mk
BOARD_BOOTIMAGE_PARTITION_SIZE := 6518784
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1302069248
BOARD_FLASH_BLOCK_SIZE := 512
BOARD_HAS_NO_REAL_SDCARD := true

# TWRP
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab.bowser
DEVICE_RESOLUTION := 800x1280
TW_SCREEN_BLANK_ON_BOOT := true

# SGX
COMMON_GLOBAL_CFLAGS += -DAMAZON_LOG
BOARD_EGL_CFG := $(DEVICE_PATH)/egl.cfg
USE_OPENGL_RENDERER := true

# Wireless
BOARD_WLAN_DEVICE := bcmdhd
WPA_SUPPLICANT_VERSION := VER_0_8_X

BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd

WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA   := "/system/vendor/firmware/fw_bcm4330.bin"
WIFI_DRIVER_FW_PATH_AP    := "/system/vendor/firmware/fw_bcm4330_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P   := "/system/vendor/firmware/fw_bcm4330_p2p.bin"

# inherit from the proprietary version
-include vendor/amazon/soho/BoardConfigVendor.mk
