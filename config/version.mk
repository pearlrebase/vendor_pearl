# Versioning System
PEARL_BASE_VERSION = v4.0

ifndef PEARL_BUILD_TYPE
    PEARL_BUILD_TYPE := Unofficial
endif

# Only include PEARL OTA for official builds
ifeq ($(filter-out Official,$(PEARL_BUILD_TYPE)),)
#    PRODUCT_PACKAGES += \
#        PearlOTA
endif

TARGET_PRODUCT_SHORT := $(subst pearl_,,$(PEARL_BUILD_TYPE))

# Set all versions
DATE := $(shell date -u +%Y%m%d)
PEARL_BASE_SET_VERSION = 4.0
PEARL_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
PEARL_BUILD_VERSION := PearlOS-$(PEARL_BASE_VERSION)-$(DATE)-$(PEARL_BUILD_TYPE)
PEARL_DATE := $(shell date -u +%d-%m-%Y)
PEARL_MOD_VERSION := PearlOS-$(PEARL_BASE_VERSION)-$(PEARL_BUILD_DATE)-$(PEARL_BUILD_TYPE)
PEARL_VERSION := PearlOS-$(PEARL_BASE_VERSION)-$(DATE)-$(PEARL_BUILD)-$(PEARL_BUILD_TYPE)
ROM_FINGERPRINT := PearlOS/$(PEARL_BASE_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(PEARL_BUILD_DATE)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.pearl.base.version=$(PEARL_BASE_SET_VERSION) \
    ro.pearl.build.date=$(PEARL_DATE) \
    ro.pearl.build.version=$(PEARL_BUILD_VERSION) \
    ro.pearl.fingerprint=$(ROM_FINGERPRINT) \
    ro.pearl.releasetype=$(PEARL_BUILD_TYPE) \
    ro.pearl.version=$(PEARL_VERSION) \
    ro.mod.version=$(PEARL_MOD_VERSION)
