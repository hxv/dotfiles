all_targets += steam

steam: /usr/games/steam
.PHONY: steam

/usr/games/steam:
	$(call install,steam)
