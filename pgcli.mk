all_targets += pgcli

pgcli_files = ~/.config/pgcli/config

pgcli: /usr/bin/pgcli $(pgcli_files)
.PHONY: pgcli

/usr/bin/pgcli:
	$(call install,pgcli)

$(pgcli_files):
	$(call homelink,$@)
