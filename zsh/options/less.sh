# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-g -i -M -R -s -w -z-4'

# Set the Less input preprocessor.
if (( $+commands[lesspipe.sh] )); then
      export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi
