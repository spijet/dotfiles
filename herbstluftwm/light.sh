#!/bin/bash
set -x

# Read current PWM frequency and set delta and cap
setmode() {
    PWMFREQ=$(cat /tmp/pwmfreq)
    if [ "${PWMFREQ}" = "125" ]; then
        BL_DELTA="15"
        BL_CAP="127"
    else
        BL_DELTA="55"
        BL_CAP="937"
    fi
}

up() {
    CUR_BRIGHT=$(</sys/class/backlight/intel_backlight/brightness)
    NEW_BRIGHT=$(( CUR_BRIGHT + BL_DELTA ))

    # Avoid overbrights so there's no need to decrease brightness all the way from 900%
    [ "${NEW_BRIGHT}" -gt "${BL_CAP}" ] && NEW_BRIGHT="${BL_CAP}"

    echo "${NEW_BRIGHT}" | sudo tee /sys/class/backlight/intel_backlight/brightness
}

down() {
    CUR_BRIGHT=$(</sys/class/backlight/intel_backlight/brightness)
    NEW_BRIGHT=$(( CUR_BRIGHT - BL_DELTA ))

    # Avoid total darkness
    [ "${NEW_BRIGHT}" -lt "1" ] && NEW_BRIGHT="1"
    # Added this because switching to hi-freq backlight
    # usually results in brightness set to something like 250%
    [ "${NEW_BRIGHT}" -gt "${BL_CAP}" ] && NEW_BRIGHT="${BL_CAP}"

    echo "${NEW_BRIGHT}" | sudo tee /sys/class/backlight/intel_backlight/brightness
}

setmode
case $1 in
    down)
        down
        ;;
    up)
        up
        ;;
esac

notify-send "Brightness: $(( NEW_BRIGHT * 100 / BL_CAP))%"
