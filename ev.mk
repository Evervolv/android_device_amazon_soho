$(call inherit-product, device/amazon/soho/full_soho.mk)

# Inherit some common EV stuff.
$(call inherit-product, vendor/ev/config/common_full_tablet_wifionly.mk)

PRODUCT_RELEASE_NAME := KFSOWI
PRODUCT_NAME := ev_soho
PRODUCT_BOARD := soho
PRODUCT_DEVICE := soho
PRODUCT_BRAND := Amazon
PRODUCT_MANUFACTURER := Amazon
PRODUCT_MODEL := Kindle Fire HD (3rd Generation)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=soho \
    BUILD_FINGERPRINT="amazon/amazon_soho/soho:6.0/MRA58K/2256973:user/release-keys" \
    PRIVATE_BUILD_DESC="soho-user 6.0 MRA58K 2256973 release-keys" \
    BUILD_NUMBER=228551

# Set up the product codename, build version & MOTD.
PRODUCT_CODENAME := lectio
PRODUCT_VERSION_DEVICE_SPECIFIC := p1

PRODUCT_MOTD :="\n\n\n--------------------MESSAGE---------------------\nThank you for choosing Evervolv for your Kindle Fire HD\nPlease visit us at \#evervolv on irc.freenode.net\nFollow @preludedrew for the latest Evervolv updates\nGet the latest rom at evervolv.com\n------------------------------------------------\n"

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
BOOT_ANIMATION_SIZE := xga
