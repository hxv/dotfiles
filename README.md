# hxv/dotfiles
Collection of my dotfiles :)

Some applications may be required for everything to work properly. To install them (and some other tools used by me) under Xubuntu run:
```
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
# required apps
sudo apt install git i3 i3lock rofi tmux neovim xbacklight xclip scrot i3lock imagemagick golang-go pcregrep fzf feh playerctl neovim
# additional apps
sudo apt install gnupg2 gdebi-core curl ranger sshfs transmission-remote-cli htop net-tools jq libxml2-utils python3-pip kolourpaint bindfs whois nmap lnav expect pcregrep pgcli
pip install termdown
# yubikey
sudo apt install pcscd scdaemon gnupg2 pcsc-tools
go get github.com/edi9999/path-extractor/path-extractor
```
(list of dependencies problably is not complete)

Repository itself contains submodules, so you should either use `git clone --recurse-submodules` to clone it or run `git submodule update --init` after cloning.

You can run `setup` script to create symlinks to files in your home directory.
Existing files will we backed up (or deleted, if they are identical to ones in repo).

## Scripts

### `pp`
`pp` reads lines from stdin, finds paths (using `path-extractor`), allows to select some files (using `fzf`) and executes command passing paths as arguments.

```bash
git status -u | pp vim
```
