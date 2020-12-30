all_targets += tmux

tmux_files = ~/.tmux.conf

tmux: /usr/bin/tmux $(tmux_files)
.PHONY: tmux

/usr/bin/tmux:
	$(call install,tmux)

$(tmux_files):
	$(call homelink,$@)

