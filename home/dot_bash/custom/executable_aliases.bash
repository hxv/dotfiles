#!/usr/bin/env bash

alias ls='ls --color=auto'
alias grep='grep --color=auto'

hex() {
	local RESERVED=12 # 8 for address, 1 for ':' after address and 2 for '|' after hex and ascii
	local SIZE=$(tput cols)

	local WIDTH=$(( ($SIZE - $RESERVED) / 4 ))

	hexdump -v -e '"%08_ad: "' -e $WIDTH'/1 "%02X "' -e '" |"' -e '"%_p"' -e '"|\n"' "$@" | less
}

alias pcregrep=pcre2grep

alias sudo='sudo ' # https://askubuntu.com/a/22043
alias rm='safe-rm'
#alias youtube-dl='yt-dlp -N 3 --format="bv*[height<=1080]+ba / bv[height<=1080]" --cookies /home/hxv/youtube-cookies.txt --no-mtime --write-link --write-subs --write-auto-subs --sub-langs "en.*" -t mp4 --sleep-subtitles 5 --embed-subs --embed-chapters'
alias youtube-dl='yt-dlp -N 5 --format="bv*[height<=720]+ba/b" --sponsorblock-mark=all --no-overwrites --continue --output="%(channel)s/%(upload_date)s_%(title)s_%(id)s.%(ext)s"'

alias yk='ykman oath accounts code'

