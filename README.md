# hxv/dotfiles
Collection of my dotfiles :)

Some applications may be required for everything to work properly. To install them under Xubuntu run:
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install git i3 i3lock kupfer tmux neovim xbacklight xclip
```
(list of dependencies problably is not complete)

Repository itself contains submodules, so you should either use `git clone --recurse-submodules` to clone it or run `git submodule update --init` after cloning.

Media keys (play/pause, next, prev) are handled with [playerctl](https://github.com/acrisci/playerctl).
