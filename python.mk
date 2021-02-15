all_targets += python

pip_utils = termdown youtube-dl yq

pip_utils_targets = $(addprefix ~/.local/bin/,$(pip_utils))

python: /usr/bin/pip3 $(pip_utils_targets)
.PHONY: python

/usr/bin/pip3:
	$(call install,python3-pip)

$(pip_utils_targets): /usr/bin/pip3
	pip3 install $(notdir $@)
