all_targets += utils

utils_simple = pcregrep whois nmap curl htop jq sshfs bindfs expect xclip fzf arandr kolourpaint okular

utils_simple_targets = $(addprefix /usr/bin/,$(utils_simple))

utils: /usr/bin/gdebi /usr/bin/netstat /usr/bin/convert /usr/bin/apt-file /var/snap/fx /usr/bin/xmllint $(utils_simple_targets)
.PHONY: utils

$(utils_simple_targets):
	$(call install,$@)

/usr/bin/gdebi:
	$(call install,gdebi-core)

/usr/bin/netstat:
	$(call install,net-tools)

/usr/bin/convert:
	$(call install,imagemagick)

/usr/bin/apt-file:
	$(call install,apt-file)
	sudo apt-file update

/var/snap/fx:
	sudo snap install fx

/usr/bin/xmllint:
	$(call install,libxml2-utils)
