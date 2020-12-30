all_targets += terminfo

terminfo_files = ~/.terminfo/tmux-256color.terminfo

terminfo: $(terminfo_files)
.PHONY: terminfo

$(terminfo_files):
	$(call homelink,$@)
