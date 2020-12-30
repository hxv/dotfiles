all_targets += yubikey

yubikey_ppa = /etc/apt/sources.list.d/yubico-ubuntu-stable-$(ubuntu_codename).list
#yubikey_serial = $(shell ykman list --serials | head -n 1)
yubikey_serial = $(shell ykman info | grep '^Serial number: ' | cut -d ' ' -f 3)

yubikey: /usr/bin/ykpamcfg /usr/bin/ykman /usr/lib/udev/rules.d/69-yubikey.rules /usr/lib/udev/rules.d/85-yubikey-lock.rules /etc/yubico/$(shell whoami)-$(yubikey_serial) /etc/pam.d/sudo
.PHONY: yubikey

$(yubikey_ppa):
	sudo add-apt-repository -y ppa:yubico/stable

/usr/bin/ykpamcfg: $(yubikey_ppa)
	$(call install,libpam-yubico)
	sudo touch $@

/usr/bin/ykman: $(yubikey_ppa)
	$(call install,yubikey-manager)
	sudo touch $@

/usr/lib/udev/rules.d/69-yubikey.rules: _fs_/usr/lib/udev/rules.d/69-yubikey.rules
	sudo cp _fs_/usr/lib/udev/rules.d/69-yubikey.rules $@
	getent group yubikey || sudo groupadd yubikey
	sudo usermod -a -G yubikey $(shell whoami)
	sudo udevadm control --reload-rules
	sudo udevadm trigger

/usr/lib/udev/rules.d/85-yubikey-lock.rules: _fs_/usr/lib/udev/rules.d/85-yubikey-lock.rules
	sudo cp _fs_/usr/lib/udev/rules.d/85-yubikey-lock.rules $@
	sudo udevadm control --reload-rules
	sudo udevadm trigger

ifneq ($(yubikey_serial),)
/etc/yubico/$(shell whoami)-$(yubikey_serial):
	sudo mkdir -p /etc/yubico
	rm -rf /tmp/$(shell whoami)-$(yubikey_serial)
	ykpamcfg -2 -p /tmp
	sudo mv /tmp/$(shell whoami)-$(yubikey_serial) $@
else
/etc/yubico/$(shell whoami)-$(yubikey_serial):
	$(warning YubiKey serial number not found)
endif

/etc/pam.d/sudo: $(lastword $(MAKEFILE_LIST))
	grep pam_yubico.so $@ || sudo sed -i '0,/^@include/s/^@include/auth sufficient pam_yubico.so mode=challenge-response chalresp_path=\/etc\/yubico\n&/' $@
	sudo touch $@

