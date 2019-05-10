#!/usr/bin/env bash

hex() {
	local RESERVED=12 # 8 for address, 1 for ':' after address and 2 for '|' after hex and ascii
	SIZE=$(tput cols)

	WIDTH=$(( ($SIZE - $RESERVED) / 4 ))

	hexdump -v -e '"%08_ad: "' -e $WIDTH'/1 "%02X "' -e '" |"' -e '"%_p"' -e '"|\n"' "$@" | less
}

alias xgrep='cut -d ":" -f 1,2 | tr "\n" " " | head -c -1 ; echo'

alias cleanup-history='cat -n ~/.bash_history | sort -rk2 | sort -uk2 | sort -nk1 | cut -f2- > /tmp/.bash_history ; mv /tmp/.bash_history ~/.bash_history'
alias sudo='sudo ' # https://askubuntu.com/a/22043
