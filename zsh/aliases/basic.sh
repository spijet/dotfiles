# Basic stuff
alias zshconf="vim ~/.zshrc"
alias fping='/usr/sbin/fping'
alias dmesg='dmesg -HL'
alias nano='nano -w'
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep="grep --color=tty -d skip $GREP_OPTIONS"
unset GREP_OPTIONS
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
