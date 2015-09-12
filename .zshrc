# I moved my oh-my-zsh installation, because I can.
export ZSH=$HOME/.zsh/plugins/oh-my-zsh

[[ -f ~/.zsh/options/platform.sh ]] && source ~/.zsh/options/platform.sh

ZSH_THEME="robbyrussell"

HISTSIZE=1000
HISTFILE=~/.zsh/history
SAVEHIST=20000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
unsetopt SHARE_HISTORY
unsetopt INC_APPEND_HISTORY

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby rails bundler zsh-syntax-hilighting history-substring-search command-not-found sudo archlinux)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH=$HOME/.gem/ruby/2.2.0/bin:$HOME/bin:/usr/local/bin:$PATH

# You may need to manually set your language environment
export LANG=ru_RU.UTF-8

# Show hostname if invoked over SSH.
 if [[ -n $SSH_CONNECTION ]]; then
   export PROMPT="(%m)$PROMPT"
 else
 fi

# VTE Fixes for Termite
 if [[ $TERM == xterm-termite ]]; then
       . /etc/profile.d/vte.sh
         __vte_osc7
       eval $(dircolors ~/.dircolors)
       alias ssh="TERM=xterm ssh -C"
     fi

# Nobody needs flow control anymore.
 setopt noflowcontrol

# Fix for tmux on linux.
 case "$(uname -o)" in
   'GNU/Linux')
           export EVENT_NOEPOLL=1
   ;;
 esac

# Set personal aliases
if [ -d ~/.zsh/aliases ]; then
    for f in ~/.zsh/aliases/*; do
        [ -f "$f" ] && source "$f"
    done
    unset f
fi

# Find a keybind file and source it
[[ -f ~/.zsh/options/keys.sh ]] && source ~/.zsh/options/keys.sh

# Enable lesspipe
[[ -f ~/.zsh/options/less.sh ]] && source ~/.zsh/options/less.sh

# Setup zsh-autosuggestions
source $HOME/.zsh/plugins/autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
