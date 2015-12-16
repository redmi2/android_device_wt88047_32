
DEVICE_PACKAGE_OVERLAYS := device/hm2014811/overlay

TARGET_USES_QCOM_BSP := true

# Add QC Video Enhancements flag
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# World APN list
PRODUCT_COPY_FILES += \
    device/hm2014811/configs/apns-conf.xml:system/etc/apns-conf.xml

# Selective SPN list for operator number who has the problem.
PRODUCT_COPY_FILES += \
    device/hm2014811/configs/selective-spn-conf.xml:system/etc/selective-spn-conf.xml

#QTIC flag
-include $(QCPATH)/common/config/qtic-config.mk

# media_profiles and media_codecs xmls for redmi2
ifeq ($(TARGET_ENABLE_QC_AV_ENHANCEMENTS), true)
PRODUCT_COPY_FILES += device/hm2014811/media/media_profiles_8916.xml:system/etc/media_profiles.xml \
                      device/hm2014811/media/media_codecs_performance_8916_32.xml:system/etc/media_codecs_performance.xml \
                      device/hm2014811/media/media_codecs_8916.xml:system/etc/media_codecs.xml
endif

PRODUCT_PROPERTY_OVERRIDES += \
       dalvik.vm.heapgrowthlimit=128m \
       dalvik.vm.heapminfree=6m \
       dalvik.vm.heapstartsize=14m
$(call inherit-product, device/qcom/common/common.mk)


ifeq ($(strip $(TARGET_USES_QTIC)),true)
# font rendering engine feature switch
-include $(QCPATH)/common/config/rendering-engine.mk
ifneq (,$(strip $(wildcard $(PRODUCT_RENDERING_ENGINE_REVLIB))))
    MULTI_LANG_ENGINE := REVERIE
#   MULTI_LANG_ZAWGYI := REVERIE
endif
endif

PRODUCT_BOOT_JARS += \
           qcom.fmradio

PRODUCT_BOOT_JARS += tcmiface
PRODUCT_BOOT_JARS += qcmediaplayer

ifneq ($(strip $(QCPATH)),)
PRODUCT_BOOT_JARS += com.qti.dpmframework
PRODUCT_BOOT_JARS += dpmapi
PRODUCT_BOOT_JARS += com.qti.location.sdk
PRODUCT_BOOT_JARS += oem-services
endif

PRODUCT_BOOT_JARS += WfdCommon

# Audio configuration od AOSP
PRODUCT_COPY_FILES += \
    device/hm2014811/audio/acdb/Bluetooth_cal.acdb:system/etc/acdbdata/QRD/Bluetooth_cal.acdb \
    device/hm2014811/audio/acdb/General_cal.acdb:system/etc/acdbdata/QRD/General_cal.acdb \
    device/hm2014811/audio/acdb/Global_cal.acdb:system/etc/acdbdata/QRD/Global_cal.acdb \
    device/hm2014811/audio/acdb/Handset_cal.acdb:system/etc/acdbdata/QRD/Handset_cal.acdb \
    device/hm2014811/audio/acdb/Hdmi_cal.acdb:system/etc/acdbdata/QRD/Hdmi_cal.acdb \
    device/hm2014811/audio/acdb/Headset_cal.acdb:system/etc/acdbdata/QRD/Headset_cal.acdb \
    device/hm2014811/audio/acdb/Speaker_cal.acdb:system/etc/acdbdata/QRD/Speaker_cal.acdb \
    device/hm2014811/audio/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    device/hm2014811/audio/audio_platform_info.xml:system/etc/audio_platform_info.xml \
    device/hm2014811/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/hm2014811/audio/mixer_paths.xml:system/etc/mixer_paths.xml

