SOHO_HEADER_DATA := '\x50\x03\x00\x00\x00\x25\xe4\x00'

$(INSTALLED_BOOTIMAGE_TARGET): $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	$(hide) $(MKBOOTIMG) $(INTERNAL_BOOTIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@.std
	$(hide) dd if=/dev/zero of=$@ bs=848 count=1
	$(hide) echo -ne $(SOHO_HEADER_DATA) | dd of=$@ bs=52 seek=1 conv=notrunc
	$(hide) cat $@.std >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made boot image: $@"${CL_RST}

$(INSTALLED_RECOVERYIMAGE_TARGET): $(MKBOOTIMG) \
		$(recovery_ramdisk) \
		$(recovery_kernel)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) $(INTERNAL_RECOVERYIMAGE_ARGS) $(BOARD_MKBOOTIMG_ARGS) --output $@.std
	$(hide) dd if=/dev/zero of=$@ bs=848 count=1
	$(hide) echo -ne $(SOHO_HEADER_DATA) | dd of=$@ bs=52 seek=1 conv=notrunc
	$(hide) cat $@.std >> $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)
	@echo -e ${CL_CYN}"Made recovery image: $@"${CL_RST}
