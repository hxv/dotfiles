all_targets += spotify

spotify: /var/snap/spotify
.PHONY: spotify

/var/snap/spotify:
	sudo snap install spotify
