all_targets += git

git_files = ~/.gitconfig ~/.gitignore-global

git_ppa = /etc/apt/sources.list.d/git-core-ubuntu-ppa-$(ubuntu_codename).list

git: /usr/bin/git $(git_files) ~/bin/diff-highlight
.PHONY: git

$(git_files):
	$(call homelink,$@)

$(git_ppa):
	sudo add-apt-repository -y ppa:git-core/ppa

/usr/bin/git: $(git_ppa)
	$(call install,git)
	sudo touch $@

/usr/share/doc/git/contrib/diff-highlight/diff-highlight:
	sudo make -C /usr/share/doc/git/contrib/diff-highlight

~/bin/diff-highlight: /usr/share/doc/git/contrib/diff-highlight/diff-highlight
	rm -rf ~/bin/diff-highlight
	ln -s /usr/share/doc/git/contrib/diff-highlight/diff-highlight ~/bin/diff-highlight
