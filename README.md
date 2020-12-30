# hxv/dotfiles
Collection of my dotfiles :)

`Makefile` should install all apps and link all configuration files. I wouldn't recommend running it by anyone but me - existing files will be removed, new packages will be installed.

To setup everything on clean Xubuntu installation run:
```bash
sudo apt install -y make git
mkdir ~/Code
cd Code
git clone --recurse-submodules https://github.com/hxv/dotfiles.git
cd dotfiles
make
```
