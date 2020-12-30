all: all_targets
.PHONY: all

ubuntu_codename = $(shell lsb_release -cs)

define homelink
	rm -rf $(1)
	[ ! -d $(dir $(1)) ] && mkdir -p $(dir $(1)) || true
	ln -s $(subst $(HOME),$(CURDIR),$(1)) $(1)
endef

define install
	sudo apt install -y $(notdir $(1))
endef

include *.mk

all_targets: $(all_targets)
.PHONY: all_targets