# Audio configuration file
#PRODUCT_COPY_FILES += \
#   device/hm2014811/audio_policy.conf:system/etc/audio_policy.conf \
#   device/hm2014811/audio_effects.conf:system/vendor/etc/audio_effects.conf \
#   device/hm2014811/mixer_paths_mtp.xml:system/etc/mixer_paths_mtp.xml \
#   device/hm2014811/mixer_paths_qrd_skuh.xml:system/etc/mixer_paths_qrd_skuh.xml \
#   device/hm2014811/mixer_paths_qrd_skui.xml:system/etc/mixer_paths_qrd_skui.xml \
#   device/hm2014811/mixer_paths_qrd_skuhf.xml:system/etc/mixer_paths_qrd_skuhf.xml \
#   device/hm2014811/mixer_paths_wcd9306.xml:system/etc/mixer_paths_wcd9306.xml \
#   device/hm2014811/mixer_paths_skuk.xml:system/etc/mixer_paths_skuk.xml \
#   device/hm2014811/mixer_paths_skul.xml:system/etc/mixer_paths_skul.xml \
#   device/hm2014811/mixer_paths.xml:system/etc/mixer_paths.xml \
#   device/hm2014811/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
#   device/hm2014811/sound_trigger_mixer_paths_wcd9306.xml:system/etc/sound_trigger_mixer_paths_wcd9306.xml \
#   device/hm2014811/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
#   device/hm2014811/mixer_paths_wcd9330.xml:system/etc/mixer_paths_wcd9330.xml

# Keylayout
PRODUCT_COPY_FILES += \
    device/hm2014811/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/hm2014811/keylayout/msm8x16-hm2014811-snd-card_Button_Jack.kl:system/usr/keylayout/msm8x16-hm2014811-snd-card_Button_Jack.kl \
    device/hm2014811/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# Sensors
PRODUCT_PACKAGES += \
    calmodule.cfg \
    libcalmodule_common \
    sensors.msm8916
    
# Display
PRODUCT_PACKAGES += \
    libtinyxml
    
# ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

#fstab.qcom
PRODUCT_PACKAGES += fstab.qcom

PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing

#OEM Services library
PRODUCT_PACKAGES += oem-services
PRODUCT_PACKAGES += libsubsystem_control
PRODUCT_PACKAGES += libSubSystemShutdown

#wifi
PRODUCT_PACKAGES += wcnss_service
#PRODUCT_PACKAGES += libwcnss_qmi

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    device/hm2014811/msm_irqbalance.conf:system/vendor/etc/msm_irqbalance.conf

#wlan driver
PRODUCT_COPY_FILES += \
    device/hm2014811/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    device/hm2014811/WCNSS_wlan_dictionary.dat:persist/WCNSS_wlan_dictionary.dat \
    device/hm2014811/WCNSS_qcom_wlan_nv.bin:persist/WCNSS_qcom_wlan_nv.bin

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app

#HBTP
PRODUCT_PACKAGES += hbtp_daemon
PRODUCT_PACKAGES += libhbtpclient.so
PRODUCT_PACKAGES += libhbtpfrmwk.so
PRODUCT_PACKAGES += libhbtparm.so
PRODUCT_PACKAGES += libafehal_5_rohm_v3.so
PRODUCT_PACKAGES += hbtp_8939_5_rohm_v3.cfg
PRODUCT_PACKAGES += hbtpcfg_8939_5_rohm_v3.dat
PRODUCT_PACKAGES += libafehal_5_rohm_v4.so
PRODUCT_PACKAGES += hbtp_8939_5_rohm_v4.cfg
PRODUCT_PACKAGES += hbtpcfg_8939_5_rohm_v4.dat
PRODUCT_PACKAGES += libafehal_5p5_rohm_v4.so
PRODUCT_PACKAGES += hbtp_8939_5p5_rohm_v4.cfg
PRODUCT_PACKAGES += hbtpcfg_8939_5p5_rohm_v4.dat
PRODUCT_PACKAGES += libafehal_6_rohm_v3.so
PRODUCT_PACKAGES += hbtp_8939_6_rohm_v3.cfg
PRODUCT_PACKAGES += hbtpcfg_8939_6_rohm_v3.dat

# Defined the locales
PRODUCT_LOCALES += th_TH vi_VN tl_PH hi_IN ar_EG ru_RU tr_TR pt_BR bn_IN mr_IN ta_IN te_IN zh_HK \
        in_ID my_MM km_KH sw_KE uk_UA pl_PL sr_RS sl_SI fa_IR kn_IN ml_IN ur_IN gu_IN or_IN

# Add the overlay path
ifeq ($(strip $(TARGET_USES_QTIC)),true)
PRODUCT_PACKAGE_OVERLAYS := $(QCPATH)/qrdplus/Extension/res-overlay \
        $(PRODUCT_PACKAGE_OVERLAYS)
endif

# Sensor HAL conf file
#PRODUCT_COPY_FILES += \
#    device/hm2014811/sensors/hals.conf:system/etc/sensors/hals.conf
