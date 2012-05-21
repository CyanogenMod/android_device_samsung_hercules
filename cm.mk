$(call inherit-product, device/samsung/hercules/full_hercules.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-T989 TARGET_DEVICE=SGH-T989 BUILD_FINGERPRINT="samsung/SGH-T989/SGH-T989:4.0.3/IML74K/UVLC8:user/release-keys" PRIVATE_BUILD_DESC="SGH-T989-user 4.0.3 IML74K UVLC8 release-keys"

TARGET_BOOTANIMATION_NAME := vertical-480x800

PRODUCT_NAME := cm_hercules
PRODUCT_DEVICE := hercules
