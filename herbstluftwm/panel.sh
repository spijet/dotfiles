#!/usr/bin/env bash

## Load config file:
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CFGDIR="${XDG_CONFIG_HOME}/herbstluftwm"
source "${CFGDIR}/global.conf"

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
get_volume() { "${CFGDIR}/helpers/volume" get ;}

## Select AWK implementation:
if type mawk >/dev/null 2>&1; then
    uniq_linebuffered() { mawk -W interactive '$0 != l { print ; l=$0 ; fflush(); }' "$@" ;}; else
    uniq_linebuffered() { awk '$0 != l { print ; l=$0 ; fflush(); }' "$@" ;}
fi

monitor="${1:-0}"
geometry=( $(herbstclient monitor_rect "$monitor") )

if [[ -z "$geometry" ]] ;then
    echo "Invalid monitor $monitor"
    exit 1
fi

# geometry has the format X Y W H
x="${geometry[0]}"
y="${geometry[1]}"
panel_width="${geometry[2]}"
panel_height="14"

bgcolor="$(herbstclient get frame_border_normal_color)"
selbg="$(herbstclient get window_border_active_color)"
selfg='#101010'

# Pad the screen to panel height:
hc pad "$monitor" "$panel_height"

# Now I feed the panel via herbstclient hooks.
# This way I only need one process to be piped to
#  the parser and lemonbar.
herbstclient --idle 2>/dev/null | {
    IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
    visible=true
    conky=""
    layout="$(skb -1)"
    windowtitle="Welcome home."
    volume="$(get_volume)"
    while true ; do

        ### Output ###
        # This part prints panel data based on the _previous_ data handling run,
        # and then waits for the next event to happen.
        separator="%{B-}%{F$selbg}|%{F-}"
        # draw tags
        for i in "${!tags[@]}" ; do
            case "${tags[i]:0:1}" in
                '#')
                    echo -n "%{B$selbg}%{F$selfg}"
                    ;;
                '+')
                    echo -n "%{B#9CA668}%{F#141414}"
                    ;;
                ':')
                    echo -n "%{B-}%{F#ffffff}"
                    ;;
                '!')
                    echo -n "%{B#FF0675}%{F#141414}"
                    ;;
                *)
                    echo -n "%{B-}%{F#ababab}"
                    ;;
            esac
            echo -n "%{A:herbstclient focus_monitor \"${monitor}\" && herbstclient use \"${tags[i]:1}\":} %{T2}${tag_icons[i]}%{T1} %{A}"
        done
        echo -n "${separator}"
        echo -n "%{B-}%{F-} ${windowtitle//%{/% {}"
        echo -n "%{r} $layout $separator $volume $separator "
        echo -n "$conky "
        echo

        ### Data handling ###
        # This part handles the events generated in the event loop, and sets
        # internal variables based on them. The event and its arguments are
        # read into the array cmd, then action is taken depending on the event
        # name.
        # "Special" events (quit_panel/togglehidepanel/reload) are also handled
        # here.
        # wait for next event
        IFS=$'\t' read -ra cmd || break
        # find out event origin
        case "${cmd[0]}" in
            tag*)
                #echo "resetting tags" >&2
                IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
                ;;
            conky)
                #echo "Getting Conky input" >&2
                conky="${cmd[@]:1}"
                ;;
            quit_panel)
                exit
                ;;
            reload)
                kill $$
                exit
                ;;
            focus_changed|window_title_changed)
                windowtitle="${cmd[@]:2}"
                ;;
            layout)
                layout="${cmd[@]:1}"
                ;;
            volume)
                volume="$(get_volume)"
        esac
    done

    ### bar ###
    # After the data is gathered and processed, the output of the previous block
    # gets piped to (lemon)bar.

} 2> /dev/null | uniq_linebuffered | lemonbar -g "${panel_width}x${panel_height}+${x}+${y}" \
                          -f "${TEXTFONT}" -f "${GLYPHFONT}" \
                          -B "$bgcolor" -F '#efefef'
