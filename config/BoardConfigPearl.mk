include vendor/pearl/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/pearl/config/BoardConfigQcom.mk
endif
include vendor/pearl/config/BoardConfigSoong.mk
