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
#

# call the proprietary setup
$(call inherit-product-if-exists, vendor/amazon/soho/soho-vendor.mk)
$(call inherit-product-if-exists, vendor/amazon/omap4-common/omap4-common-vendor-544_112.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board-specific files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/boot/u-boot.bin:u-boot.bin

# OMAP4
$(call inherit-product-if-exists, device/amazon/bowser-common/common.mk)
PRODUCT_VENDOR_KERNEL_HEADERS := $(LOCAL_PATH)/kernel-headers

# To be inline with Build repo
PRODUCT_COPY_FILES += \
	device/amazon/soho/install-recovery.sh:$(PRODUCT_OUT)/ota_temp/SYSTEM/bin/install-recovery.sh

# Configuration
PRODUCT_CHARACTERISTICS := tablet,nosdcard

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.bowser \
    init.bowser.rc \
    init.bowser.usb.rc \
    ueventd.bowser.rc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240 \
	ro.config.low_ram=true \
	ro.ksm.default=1 \
	dalvik.vm.heapstartsize=5m \
	dalvik.vm.heapgrowthlimit=96m \
	dalvik.vm.heapsize=256m \
	dalvik.vm.heaptargetutilization=0.75 \
	dalvik.vm.heapminfree=512k \
	dalvik.vm.heapmaxfree=2m

# no RIL
PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=1 \
	ro.radio.use-ppp=no \
	ro.config.nocheckin=yes \
	ro.radio.noril=1 \
	ro.carrier=wifi-only \
	persist.radio.noril=1

#wifi
PRODUCT_PACKAGES += \
	libwifi-hal-bcm \
	lib_driver_cmd_bcmdhd

-include hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

