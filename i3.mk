all_targets += i3

i3_files = ~/.i3 ~/.i3status.conf ~/bin/status_bar.d ~/bin/status_bar ~/bin/lock ~/bin/i3-msg-center-floating ~/bin/light-control ~/bin/configure-mouse ~/bin/configure-keyboard ~/.Xresources ~/.xmodmap ~/bin/uhk-cmd ~/bin/uhk-urgent ~/bin/uhk-auto-keymap ~/bin/vol-mode

i3: /usr/bin/i3 /usr/bin/tmux /usr/bin/rofi /usr/bin/feh /usr/bin/pcregrep /usr/bin/i3lock /usr/bin/scrot /usr/bin/convert $(i3_files)
.PHONY: i3

/usr/bin/i3:
	$(call install,i3)

/usr/bin/i3lock:
	$(call install,i3lock)

/usr/bin/feh:
	$(call install,feh)

/usr/bin/scrot:
	$(call install,scrot)

$(i3_files):
	$(call homelink,$@)
