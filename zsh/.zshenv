#!/usr/bin/env zsh

#
# .zshenv - Zsh environment file, loaded always.
#

# NOTE: .zshenv needs to live at ~/.zshenv, not in $ZDOTDIR!

# Set ZDOTDIR if you want to re-home Zsh.
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZDOTDIR="${ZDOTDIR:-$XDG_CONFIG_HOME/dotfiles/zsh}"

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

if [ -d /opt/homebrew/bin ]; then
    export HOMEBREW_PREFIX="/opt/homebrew";
    export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
    export HOMEBREW_REPOSITORY="/opt/homebrew";
    export INFOPATH="/opt/homebrew/share/info${INFOPATH+:$INFOPATH}";
    path=(
        /opt/homebrew/(,s)bin(N)
        $path
    )
    manpath=(
        /opt/homebrew/share/man
        $manpath
    )
fi

unset GLOBAL_RCS
