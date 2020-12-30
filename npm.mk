all_targets += npm

npm: /usr/bin/npm ~/.npm-packages
.PHONY: npm

/usr/bin/npm:
	$(call install,npm)
	npm config set prefix "~/.npm-packages"

~/.npm-packages:
	mkdir -p $@
