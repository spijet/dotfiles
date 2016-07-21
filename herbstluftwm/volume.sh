#!/bin/bash
set -x

parse_volume() {
    [ "${CUR_VOLUME}" = "Mute" ] && OUTPUT=`printf "%b" "\ue04f"` && return 0
    (( CUR_VOLUME>=60 )) && OUTPUT=`printf "%b" "\ue05d ${CUR_VOLUME}%"` && return 0
    (( CUR_VOLUME>=30 && CUR_VOLUME<60 )) && OUTPUT=`printf "%b" "\ue050 ${CUR_VOLUME}%"` && return 0
    (( CUR_VOLUME<30 )) && OUTPUT=`printf "%b" "\ue04e ${CUR_VOLUME}%"` && return 0
}

get_volume() {
    CUR_VOLUME=`amixer get Master | awk '/Front Left:.+/ {print $6=="[off]"?"Mute":$5}' | tr -d '[%]'`
    parse_volume
    echo "${OUTPUT}"
}

case $1 in
    down)
        amixer -q set Master 2%- unmute
        herbstclient emit_hook volume
        ;;
    up)
        amixer -q set Master 2%+ unmute
        herbstclient emit_hook volume
        ;;
    mute)
        amixer -q set Master toggle
        herbstclient emit_hook volume
        ;;
    get)
        get_volume
        ;;
esac
