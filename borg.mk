all_targets += borg

borg: /usr/bin/borg /usr/sbin/mount.nfs ~/bin/backup
.PHONY: borg

/usr/sbin/mount.nfs:
	$(call install,nfs-common)

/usr/bin/borg:
	$(call install,borgbackup)

~/bin/backup:
	$(call homelink,$@)
