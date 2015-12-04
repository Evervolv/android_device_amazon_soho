## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := soho

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/amazon/soho/full_soho.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := soho
PRODUCT_NAME := cm_soho
PRODUCT_BRAND := amazon
PRODUCT_MODEL := soho
PRODUCT_MANUFACTURER := amazon
