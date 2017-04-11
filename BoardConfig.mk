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
TARGET_BOARD_PLATFORM := omap4
TARGET_BOARD_PLATFORM_VARIANT := omap4-next
TARGET_BOARD_OMAP_CPU := 4470
TARGET_NEEDS_TEXT_RELOCATIONS := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_VARIANT := cortex-a9
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon

TARGET_BOOTLOADER_BOARD_NAME := bowser
TARGET_UBOOT_DIR := bootable/amazon/soho/u-boot
TARGET_UBOOT_CONFIG := android_soho_config

# Kernel
TARGET_KERNEL_SOURCE := kernel/ti/omap
TARGET_KERNEL_CONFIG := android_soho_defconfig

BOARD_KERNEL_CMDLINE := console=tty0 mem=1G vmalloc=496M init=/init androidboot.console=tty0 androidboot.hardware=bowser androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_KERNEL_CUSTOM_TOOLCHAIN := arm-eabi-4.8

# External SGX Module
SGX_MODULES:
	make clean -C $(HARDWARE_TI_OMAP4_BASE)/pvr-source/eurasiacon/build/linux2/omap4430_android
	cp $(TARGET_KERNEL_SOURCE)/drivers/video/omap2/omapfb/omapfb.h $(KERNEL_OUT)/drivers/video/omap2/omapfb/omapfb.h
	make -j8 -C $(HARDWARE_TI_OMAP4_BASE)/pvr-source/eurasiacon/build/linux2/omap4430_android \
			ARCH=arm $(if $(ARM_CROSS_COMPILE),$(ARM_CROSS_COMPILE),$(KERNEL_CROSS_COMPILE)) \
			KERNELDIR=$(KERNEL_OUT) TARGET_PRODUCT="blaze_tablet" BUILD=release TARGET_SGX=544sc PLATFORM_VERSION=4.0
	mv $(KERNEL_OUT)/../../target/kbuild/pvrsrvkm_sgx544_112.ko $(KERNEL_MODULES_OUT)
	$(if $(ARM_EABI_TOOLCHAIN),$(ARM_EABI_TOOLCHAIN)/arm-eabi-strip, \
			$(KERNEL_TOOLCHAIN_PATH)strip) --strip-unneeded \
			$(KERNEL_MODULES_OUT)/pvrsrvkm_sgx544_112.ko

TARGET_KERNEL_MODULES += SGX_MODULES

# eMMC
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 6835024
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1302069248
BOARD_HAS_NO_REAL_SDCARD := true

# Exploit
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/exploit.mk

BOARD_CANT_BUILD_RECOVERY_FROM_BOOT_PATCH := true

# TWRP
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.bowser
DEVICE_RESOLUTION := 800x1280
TW_SCREEN_BLANK_ON_BOOT := true
TW_NO_CPU_TEMP := true
TW_EXCLUDE_SUPERSU := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true

# SGX
#COMMON_GLOBAL_CFLAGS += -DAMAZON_LOG
BOARD_EGL_CFG := $(DEVICE_PATH)/egl.cfg
USE_OPENGL_RENDERER := true

# Wireless
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_bcmdhd
WIFI_DRIVER_FW_PATH_PARAM := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA   := "/system/vendor/firmware/fw_bcm4330.bin"
WIFI_DRIVER_FW_PATH_AP    := "/system/vendor/firmware/fw_bcm4330_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P   := "/system/vendor/firmware/fw_bcm4330_p2p.bin"
