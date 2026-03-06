all_targets += fonts

fonts_files = ~/.fonts

fonts: $(fonts_files)
.PHONY: fonts

$(fonts_files):
	$(call homelink,$@)
	sudo fc-cache -f -v
