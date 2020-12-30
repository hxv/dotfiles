#!/usr/bin/env bash

NPM_PACKAGES="${HOME}/.npm-packages"

export PATH="$PATH:$NPM_PACKAGES/bin"

export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

