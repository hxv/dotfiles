all_targets += bash

bash_files = ~/.bash ~/.bashrc ~/.hosts

bash: /usr/bin/bash $(bash_files) ~/.npm-packages/bin/safe-rm
.PHONY: bash

$(bash_files): /usr/bin/fzf
	$(call homelink,$@)

~/.npm-packages/bin/safe-rm: /usr/bin/npm
	npm install -g safe-rm
	touch $@
