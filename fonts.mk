all_targets += fonts

fonts_files = ~/.fonts

fonts: $(fonst_files)
.PHONY: fonts

$(fonts_files):
	$(call homelink,$@)
	sudo fc-cache -f -v
