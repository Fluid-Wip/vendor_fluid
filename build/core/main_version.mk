# Build fingerprint
ifneq ($(BUILD_FINGERPRINT),)
ADDITIONAL_BUILD_PROPERTIES += \
    ro.build.fingerprint=$(BUILD_FINGERPRINT)
endif

# LineageOS System Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluidlegal.url=https://fluidos.me

# LineageOS Platform SDK Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluid.build.version.plat.sdk=$(LINEAGE_PLATFORM_SDK_VERSION)

# LineageOS Platform Internal Version
ADDITIONAL_BUILD_PROPERTIES += \
    ro.fluid.build.version.plat.rev=$(LINEAGE_PLATFORM_REV)
