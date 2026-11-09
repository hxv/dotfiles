chezmoi_version = 2.74.0
chezmoi_sha256 = 1b98a567f726f41540414aea4caf912699d53e248b29ccf8369cf553657b2374
chezmoi_url = https://github.com/twpayne/chezmoi/releases/download/v$(chezmoi_version)/chezmoi_$(chezmoi_version)_linux_amd64.tar.gz

chezmoi_bin = ~/.local/bin/chezmoi
chezmoi_stamp = ~/.local/share/chezmoi-install/$(chezmoi_version)

chezmoi: $(chezmoi_stamp)
.PHONY: chezmoi

$(chezmoi_stamp): $(lastword $(MAKEFILE_LIST))
	set -e; \
	tmp=$$(mktemp -d); trap 'rm -rf "$$tmp"' EXIT; \
	curl -fsSL -o "$$tmp/chezmoi.tar.gz" "$(chezmoi_url)"; \
	echo "$(chezmoi_sha256)  $$tmp/chezmoi.tar.gz" | sha256sum -c -; \
	tar -xzf "$$tmp/chezmoi.tar.gz" -C "$$tmp" chezmoi; \
	mkdir -p $(dir $(chezmoi_bin)); \
	install -m 755 "$$tmp/chezmoi" $(chezmoi_bin)
	mkdir -p $(dir $@)
	rm -f $(dir $@)*
	touch $@

chezmoi_source = ~/.local/share/chezmoi

chezmoi-init: chezmoi $(chezmoi_source)
.PHONY: chezmoi-init

$(chezmoi_source):
	mkdir -p $(dir $@)
	ln -s $(CURDIR) $@

# Wdraża pliki z home/ do $HOME.
chezmoi-apply: chezmoi-init
	$(chezmoi_bin) apply --verbose
.PHONY: chezmoi-apply
