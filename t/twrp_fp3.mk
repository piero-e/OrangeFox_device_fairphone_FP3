# Inherit from these configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/product_launched_with_p.mk)

# Inherit from device configuration
$(call inherit-product, device/fairphone/fp3/device.mk)

# Inherit from TWRP common configuration
$(call inherit-product, vendor/twrp/config/common.mk)

# Import OrangeFox specifics
$(call inherit-product, device/fairphone/fp3/fox_fp3.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := fp3
PRODUCT_BRAND := Fairphone
PRODUCT_MODEL := FP3
PRODUCT_MANUFACTURER := ${PRODUCT_BRAND}
PRODUCT_NAME := twrp_$(PRODUCT_DEVICE)
