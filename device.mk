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

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board-specific files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab.bowser:root/fstab.bowser \
	$(LOCAL_PATH)/init.bowser.rc:root/init.bowser.rc \
	$(LOCAL_PATH)/ueventd.bowser.rc:root/ueventd.bowser.rc

# OMAP4
$(call inherit-product, hardware/ti/omap4/omap4.mk)
PRODUCT_VENDOR_KERNEL_HEADERS := $(TARGET_KERNEL_SOURCE)/include

# Wireless
PRODUCT_PACKAGES += \
	dhcpd.conf \
	libwpa_client \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

-include hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk
#
# Bug fixes
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.app_widgets.xml:system/etc/permissions/android.software.app_widgets.xml

# Configuration
PRODUCT_CHARACTERISTICS := tablet,nosdcard
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=240
