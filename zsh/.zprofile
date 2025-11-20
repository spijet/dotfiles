#!/usr/bin/env zsh

[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

# Unclutter PATH and FPATH:
typeset -gU path fpath
