#!/usr/bin/env bash

## Load config file:
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CFGDIR="${XDG_CONFIG_HOME}/herbstluftwm"
. "${CFGDIR}/global.conf"

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
get_volume() { "${CFGDIR}/helpers/volume" get ;}

## Select AWK implementation:
if type mawk >/dev/null 2>&1; then
    AWK="mawk -W interactive"; else
    AWK="awk"; fi

monitor="${1:-0}"
geometry=( $(herbstclient monitor_rect "$monitor") )
[[ -z "$geometry" ]] && echo "Invalid monitor $monitor" && exit 1

# geometry has the format X Y W H
x="${geometry[0]}"
y="${geometry[1]}"
panel_width="${geometry[2]}"

bgcolor="$(herbstclient get frame_border_normal_color)"
selbg="$(herbstclient get window_border_active_color)"
selfg='#101010'

fifo_events="/tmp/panelevents.${monitor}"
[ -e "$fifo_events" ] && rm "$fifo_events"
mkfifo -m600 "$fifo_events"

# Pad the screen to panel height:
hc pad "$monitor" "$PANELHEIGHT"

gentagline () {
    tagline="%{T2}"
    for i in "${!tags[@]}" ; do
        case "${tags[i]:0:1}" in
            '#')
                tagcolor="%{B$selbg}%{F$selfg}"
                ;;
            '+')
                tagcolor="%{B#9CA668}%{F#141414}"
                ;;
            ':')
                tagcolor="%{B-}%{F#ffffff}"
                ;;
            '!')
                tagcolor="%{B#FF0675}%{F#141414}"
                ;;
            *)
                tagcolor="%{B-}%{F#ababab}"
                ;;
        esac
        tagline+="${tagcolor}%{A:herbstclient chain .-. focus_monitor \"${monitor}\" .-. use \"${tags[i]:1}\":} ${tag_icons[i]} %{A}"
    done
}

parsecmd () {
    cmd="$1"
    case "${cmd[0]}" in
        tag*)
            #echo "resetting tags" >&2
            IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
            gentagline
            ;;
        conky)
            #echo "Getting Conky input" >&2
            conky="${cmd[1]}"
            ;;
        quit_panel)
            exit
            ;;
        reload)
            pkill -P $$
            exit
            ;;
        focus_changed|window_title_changed)
            windowtitle="${cmd[2]}"
            ;;
        layout)
            layout="${cmd[1]}"
            ;;
        volume)
            volume="$(get_volume)"
    esac
}

# Now I feed the panel via herbstclient hooks.
# This way I only need one process to be piped to
#  the parser and lemonbar.
herbstclient --idle | $AWK '$0 != l { print ; l=$0 ; fflush(); }' > "$fifo_events" &

## Process stuff:
IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
gentagline
conky=""
layout="$(skb -1)"
windowtitle="Welcome home."
volume="$(get_volume)"
IFS=$'\t'
separator="%{B-}%{F$selbg}|%{F-}"
while read -ra cmd; do
    ### Data handling ###
    # This part handles the events generated in the event loop, and sets
    # internal variables based on them. The event and its arguments are
    # read into the array cmd, then action is taken depending on the event
    # name.
    # "Special" events (quit_panel/togglehidepanel/reload) are also handled
    # here.
    parsecmd "${cmd}"
    # Draw tags and window title:
    printf "%s" "%{T2}${tagline}%{T1}${separator} ${windowtitle//%{/% {}"
    # Draw info stuff on the right side of the panel and finish the line:
    printf "%s\n" "%{r} $layout $separator $volume $separator $conky "
done < "$fifo_events" |\
lemonbar -g "${panel_width}x${PANELHEIGHT}+${x}+${y}" \
         -f "${TEXTFONT}" -f "${GLYPHFONT}" \
         -B "$bgcolor" -F '#efefef'
