ifneq ($(filter hercules,$(TARGET_DEVICE)),)
    include $(all-subdir-makefiles)
endif
