#
# Copyright (C) 2011 The CyanogenMod Project
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

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

## The gps config appropriate for this device
PRODUCT_COPY_FILES += device/common/gps/gps.conf_US_SUPL:system/etc/gps.conf

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/hercules/hercules-vendor.mk)

## misc
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dexopt-flags=m=v,o=y

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/hercules/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Kernel and modules
ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/samsung/hercules/prebuilt/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/samsung/hercules/modules/ansi_cprng.ko:system/lib/modules/ansi_cprng.ko \
    device/samsung/hercules/modules/cls_flow.ko:system/lib/modules/cls_flow.ko \
    device/samsung/hercules/modules/dal_remotetest.ko:system/lib/modules/dal_remotetest.ko \
    device/samsung/hercules/modules/dhd.ko:system/lib/modules/dhd.ko \
    device/samsung/hercules/modules/dma_test.ko:system/lib/modules/dma_test.ko \
    device/samsung/hercules/modules/evbug.ko:system/lib/modules/evbug.ko \
    device/samsung/hercules/modules/gspca_main.ko:system/lib/modules/gspca_main.ko \
    device/samsung/hercules/modules/ksapi.ko:system/lib/modules/ksapi.ko \
    device/samsung/hercules/modules/lcd.ko:system/lib/modules/lcd.ko \
    device/samsung/hercules/modules/msm-buspm-dev.ko:system/lib/modules/msm-buspm-dev.ko \
    device/samsung/hercules/modules/msm_tsif.ko:system/lib/modules/msm_tsif.ko \
    device/samsung/hercules/modules/qce.ko:system/lib/modules/qce.ko \
    device/samsung/hercules/modules/qcedev.ko:system/lib/modules/qcedev.ko \
    device/samsung/hercules/modules/qcrypto.ko:system/lib/modules/qcrypto.ko \
    device/samsung/hercules/modules/sch_dsmark.ko:system/lib/modules/sch_dsmark.ko \
    device/samsung/hercules/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/samsung/hercules/modules/spidev.ko:system/lib/modules/spidev.ko \
    device/samsung/hercules/modules/tsif_chrdev.ko:system/lib/modules/tsif_chrdev.ko \
    device/samsung/hercules/modules/vibrator.ko:system/lib/modules/vibrator.ko \
    device/samsung/hercules/modules/mmc_test.ko:system/lib/modules/mmc_test.ko

# Ramdisk
PRODUCT_COPY_FILES += \
    device/samsung/hercules/ramdisk/init.emmc.rc:root/init.emmc.rc \
    device/samsung/hercules/ramdisk/init.qcom.lpm_boot.sh:root/init.qcom.lpm_boot.sh \
    device/samsung/hercules/ramdisk/init.qcom.rc:root/init.qcom.rc \
    device/samsung/hercules/ramdisk/init.qcom.sh:root/init.qcom.sh \
    device/samsung/hercules/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/samsung/hercules/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
    device/samsung/hercules/ramdisk/init.target.rc:root/init.target.rc \
    device/samsung/hercules/ramdisk/initlogo.rle:root/initlogo.rle \
    device/samsung/hercules/ramdisk/lpm.rc:root/lpm.rc \
    device/samsung/hercules/ramdisk/ueventd.rc:root/ueventd.rc

# BT firmware
PRODUCT_COPY_FILES += \
    device/samsung/hercules/firmware/bcm4330B1.hcd:system/etc/firmware/bcm4330B1.hcd

# Vold fstab
PRODUCT_COPY_FILES += \
    device/samsung/hercules/vold.fstab:system/etc/vold.fstab

# common msm8660
$(call inherit-product, device/samsung/msm8660-common/msm8660.mk)

$(call inherit-product, frameworks/base/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/samsung/hercules/hercules-vendor.mk)

#WIFI_BAND := 802_11_ABG
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
