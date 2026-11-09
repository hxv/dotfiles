all_targets += python

pip_utils = termdown yt-dlp yq

pip_utils_targets = $(addprefix ~/.local/bin/,$(pip_utils))

python: /usr/bin/pip3 $(pip_utils_targets)
.PHONY: python

/usr/bin/pip3:
	$(call install,python3-pip)

~/.local/bin/pip3:
	python3 -m venv ~/.local

$(pip_utils_targets): ~/.local/bin/pip3
	~/.local/bin/pip3 install $(notdir $@)
