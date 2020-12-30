all_targets += ranger

ranger: /usr/bin/ranger
.PHONY: ranger

/usr/bin/ranger:
	$(call install,ranger)
