#!/usr/bin/env bash

# if not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

for CUSTOM in $(find ~/.bash/custom/ -name '*.bash' -type f,l -executable); do
    source "$CUSTOM"
done

