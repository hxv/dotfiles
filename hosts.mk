all_targets += hosts

hosts: /etc/hosts
.PHONY: hosts

/etc/hosts: $(lastword $(MAKEFILE_LIST))
	grep -P '^\s*192\.168\.55\.128\s+qnap(\s+|$$)' /etc/hosts >/dev/null || echo '192.168.55.128 qnap' | sudo tee -a /etc/hosts
	sudo touch $@
