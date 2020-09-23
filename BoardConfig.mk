#
# Copyright (C) 2020 The Android Open Source Project
# Copyright (C) 2020 The TWRP Open Source Project
# Copyright (C) 2020 SebaUbuntu's TWRP device tree generator 
# Copyright (C) 2020 A-Team Digital Solutions 
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/ginna

# Architecture- **Works**
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9

# Platform
BOARD_USES_QCOM_HARDWARE := true
TARGET_BOARD_PLATFORM := msm8953
TARGET_BOARD_PLATFORM_GPU := qcom-adreno506

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8953
TARGET_NO_BOOTLOADER := true

# Kernel
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200,n8 androidboot.console=ttyMSM0 androidboot.hardware=qcom user_debug=30 msm_rtb.filter=0x237 ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 earlycon=msm_hsl_uart,0x78af000 androidboot.usbconfigfs=true vmalloc=300M loop.max_part=7 printk.devkmsg=on androidboot.hab.csv=3 androidboot.hab.product=ginna androidboot.hab.cid=50 androidboot.boot_devices=soc/7824900.sdhci buildvariant=eng androidboot.selinux=permissive
BOARD_KERNEL_CMDLINE += skip_override androidboot.fastboot=1
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_HEADER_ARCH := arm
TARGET_KERNEL_SOURCE := kernel/motorola/ginna
TARGET_KERNEL_CONFIG := ginna_defconfig
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_IMAGE_NAME := zImage
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/zImage
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DTB)

# Assert
TARGET_OTA_ASSERT_DEVICE := ginna

# Partitions
#BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216        #    16384 * 1024 mmcblk0p37
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 21073920    #    20580 * 1024 mmcblk0p38
#BOARD_SYSTEMIMAGE_PARTITION_SIZE := 4294967296    #  4194304 * 1024 mmcblk0p53
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 56883133440 # 55549935 * 1024 mmcblk0p54
#BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456      #   262144 * 1024 mmcblk0p52
#BOARD_OEMIMAGE_PARTITION_SIZE := 805306368        #   786432 * 1024 mmcblk0p51
#BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432     #    32768 * 1024 mmcblk0p30

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Workaround for error copying vendor files to recovery ramdisk
TARGET_COPY_OUT_VENDOR := vendor

# Hack: prevent anti rollback
#PLATFORM_VERSION := 16.1.0

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/twrp.fstab
BOARD_SUPPRESS_SECURE_ERASE := true

# A/B
#AB_OTA_UPDATER := true
#TW_INCLUDE_REPACKTOOLS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_MAX_BRIGHTNESS := 255
#TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_SCREEN_BLANK_ON_BOOT := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
RECOVERY_SDCARD_ON_DATA := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_INCLUDE_NTFS_3G := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
#TW_EXTRA_LANGUAGES := true
TW_USE_TOOLBOX := true
TW_NO_LEGACY_PROPS := true
TW_NO_BIND_SYSTEM := true
TW_USE_NEW_MINADBD := true

# Debug
TWRP_INCLUDE_LOGCAT := true

# Crypto
PLATFORM_SECURITY_PATCH := 2025-12-31
VENDOR_SECURITY_PATCH := 2025-12-31
#PLATFORM_VERSION := 16.1.0
#TW_INCLUDE_CRYPTO := true
#TW_INCLUDE_CRYPTO_FBE := true
#TW_INCLUDE_FBE_METADATA_DECRYPT := true
#BOARD_USES_METADATA_PARTITION := true

# Dynamic Partitions
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 536870912
BOARD_SUPER_PARTITION_SIZE := 9663676416
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTORLOA_DYNAMIC_PARTITIONS_SIZE := 9663672320
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := product vendor system

# System as root
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_ROOT_EXTRA_FOLDERS := cache carrier dqmdbg efs keydata keyrefuge omr optics prism spu

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

