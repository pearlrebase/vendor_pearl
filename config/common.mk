# Copyright (C) 2018 Project dotOS
# Copyright (C) 2018 Superior OS
# Copyright (C) 2019 PearlOS

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


PRODUCT_BRAND ?= PearlOS

include vendor/pearl/config/version.mk

# init file
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/init.pearl.rc:system/etc/init/init.pearl.rc

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/pearl/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/pearl/prebuilt/common/bin/50-base.sh:system/addon.d/50-base.sh \

ifeq ($(AB_OTA_UPDATER),true)
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/backuptool_ab.sh:system/bin/backuptool_ab.sh \
    vendor/pearl/prebuilt/common/bin/backuptool_ab.functions:system/bin/backuptool_ab.functions \
    vendor/pearl/prebuilt/common/bin/backuptool_postinstall.sh:system/bin/backuptool_postinstall.sh
endif

# Bootanimation
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip

# priv-app permissions
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/permissions/privapp-permissions-pearl.xml:system/etc/permissions/privapp-permissions-pearl.xml

# Device Overlays
DEVICE_PACKAGE_OVERLAYS += \
    vendor/pearl/overlay/common \
    vendor/pearl/overlay/dictionaries \
    vendor/pearl/overlay/themes


# EXT4/F2FS format script
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/format.sh:install/bin/format.sh

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/pearl/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Markup libs
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/lib/libsketchology_native.so:system/lib/libsketchology_native.so \
    vendor/pearl/prebuilt/common/lib64/libsketchology_native.so:system/lib64/libsketchology_native.so

# Pixel sysconfig
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/sysconfig/pixel.xml:system/etc/sysconfig/pixel.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner

# pearlOS-specific init file
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/etc/init.local.rc:root/init.pearl.rc

# Bring in camera effects
PRODUCT_COPY_FILES +=  \
    vendor/pearl/prebuilt/common/media/LMspeed_508.emd:system/media/LMspeed_508.emd \
    vendor/pearl/prebuilt/common/media/PFFprec_600.emd:system/media/PFFprec_600.emd

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Fix Dialer
PRODUCT_COPY_FILES +=  \
    vendor/pearl/prebuilt/common/etc/sysconfig/dialer_experience.xml:system/etc/sysconfig/dialer_experience.xml

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# Media
PRODUCT_GENERIC_PROPERTIES += \
    media.recorder.show_manufacturer_and_model=true

# Clean cache
PRODUCT_COPY_FILES += \
    vendor/pearl/prebuilt/common/bin/clean_cache.sh:system/bin/clean_cache.sh

# Recommend using the non debug dexpreopter
USE_DEX2OAT_DEBUG ?= false

# CAF
# Telephony packages
PRODUCT_PACKAGES += \
    ims-ext-common \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

#Telephony
$(call inherit-product, vendor/pearl/config/telephony.mk)

# Pearl_props
$(call inherit-product, vendor/pearl/config/pearl_props.mk)

# Packages
include vendor/pearl/config/packages.mk

#Themes
#include vendor/pearl/themes/common.mk

# Sounds
include vendor/pearl/config/sounds.mk

ifeq ($(TARGET_BUILD_VARIANT),eng)
# Disable ADB authentication
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += ro.adb.secure=0
else
# Enable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif

# Include SDCLANG definitions if it is requested and available
#ifeq ($(HOST_OS),linux)
#    ifneq ($(wildcard vendor/qcom/sdclang-4.0/),)
#        include vendor/pearl/sdclang/sdclang.mk
#    endif
#endif
