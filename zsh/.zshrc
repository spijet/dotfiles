# History settings
HISTSIZE=1000
SAVEHIST=20000
HISTFILE="${HOME}/.cache/zsh-history"

setopt AUTO_CD
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY


# Set up antibody:
source <(antibody init)

# Set up BASEDIR (in case $ZDOTDIR is unset)
BASEDIR="${ZDOTDIR:-$HOME/.config/zsh}"

# Load plugins as a bundle.
antibody bundle < "${BASEDIR}/plugins.txt"

# Load Pure prompt theme
PURE_CMD_MAX_EXEC_TIME=1
antibody bundle sindresorhus/pure

#
# Load syntax highlighting and fuzzy search modules,
# these two guys **MUST** be loaded last.
#
antibody bundle <<EOF
zsh-users/zsh-syntax-highlighting
zsh-users/zsh-history-substring-search
EOF

# Load custom keybinds, if any.
if [[ -d "${BASEDIR}/modules/keybinds" ]]; then
    for file in ${BASEDIR}/modules/keybinds/*; do
        source $file
    done
    unset file
fi

# Load all the aliases:
if [[ -d "${BASEDIR}/modules/aliases" ]]; then
    for file in ${BASEDIR}/modules/aliases/*; do
        source $file
    done
    unset file
fi

# Load all the extensions:
if [[ -d "${BASEDIR}/modules/extensions" ]]; then
    for file in ${BASEDIR}/modules/extensions/*; do
        source $file
    done
    unset file
fi

# VTE Fixes for Termite:
 if [[ $TERM == xterm-termite ]]; then
   eval $(dircolors ~/.dircolors)
   alias ssh="TERM=xterm ssh -C"
 fi

# Unclutter PATH
typeset -U path

# Load ZSH completions:
autoload -U compinit && compinit
# zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

echo "[3m$(fortune -sa)"
