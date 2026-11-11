#!/bin/bash
set -eu

xfconf-query -c xsettings -p /Net/ThemeName -n -t string -s "Numix"
xfconf-query -c xsettings -p /Net/IconThemeName -n -t string -s "elementary-xfce-hidpi"
xfconf-query -c xsettings -p /Gtk/FontName -n -t string -s "Sans 10"
xfconf-query -c xsettings -p /Gtk/MonospaceFontName -n -t string -s "Monospace 10"
xfconf-query -c xsettings -p /Xft/DPI -n -t int -s 96
