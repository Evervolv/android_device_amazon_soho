$(call inherit-product, device/amazon/soho/full_soho.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

PRODUCT_RELEASE_NAME := KFSOWI
PRODUCT_NAME := cm_soho
