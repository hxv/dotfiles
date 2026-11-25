#!/usr/bin/env bash

export VISUAL='vim'
export EDITOR="$VISUAL"
export SUDO_EDITOR="$VISUAL"

export LESS=-XRF
export LESSANSIENDCHARS=mK

export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history
export FZF_DEFAULT_OPTS='--color=fg:7,fg+:255,hl:2,hl+:10,info:12,prompt:12,pointer:255,marker:12,spinner:12,header:12'
