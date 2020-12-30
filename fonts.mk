all_targets += fonts

fonts_files = ~/.fonts

fonts: $(fonst_files)
.PHONY: fonts

$(fonst_files):
	$(call homelink,$@)
