#!/usr/bin/env bash

HOME=$(realpath ~)

export LESS=-XRF
export VISUAL='vim'
export EDITOR="$VISUAL"
export GOPATH="$HOME/.go/"
export HISTFILESIZE=
export HISTSIZE=
export HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history
export COMPOSER_HOME="$HOME/.config/composer/"
