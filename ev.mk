$(call inherit-product, device/amazon/soho/full_soho.mk)

# Inherit some common EV stuff.
$(call inherit-product, vendor/ev/config/common_full_tablet_wifionly.mk)

PRODUCT_RELEASE_NAME := KFSOWI
PRODUCT_NAME := ev_soho

BOOT_ANIMATION_SIZE := xga

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := lectio
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Kindle Fire HD\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
BOOT_ANIMATION_SIZE := xga
