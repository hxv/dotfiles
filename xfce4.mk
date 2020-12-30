all_targets += xfce4

xfce4_files = ~/.config/gtk-3.0/settings.ini \
			  ~/.config/xfce4/terminal/accels.scm \
			  ~/.config/xfce4/terminal/terminalrc \
			  ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml \
			  ~/.config/xfce4/xfconf/xfce-perchannel-xml/xsettings.xml

xfce4: $(xfce4_files)
.PHONY: xfce4

$(xfce4_files):
	$(call homelink,$@)

