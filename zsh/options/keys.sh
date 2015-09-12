# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "^[[A" history-substring-search-up
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

case $TERM in
	rxvt*|xterm)
		bindkey "^[[7~" beginning-of-line #Home key
		bindkey "^[[8~" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[[A" history-beginning-search-backward #Up Arrow
		bindkey "^[[B" history-beginning-search-forward #Down Arrow
		bindkey "^[Oc" forward-word # control + right arrow
		bindkey "^[Od" backward-word # control + left arrow
		#bindkey "^H" backward-kill-word # control + backspace
		#bindkey "^[[3^" kill-word # control + delete
	;;

	xterm-termite|xterm-256color)
		bindkey "^[[H" beginning-of-line #Home key
		bindkey "^[[F" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[Oc" forward-word # control + right arrow
		bindkey "^[Od" backward-word # control + left arrow
		#bindkey "^H" backward-kill-word # control + backspace
		#bindkey "^[[3^" kill-word # control + delete
	;;

	linux)
		bindkey "^[[1~" beginning-of-line #Home key
		bindkey "^[[4~" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[[A" history-beginning-search-backward
		bindkey "^[[B" history-beginning-search-forward
		bindkey "^H" backward-delete-char
	;;

	screen|screen-*)
		bindkey "^[[1~" beginning-of-line #Home key
		bindkey "^[[4~" end-of-line #End key
		bindkey "^[[3~" delete-char #Del key
		bindkey "^[Oc" forward-word # control + right arrow
		bindkey "^[Od" backward-word # control + left arrow
		bindkey "^H" backward-kill-word # control + backspace
		bindkey "^[[3^" kill-word # control + delete
        bindkey "^[OB" history-substring-search-down
        bindkey "^[OA" history-substring-search-up
	;;
esac
