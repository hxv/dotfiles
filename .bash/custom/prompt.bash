#!/usr/bin/env bash

bash_custom_prompt () {
    local last_exit="$?" bg fg text last_bg segment_end=$''

    while read segment; do
        text=""
        fg='38;5;255'

        source "$segment"

        if [[ "$text" == "" ]]; then
            continue
        fi

        if [[ "$last_bg" != "" ]]; then
            echo -ne "\e[$(( $last_bg - 10 ));${bg}m${segment_end}\e[0m"
        fi

        echo -ne "\e[${fg};${bg}m ${text} \e[0m"

        last_bg="$bg"
    done <<< "$(find ~/.bash/custom/prompt \( -type f -or -type l \) -executable | sort)"

    echo -ne "\e[$(( $last_bg - 10 ))m${segment_end}\e[0m"
}

PS1="\$(bash_custom_prompt)
\$ "
