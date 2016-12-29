#!/usr/bin/env bash

## Load config file:
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
CFGDIR="${XDG_CONFIG_HOME}/herbstluftwm"
. "${CFGDIR}/global.conf"

hc() { "${herbstclient_command[@]:-herbstclient}" "$@" ;}
get_volume() { "${CFGDIR}/helpers/volume" get ;}

monitor="${1:-0}"
geometry=$(herbstclient monitor_rect "$monitor" | $AWK "{printf \"%sx%s+%s+%s\"values,\$3,\"${PANELHEIGHT}\",\$1,\$2;}")
[[ -z "$geometry" ]] && echo "Invalid monitor $monitor" && exit 1

bgcolor="$(herbstclient get frame_border_normal_color)"
selbg="$(herbstclient get window_border_active_color)"
selfg='#101010'

fifo_events="/tmp/panelevents.${monitor}"
[ -e "$fifo_events" ] && rm "$fifo_events"
mkfifo -m600 "$fifo_events"

# Pad the screen to panel height:
hc pad "$monitor" "$PANELHEIGHT"

## Read the taglist and create the tag widget contents:
gentagline () {
    # Switch the font to glyphs:
    tagline="%{T2}"
    # Read the tag list:
    IFS=$'\t' read -ra tags <<< "$(hc tag_status $monitor)"
    ## Tag statuses:
    #  '#' -- Tag is active and focused on current monitor;
    #  '+' -- Tag is active on current monitor,
    #         but another monitor is focused;
    #  ':' -- Tag is not active, but contains windows;
    #  '!' -- Tag contains an urgent window.
    for i in "${!tags[@]}" ; do
        case "${tags[i]:0:1}" in
            '#' ) tagcolor="%{B$selbg}%{F$selfg}";;
            '+' ) tagcolor="%{B#9CA668}%{F#141414}";;
            ':' ) tagcolor="%{B-}%{F#ffffff}";;
            '!' ) tagcolor="%{B#FF0675}%{F#141414}";;
            *   ) tagcolor="%{B-}%{F#ababab}";;
        esac
        tagline+="${tagcolor}%{A:herbstclient chain .-. focus_monitor \"${monitor}\" .-. use \"${tags[i]:1}\":} ${tag_icons[i]} %{A}"
    done
    #  Switch font back to text:
    tagline+="%{T1}"
}

parsecmd () {
    #  The event and its arguments are read into the array cmd, then action is taken
    #  depending on the event name. "Special" events
    #  (quit_panel/togglehidepanel/reload) are also handled here.
    cmd="$1"
    case "${cmd[0]}" in
        tag*       ) gentagline;;
        conky      ) conky="${cmd[1]}";;
        quit_panel ) exit;;
        reload     )
            pkill -P $$
            rm "$fifo_events"
            exit
            ;;
        *changed   ) windowtitle="${cmd[2]}";;
        layout     ) layout="${cmd[1]}";;
        volume     ) volume="$(get_volume)";;
    esac
}

## Feed the event loop:
#  I feed the panel via herbstclient hooks.
#  I also pipe the event list via awk to get rid of identical events (like
#  redundant conky updates).
herbstclient --idle | $AWK '$0 != l { print ; l=$0 ; fflush(); }' > "$fifo_events" &

## Pre-fill data:
gentagline
conky=""
layout="$(skb -1)"
windowtitle="Welcome home."
volume="$(get_volume)"
separator="%{B-}%{F$selbg}|%{F-}"

## Here comes the event loop:
while IFS=$'\t' read -ra cmd; do
    # Parse the event:
    parsecmd "${cmd}"
    # Draw tags and window title:
    printf "%s" "${tagline}${separator} ${windowtitle//%{/% {}"
    # Draw info stuff on the right side of the panel and finish the line:
    printf "%s\n" "%{r} $layout $separator $volume $separator $conky "
done < "$fifo_events" |\
    lemonbar -g "${geometry}" \
             -f "${TEXTFONT}" -f "${GLYPHFONT}" \
             -B "$bgcolor" -F '#efefef'
