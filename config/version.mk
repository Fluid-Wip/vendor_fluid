# Copyright (C) 2016-2017 AOSiP
#
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

# Versioning System
FLUID_NUM_VER = 0.6
FLUID_CODENAME = Quenol

TARGET_PRODUCT_SHORT := $(subst Fluid_,,$(FLUID_BUILD_TYPE))

ifndef FLUID_BUILD_TYPE
    FLUID_BUILD_TYPE := UNOFFICIAL
endif

# Only include Updater for official, weeklies, and nightly builds
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY,$(FLUID_BUILD_TYPE)),)
    PRODUCT_PACKAGES += \
        Updater
endif

# Sign builds if building an official, weekly and nightly build
ifeq ($(filter-out OFFICIAL WEEKLIES NIGHTLY,$(FLUID_BUILD_TYPE)),)
    PRODUCT_DEFAULT_DEV_CERTIFICATE := $(KEYS_LOCATION)
endif

# Set all versions
BUILD_DATE := $(shell date -u +%Y%m%d)
BUILD_TIME := $(shell date -u +%H%M)
LINEAGE_BUILD_VERSION := $(FLUID_NUM_VER)-$(FLUID_CODENAME)
LINEAGE_VERSION := $(LINEAGE_BUILD_VERSION)-$(FLUID_BUILD_TYPE)-$(LINEAGE_BUILD)-$(BUILD_DATE)
ifeq ($(TARGET_INCLUDE_GAPPS), true)
FLUID_VERSION := $(FLUID_VERSION)-gapped
endif
ROM_FINGERPRINT := Fluid/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(BUILD_TIME)
LINEAGE_DISPLAY_VERSION := $(LINEAGE_VERSION)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.fluid.build.version=$(LINEAGE_BUILD_VERSION) \
  ro.fluid.build.date=$(BUILD_DATE) \
  ro.fluid.buildtype=$(FLUID_BUILD_TYPE) \
  ro.fluid.fingerprint=$(ROM_FINGERPRINT) \
  ro.fluid.version=$(LINEAGE_VERSION) \
  ro.fluid.device=$(LINEAGE_BUILD) \
  ro.modversion=$(LINEAGE_VERSION)
