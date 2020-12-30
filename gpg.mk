all_targets += gpg

gpg_files = ~/.gnupg/gpg-agent.conf ~/.gnupg/gpg.conf

gpg: /usr/bin/gpg2 /usr/lib/gnupg/scdaemon /usr/sbin/pcscd $(gpg_files) yubikey gpg-import-public-key
.PHONY: gpg

$(gpg_files):
	$(call homelink,$@)
	chmod 700 ~/.gnupg

/usr/bin/gpg2:
	$(call install,gnupg2)

/usr/lib/gnupg/scdaemon:
	$(call install,scdaemon)

/usr/sbin/pcscd:
	$(call install,pcscd)

gpg-import-public-key:
	gpg2 --fetch-keys $(shell gpg2 --card-status | grep '^URL of public key' | cut -d ':' -f 2- | tr -d ' ')
.PHONY: gpg-import-public-key

# sudo apt install pcsc-tools ?

