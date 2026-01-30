#!/usr/bin/env zsh

# History settings
HISTSIZE=20000
SAVEHIST="${HISTSIZE}"
HISTFILE="${HOME}/.cache/zsh-history"

setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY

# Set up BASEDIR (in case $ZDOTDIR is unset)
BASEDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# Load ZSH styles:
[[ -f "${BASEDIR}/.zstyles" ]] && source "${BASEDIR}/.zstyles"

# Set up Antidote:
source "${BASEDIR}/antidote/antidote.zsh"

# Punish me for not using proper aliases:
export ZSH_PLUGINS_ALIAS_TIPS_FORCE=1
# Print prompt timer if command runs for more than 1 second:
export PURE_CMD_MAX_EXEC_TIME=1

# Load all plugins from list:
antidote load
autoload -Uz promptinit && promptinit && prompt pure

# Load custom functions, if any.
if [[ -d "${BASEDIR}/functions" ]]; then
    for file in ${BASEDIR}/functions/*; do
        [[ -f "${file}" ]] && [[ -x "${file}" ]] && source "${file}"
    done
    unset file
fi

# Load custom keybinds, if any.
if [[ -d "${BASEDIR}/modules/keybinds" ]]; then
    for file in ${BASEDIR}/modules/keybinds/*; do
        [[ -f "${file}" ]] && [[ -x "${file}" ]] && source "${file}"
    done
    unset file
fi

# Load all the aliases:
if [[ -d "${BASEDIR}/modules/aliases" ]]; then
    for file in ${BASEDIR}/modules/aliases/*; do
     [[ -f "${file}" ]] && [[ -x "${file}" ]] && source "${file}"
    done
    unset file
fi

# Load all the extensions:
if [[ -d "${BASEDIR}/modules/extensions" ]]; then
    for file in ${BASEDIR}/modules/extensions/*; do
     [[ -f "${file}" ]] && [[ -x "${file}" ]] && source "${file}"
    done
    unset file
fi

# VTE Fixes for Termite:
 if [[ "${TERM}" =~ 'xterm-termite|alacritty' ]]; then
   eval "$(dircolors ~/.dircolors)"
   alias ssh="TERM=xterm ssh -C"
 fi

# Unclutter PATH
typeset -U path

# Load ZSH completions:
autoload -Uz compinit
setopt extendedglob
if [[ -n "${ZDOTDIR}"/.zcompdump(#qN.mh+24) ]]; then
    echo "Cache miss!"
	  compinit
    touch "${ZDOTDIR}/.zcompdump"
else
    compinit -C
fi
unsetopt extendedglob

# zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

if type fortune &>/dev/null && [[ -o interactive ]]; then
    echo "[3m$(fortune -sa)[0m"
fi
