all_targets += vim

vim_files = ~/.vim ~/.config/nvim ~/.vimrc

vim_ppa = /etc/apt/sources.list.d/neovim-ppa-ubuntu-unstable-$(ubuntu_codename).list

vim: /usr/bin/nvim /usr/local/bin/vim $(vim_files)
.PHONY: vim

$(vim_ppa):
	sudo add-apt-repository -y ppa:neovim-ppa/unstable

/usr/bin/nvim: $(vim_ppa)
	$(call install,neovim)
	sudo touch $@

/usr/local/bin/vim: /usr/bin/nvim
	sudo rm -rf $@
	sudo ln -s /usr/bin/nvim $@

$(vim_files):
	$(call homelink,$@)

