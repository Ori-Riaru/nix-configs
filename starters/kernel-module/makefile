TARGET = main
BUILD_DIR := build
KERNEL_DIR ?= /lib/modules/$(shell uname -r)/build

obj-m += $(TARGET).o

all:
	$(MAKE) -C $(KERNEL_DIR) M=$(PWD)/$(BUILD_DIR) src=$(PWD) modules
	cp $(BUILD_DIR)/$(TARGET).ko .

clean:
	rm -f $(TARGET).ko
	rm -rf $(BUILD_DIR)