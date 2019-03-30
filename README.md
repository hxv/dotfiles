# hxv/dotfiles
Collection of my dotfiles :)

Some applications may be required for everything to work properly. To install them under Xubuntu run:
```
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install git i3 i3lock rofi tmux neovim xbacklight xclip scrot i3lock imagemagick golang-go pcregrep
go get github.com/edi9999/path-extractor/path-extractor
```
(list of dependencies problably is not complete)

Repository itself contains submodules, so you should either use `git clone --recurse-submodules` to clone it or run `git submodule update --init` after cloning.

Media keys (play/pause, next, prev) are handled with [playerctl](https://github.com/acrisci/playerctl).

You will also need:
* [fzf](https://github.com/junegunn/fzf)

You can run `setup` script to create symlinks to files in your home directory.
Existing files will we backed up (or deleted, if they are identical to ones in repo).

## Scripts

### `pp`
`pp` reads lines from stdin, finds paths (using `path-extractor`), allows to select some files (using `fzf`) and executes command passing paths as arguments.

```bash
git status -u | pp vim
```
