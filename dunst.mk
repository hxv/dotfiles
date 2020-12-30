all_targets += dunst

dunst_files = ~/.config/dunst/dunstrc

dunst: /usr/bin/dunst $(dunst_files)
.PHONY: dunst

$(dunst_files):
	$(call homelink,$@)
