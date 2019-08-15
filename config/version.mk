# Copyright (C) 2018 Project dotOS
# Copyright (C) 2018 Superior OS Project
# Copyright (C) 2018 PearlOS Project
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Pearl OS Versioning :
PEARL_MOD_VERSION = v4.0


ifndef PEARL_BUILD_TYPE
    PEARL_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

ifeq ($(PEARL_OFFICIAL), true)
   LIST = $(shell curl -s https://raw.githubusercontent.com/PearlOS/android_vendor_pearl/pie/pearl.devices)
   FOUND_DEVICE =  $(filter $(CURRENT_DEVICE), $(LIST))
    ifeq ($(FOUND_DEVICE),$(CURRENT_DEVICE))
      IS_OFFICIAL=true
      PEARL_BUILD_TYPE := OFFICIAL

PRODUCT_PACKAGES += \
    Updater

    endif
    ifneq ($(IS_OFFICIAL), true)
       PEARL_BUILD_TYPE := UNOFFICIAL
       $(error Device is not official "$(FOUND)")
    endif

PRODUCT_GENERIC_PROPERTIES += \
    persist.ota.romname=$(TARGET_PRODUCT) \
    persist.ota.version=$(shell date +%Y%m%d) \

persist.ota.manifest=https://raw.githubusercontent.com/PearlOS/ota/pie/$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3).xml
endif

TARGET_PRODUCT_SHORT := $(subst pearl_,,$(CUSTOM_BUILD))

PEARL_VERSION := PearlOS-$(PEARL_MOD_VERSION)-$(CURRENT_DEVICE)-$(PEARL_BUILD_TYPE)-$(CUSTOM_BUILD_DATE)

PEARL_FINGERPRINT := PearlOS/$(PEARL_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.pearl.version=$(PEARL_VERSION) \
  ro.pearl.releasetype=$(PEARL_BUILD_TYPE) \
  ro.modversion=$(PEARL_MOD_VERSION)

PEARL_DISPLAY_VERSION := PearlOS-$(PEARL_MOD_VERSION)-$(PEARL_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.pearl.display.version=$(PEARL_DISPLAY_VERSION)\
  ro.pearl.fingerprint=$(PEARL_FINGERPRINT)
