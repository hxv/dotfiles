all_targets += ssh

ssh_files = ~/.ssh/config

ssh: /usr/bin/ssh $(ssh_files)
.PHONY: ssh

$(ssh_files):
	$(call homelink,$@)
