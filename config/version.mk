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

export PEARL_BASE_VERSION
export PEARL_BUILD_VERSION
export PEARL_BUILD_TYPE
export PEARL_DATE
export PEARL_VERSION
export ROM_FINGERPRINT
