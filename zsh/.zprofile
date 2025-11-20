#!/usr/bin/env zsh

[[ -f "${HOME}/.profile" ]] && source "${HOME}/.profile"

# Unclutter PATH
typeset -U path
