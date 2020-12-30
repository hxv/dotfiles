all_targets += rofi

rofi_files = ~/.config/rofi/config

rofi: /usr/bin/rofi $(rofi_files)
.PHONY: rofi

/usr/bin/rofi:
	$(call install,rofi)

$(rofi_files):
	$(call homelink,$@)
