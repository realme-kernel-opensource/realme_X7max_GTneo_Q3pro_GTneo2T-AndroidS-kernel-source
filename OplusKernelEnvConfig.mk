# Copyright (C), 2008-2030, OPPO Mobile Comm Corp., Ltd
###  All rights reserved.
###
### File: - OplusKernelEnvConfig.mk
### Description:
###     you can get the oplus feature variables set in android side in this file
###     this file will add global macro for common oplus added feature
###     BSP team can do customzation by referring the feature variables
### Version: 1.0
### Date: 2020-03-18
### Author: Liang.Sun
###
### ------------------------------- Revision History: ----------------------------
### <author>                        <date>       <version>   <desc>
### ------------------------------------------------------------------------------
### Liang.Sun@TECH.Build              2020-03-18   1.0         Create this moudle
##################################################################################

-include oplus_native_features.mk

###ifdef OPLUS_ARCH_INJECT
OPLUS_CONNECTIVITY_NATIVE_FEATURE_SET :=

##Add OPLUS Debug/Feature Macro Support for kernel/driver
##ifeq ($(OPLUS_FEATURE_TEST), yes)
## OPLUS_CONNECTIVITY_NATIVE_FEATURE_SET += OPLUS_FEATURE_TEST
##endif

ifeq ($(OPLUS_FEATURE_WIFI_MTUDETECT), yes)
OPLUS_CONNECTIVITY_NATIVE_FEATURE_SET += OPLUS_FEATURE_WIFI_MTUDETECT
endif


$(foreach myfeature,$(OPLUS_CONNECTIVITY_NATIVE_FEATURE_SET),\
    $( \
        $(eval KBUILD_CFLAGS += -D$(myfeature)) \
        $(eval KBUILD_CPPFLAGS += -D$(myfeature)) \
        $(eval CFLAGS_KERNEL += -D$(myfeature)) \
        $(eval CFLAGS_MODULE += -D$(myfeature)) \
    ) \
)
###endif OPLUS_ARCH_INJECT
ALLOWED_MCROS := OPLUS_FEATURE_HANS_FREEZE \
OPLUS_FEATURE_AOD \
OPLUS_FEATURE_DC \
OPLUS_FEATURE_ENABLE_MODEM_DB \
OPLUS_FEATURE_ENGINEERTOOLS \
OPLUS_FEATURE_HEALTHINFO  \
OPLUS_FEATURE_TASK_CPUSTATS \
OPLUS_FEATURE_FACERECOGNITION \
OPLUS_FEATURE_FASTBOOT_UNLOCK_VERIFY \
OPLUS_FEATURE_FG_IO_OPT \
OPLUS_FEATURE_SCHED_ASSIST \
OPLUS_FEATURE_SDCARD_INFO \
OPLUS_FEATURE_FINGERPRINT \
OPLUS_FEATURE_SPECIALOPT \
OPLUS_FEATURE_UFSPLUS  \
OPLUS_FEATURE_STORAGE_TOOL \
OPLUS_FEATURE_MIPICLKCHANGE \
OPLUS_FEATURE_MULTI_FREEAREA \
OPLUS_FEATURE_MULTI_KSWAPD \
OPLUS_FEATURE_NFC_CONSOFT \
OPLUS_FEATURE_ONSCREENFINGERPRINT \
OPLUS_FEATURE_OSC \
OPLUS_FEATURE_PHOENIX \
OPLUS_FEATURE_AGINGTEST \
OPLUS_FEATURE_PROCESS_RECLAIM \
OPLUS_FEATURE_RESET_ROLLBACK_INDEX \
OPLUS_FEATURE_SELINUX_CONTROL_LOG \
OPLUS_FEATURE_SENSOR \
OPLUS_FEATURE_SENSOR_ALGORITHM \
OPLUS_FEATURE_SENSOR_SMEM \
OPLUS_FEATURE_SENSOR_WISELIGHT \
OPLUS_FEATURE_IOMONITOR  \
OPLUS_FEATURE_SPEAKER_MUTE \
OPLUS_FEATURE_MM_FEEDBACK \
OPLUS_FEATURE_TP_BSPFWUPDATE \
OPLUS_FEATURE_CHG_BASIC \
OPLUS_FEATURE_VIRTUAL_RESERVE_MEMORY \
OPLUS_FEATURE_MEMLEAK_DETECT \
OPLUS_FEATURE_WIFI_MTUDETECT \
OPLUS_FEATURE_WIFI_RUSUPGRADE \
OPLUS_FEATURE_WIFI_SLA \
OPLUS_FEATURE_DATA_EVAL \
OPLUS_FEATURE_WIFI_SMART_BW \
OPLUS_FEATURE_IPV6_OPTIMIZE \
OPLUS_FEATURE_ZRAM_OPT \
OPLUS_FEATURE_EXFAT_SUPPORT \
OPLUS_FEATURE_SDCARDFS_SUPPORT \
OPLUS_FEATURE_STORAGE_TOOL \
OPLUS_BUG_COMPATIBILITY \
OPLUS_FEATURE_MIDAS \
OPLUS_BUG_STABILITY \
OPLUS_BUG_DEBUG \
OPLUS_ARCH_INJECT \
OPLUS_ARCH_EXTENDS \
OPLUS_FEATURE_LOWMEM_DBG \
OPLUS_FEATURE_PERFORMANCE \
OPLUS_FEATURE_MTK_ION_SEPARATE_LOCK \
OPLUS_FEATURE_POWERINFO_STANDBY \
OPLUS_FEATURE_POWERINFO_STANDBY_DEBUG  \
OPLUS_FEATURE_POWERINFO_RPMH \
OPLUS_FEATURE_POWERINFO_FTM \
OPLUS_FEATURE_SCHEDUTIL_USE_TL \
OPLUS_FEATURE_CORE_CTL \
OPLUS_FEATURE_STORAGE_TOOL \
OPLUS_FEATURE_CAMERA_COMMON \
OPLUS_FEATURE_WIFI_OPLUSWFD


