$(call inherit-product, device/samsung/hercules/full_hercules.mk)

PRODUCT_RELEASE_NAME := SamsungSGH-T989

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=samsung_hercules BUILD_FINGERPRINT="samsung/SGH-T989/SGH-T989:4.0.3/IML74K/107:user/release-keys" PRIVATE_BUILD_DESC="SGH-T989-user 4.0.3 IML74K 107 release-keys"

TARGET_BOOTANIMATION_NAME := vertical-540x960

PRODUCT_NAME := cm_hercules
PRODUCT_DEVICE := hercules
