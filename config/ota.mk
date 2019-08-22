ifneq ($(IS_GENERIC_SYSTEM_IMAGE), true)
ifeq ($(PEARL_BUILD_TYPE), OFFICIAL)

PEARL_OTA_VERSION_CODE := pie

CUSTOM_PROPERTIES += \
    org.pearl.ota.version_code=$(PEARL_OTA_VERSION_CODE) \
    sys.ota.disable_uncrypt=1

PRODUCT_PACKAGES += \
    Updates

PRODUCT_COPY_FILES += \
    vendor/pearl/config/permissions/org.pearl.ota.xml:system/etc/permissions/org.pearl.ota.xml

endif
endif
