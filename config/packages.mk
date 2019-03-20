PRODUCT_PACKAGES += \
    Lawnchair

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

# Accent and Base packages
PRODUCT_PACKAGES += \
    AmberTheme \
    BlueTheme \
    CyanTheme \
    DeepOrangeTheme \
    DeepPurpleTheme \
    GreenTheme \
    IndigoTheme \
    LightBlueTheme \
    LightGreenTheme \
    LimeTheme \
    OrangeTheme \
    PinkTheme \
    PixelBaseTheme \
    PixelTheme \
    PurpleTheme \
    RedTheme \
    StockBaseTheme \
    StockFixedBaseTheme \
    StockTheme \
    YellowTheme \
    MintGreenTheme

# Dark/BlackUI Packages
PRODUCT_PACKAGES += \
    GBoardDarkTheme \
    SettingsBlackTheme \
    SettingsDarkTheme \
    SystemBlackTheme \
    SystemDarkTheme \
    SystemSettingsIconTint \
	SysuiQsBlackTheme \
    SysuiQsDarkTheme

# Settings Icon Tint
PRODUCT_PACKAGES += \
    SettingsIconTint

# Lawnchair Default Configuration
PRODUCT_PACKAGES += \
    LawnConf

PRODUCT_COPY_FILES += \
   vendor/pearl/prebuilt/common/fonts/GoogleSans-Regular.ttf:system/fonts/GoogleSans-Regular.ttf \
   vendor/pearl/prebuilt/common/fonts/GoogleSans-Medium.ttf:system/fonts/GoogleSans-Medium.ttf \
   vendor/pearl/prebuilt/common/fonts/GoogleSans-MediumItalic.ttf:system/fonts/GoogleSans-MediumItalic.ttf \
   vendor/pearl/prebuilt/common/fonts/GoogleSans-Italic.ttf:system/fonts/GoogleSans-Italic.ttf \
   vendor/pearl/prebuilt/common/fonts/GoogleSans-Bold.ttf:system/fonts/GoogleSans-Bold.ttf \
   vendor/pearl/prebuilt/common/fonts/GoogleSans-BoldItalic.ttf:system/fonts/GoogleSans-BoldItalic.ttf

ADDITIONAL_FONTS_FILE := vendor/pearl/prebuilt/common/fonts/google-sans.xml

# Turbo
PRODUCT_PACKAGES += \
    Turbo \

PRODUCT_COPY_FILES += \
   vendor/pearl/prebuilt/common/etc/permissions/privapp-permissions-turbo.xml:system/etc/permissions/privapp-permissions-turbo.xml \
   vendor/pearl/prebuilt/common/etc/sysconfig/turbo.xml:system/etc/sysconfig/turbo.xml
