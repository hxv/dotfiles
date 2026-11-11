#!/bin/bash
# Skrypt usuwa wszystkie skróty klawiszowe w Xfce.
set -eu

xfconf-query -c xfce4-keyboard-shortcuts -l | grep -P '/(commands|xfwm4)/custom/' | while read -r prop; do
    xfconf-query -c xfce4-keyboard-shortcuts -p "$prop" -r
done