$(foreach myfeature,$(ALLOWED_MCROS),\
         $(warning myfeature is $(myfeature)) \
         $(eval KBUILD_CFLAGS += -D$(myfeature)) \
         $(eval KBUILD_CPPFLAGS += -D$(myfeature)) \
         $(eval CFLAGS_KERNEL += -D$(myfeature)) \
         $(eval CFLAGS_MODULE += -D$(myfeature)) \
)



# BSP team can do customzation by referring the feature variables
ifeq ($(OPLUS_FEATURE_SECURE_GUARD),yes)
export CONFIG_OPLUS_SECURE_GUARD=y
KBUILD_CFLAGS += -DCONFIG_OPLUS_SECURE_GUARD
KBUILD_CPPFLAGS += -DCONFIG_OPLUS_SECURE_GUARD
CFLAGS_KERNEL += -DCONFIG_OPLUS_SECURE_GUARD
CFLAGS_MODULE += -DCONFIG_OPLUS_SECURE_GUARD
endif

ifeq ($(OPLUS_FEATURE_SECURE_ROOTGUARD),yes)
export CONFIG_OPLUS_ROOT_CHECK=y
KBUILD_CFLAGS += -DCONFIG_OPLUS_ROOT_CHECK
KBUILD_CPPFLAGS += -DCONFIG_OPLUS_ROOT_CHECK
CFLAGS_KERNEL += -DCONFIG_OPLUS_ROOT_CHECK
CFLAGS_MODULE += -DCONFIG_OPLUS_ROOT_CHECK
endif

ifeq ($(OPLUS_FEATURE_SECURE_MOUNTGUARD),yes)
export CONFIG_OPLUS_MOUNT_BLOCK=y
KBUILD_CFLAGS += -DCONFIG_OPLUS_MOUNT_BLOCK
endif

ifeq ($(OPLUS_FEATURE_SECURE_EXECGUARD),yes)
export CONFIG_OPLUS_EXECVE_BLOCK=y
KBUILD_CFLAGS += -DCONFIG_OPLUS_EXECVE_BLOCK
KBUILD_CFLAGS += -DCONFIG_OPLUS_EXECVE_REPORT
endif

ifeq ($(OPLUS_FEATURE_SECURE_KEVENTUPLOAD),yes)
export CONFIG_OPLUS_KEVENT_UPLOAD=y
KBUILD_CFLAGS += -DCONFIG_OPLUS_KEVENT_UPLOAD
KBUILD_CPPFLAGS += -DCONFIG_OPLUS_KEVENT_UPLOAD
CFLAGS_KERNEL += -DCONFIG_OPLUS_KEVENT_UPLOAD
CFLAGS_MODULE += -DCONFIG_OPLUS_KEVENT_UPLOAD
endif

ifeq ($(OPLUS_FEATURE_PREFER_SILVER),yes)
export CONFIG_OPLUS_PREFER_SILVER=y
KBUILD_CFLAGS += -DCONFIG_OPLUS_PREFER_SILVER
KBUILD_CPPFLAGS += -DCONFIG_OPLUS_PREFER_SILVER
CFLAGS_KERNEL += -DCONFIG_OPLUS_PREFER_SILVER
CFLAGS_MODULE += -DCONFIG_OPLUS_PREFER_SILVER
endif

ifeq ($(OPLUS_FEATURE_SECURE_KEYINTERFACESGUARD),yes)
KBUILD_CFLAGS += -DOPLUS_DISALLOW_KEY_INTERFACES
endif

#Zhijun.Ye@MM.Display.LCD.Machine, 2020/09/23, add for multibits backlight
ifeq ($(OPLUS_FEATURE_MULTIBITS_BL),yes)
KBUILD_CFLAGS += -DOPLUS_FEATURE_MULTIBITS_BL
KBUILD_CPPFLAGS += -DOPLUS_FEATURE_MULTIBITS_BL
CFLAGS_KERNEL += -DOPLUS_FEATURE_MULTIBITS_BL
CFLAGS_MODULE += -DOPLUS_FEATURE_MULTIBITS_BL
endif

ifeq ($(OPLUS_FEATURE_DFPS3_SUPPORT),yes)
KBUILD_CFLAGS += -DOPLUS_FEATURE_DFPS3_SUPPORT
KBUILD_CPPFLAGS += -DOPLUS_FEATURE_DFPS3_SUPPORT
CFLAGS_KERNEL += -DOPLUS_FEATURE_DFPS3_SUPPORT
CFLAGS_MODULE += -DOPLUS_FEATURE_DFPS3_SUPPORT
endif
