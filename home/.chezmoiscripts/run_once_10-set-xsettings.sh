#!/bin/bash
set -eu

xfconf-query -c xsettings -p /Net/ThemeName -n -t string -s "Numix"
xfconf-query -c xsettings -p /Net/IconThemeName -n -t string -s "elementary-xfce-hidpi"
