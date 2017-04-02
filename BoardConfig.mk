#
# Copyright (C) 2013 The LineageOS Project
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
#

TARGET_GLOBAL_CFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := krait

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET := true
TARGET_KRAIT_BIONIC_PLDOFFS := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH := 64
TARGET_KRAIT_BIONIC_PLDSIZE := 64
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := MSM8960
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := msm8960

#Kernel configs
BOARD_KERNEL_BASE := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x02000000
TARGET_PREBUILT_KERNEL := device/pantech/ef52/kernel
BOARD_KERNEL_CMDLINE := console=NULL,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 loglevel=0 vmalloc=0x16000000 maxcpus=2 androidboot.selinux=permissive


# Init
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_ef52
TARGET_LIBINIT_DEFINES_FILE := device/pantech/ef52/init/init_ef52.cpp

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520 # 20M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520 # 20M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1782579200 # 1.7G
BOARD_USERDATAIMAGE_PARTITION_SIZE := 27577531392 # The rest of 32GB
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

# TWRP
TARGET_RECOVERY_PIXEL_FORMAT 	:= "RGBX_8888"
TARGET_USERIMAGES_USE_EXT4 	:= true
BOARD_HAS_NO_SELECT_BUTTON 	:= true
TW_THEME 			:= portrait_hdpi
RECOVERY_SDCARD_ON_DATA 	:= true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_INCLUDE_JB_CRYPTO 		:= true
TW_FLASH_FROM_STORAGE 		:= true
TW_NO_USB_STORAGE 		:= true
TW_INTERNAL_STORAGE_PATH 	:= "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH 	:= "/usb-otg"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TARGET_RECOVERY_QCOM_RTC_FIX 	:= true
TW_BRIGHTNESS_PATH 		:= "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS 		:= 255
TW_DEFAULT_BRIGHTNESS 		:= 175
TW_EXCLUDE_SUPERSU 		:= true
TW_TIME_ZONE_GUISEL		:= "THAIST-7;THAIDT"
TW_NO_SCREEN_TIMEOUT		:= true
