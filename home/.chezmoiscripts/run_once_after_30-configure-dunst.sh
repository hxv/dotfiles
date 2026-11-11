#!/bin/bash
# Disable xfce4-notifyd.service (we're using dunst instead).
set -eu

systemctl --user stop xfce4-notifyd.service
systemctl --user mask xfce4-notifyd.service

mkdir -p ~/.config/systemd/user/dunst.service.d
cat << 'EOF' > ~/.config/systemd/user/dunst.service.d/autostart.conf
[Unit]
After=graphical-session.target

[Service]
ExecStartPre=/bin/sleep 2

[Install]
WantedBy=graphical-session.target
EOF

systemctl --user daemon-reload
systemctl --user enable --now dunst.service
