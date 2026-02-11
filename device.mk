DEVICE_PATH := device/fairphone/fp3

# Enable developer GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/developer_gsi_keys.mk)

# Configure emulated_storage.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# OTA device(s)
TARGET_OTA_ASSERT_DEVICE := FP3

# Display Size & Density
TARGET_SCREEN_HEIGHT  := 2160
TARGET_SCREEN_WIDTH   := 1080
TARGET_SCREEN_DENSITY := 427

# A/B updater
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    product \
    system \
    vbmeta \
    dtbo \
    product \
    system \
    vbmeta \
    vendor

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
    otapreopt_script \
    update_engine \
    update_verifier \
    update_engine_sideload

PRODUCT_PACKAGES_DEBUG += \
    update_engine_client \
    bootctl

# Boot control HAL
PRODUCT_PACKAGES += \
    bootctrl.msm8953 \
    libgptutils

TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libxml2 \
    vendor.display.config@1.0 \
    vendor.display.config@2.0

# Fairphone OTA keys
PRODUCT_EXTRA_RECOVERY_KEYS += \
    $(DEVICE_PATH)/security/releasekey

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(DEVICE_PATH) \
	vendor/qcom/opensource/commonsys-intf/display

# TWRP - Specifics
TW_THEME                 := portrait_hdpi
TW_DEFAULT_LANGUAGE      := en
TW_USE_TOOLBOX           := true
TW_INCLUDE_NTFS_3G       := true
TW_INCLUDE_RESETPROP     := true
TW_INCLUDE_LIBRESETPROP  := true
TW_MAX_BRIGHTNESS        := 2047
TW_DEFAULT_BRIGHTNESS    := 1024
TW_EXTRA_LANGUAGES       := true
TW_EXCLUDE_APEX          := true
TWRP_INCLUDE_LOGCAT      := true
TW_INCLUDE_PYTHON        := true
TW_SCREEN_BLANK_ON_BOOT  := true
TW_NEW_ION_HEAP          := true
TW_FRAMERATE             := 60
TW_SKIP_ADDITIONAL_FSTAB := true
TW_FORCE_KEYMASTER_VER   := true

TW_CUSTOM_CPU_TEMP_PATH := \
    "/sys/class/thermal/thermal_zone28/temp"

TW_BRIGHTNESS_PATH := \
    /sys/devices/platform/soc/1a00000.qcom,mdss_mdp/1a00000.qcom,mdss_mdp:qcom,mdss_fb_primary/leds/lcd-backlight/brightness

TARGET_USE_CUSTOM_LUN_FILE_PATH := \
    /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file

TW_EXCLUDE_DEFAULT_USB_INIT   := true
TW_USE_SERIALNO_PROPERTY_FOR_DEVICE_ID := true

# TWRP - Crypto
TW_INCLUDE_CRYPTO               := true
TW_INCLUDE_CRYPTO_FBE           := true
BOARD_USES_QCOM_FBE_DECRYPTION  := true

PLATFORM_VERSION                := 99.87.36
PLATFORM_VERSION_LAST_STABLE    := $(PLATFORM_VERSION)

PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH   := $(PLATFORM_SECURITY_PATCH)
BOOT_SECURITY_PATCH     := $(PLATFORM_SECURITY_PATCH)

# Properties for decryption
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm8953 \
    ro.hardware.gatekeeper=msm8953 \
    ro.hardware.bootctrl=msm8953

# Properties for Adoptable Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.crypto.allow_encrypt_override=true \
    ro.crypto.volume.filenames_mode=aes-256-cts

PRODUCT_PROPERTY_OVERRIDES += \
    ro.orangefox.dynamic.build=false
