#!/usr/bin/env bash

export HOSTFILE=~/.hosts

complete -A hostname -o default curl dig host netcat ping telnet nc
