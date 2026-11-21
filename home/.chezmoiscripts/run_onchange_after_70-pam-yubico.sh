#!/usr/bin/env bash
set -Eeuo pipefail
shopt -s inherit_errexit

file="$HOME/.config/Yubico/u2f_keys"
if [ ! -f "$file" ]; then
  pamu2fcfg -u "$USER" > "$file"
  chmod 0644 "$file"
fi

grep -qP 'pam_u2f\.so' /etc/pam.d/sudo || sudo sed -i '0,/^@include/s|^@include|auth sufficient pam_u2f.so cue\n&|' /etc/pam.d/sudo
