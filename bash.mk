all_targets += bash

bash_files = ~/.bash ~/.bashrc

bash: /usr/bin/bash $(bash_files)
.PHONY: bash

$(bash_files): /usr/bin/fzf
	$(call homelink,$@)
