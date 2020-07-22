THEOS_DEVICE_IP = 192.168.1.31

TARGET := iphone:clang:latest:7.0
ARCHS = armv7 arm64
ADDITIONAL_OBJCFLAGS = -fobjc-arc

include $(THEOS)/makefiles/common.mk

TOOL_NAME = excute

excute_FILES = main.m
excute_CFLAGS = -fobjc-arc
excute_CODESIGN_FLAGS = -Sentitlements.plist
excute_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
