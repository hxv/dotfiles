all_targets += lnav

lnav: /usr/bin/lnav
.PHONY: lnav

/usr/bin/lnav:
	$(call install,lnav)
