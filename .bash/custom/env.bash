#!/usr/bin/env bash

HOME=$(realpath ~)

export LESS=-XRF
export VISUAL='vim'
export EDITOR="$VISUAL"
export GOPATH="$HOME/.go/"
export HISTFILESIZE=100000
export HISTSIZE=10000
export HISTCONTROL=ignoreboth # don't put duplicate lines or lines starting with space in the history
export COMPOSER_HOME="$HOME/.config/composer/"
