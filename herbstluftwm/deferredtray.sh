#!/bin/bash
for command in trayer trayer-srg
do
    which "${command}" >/dev/null 2>&1 && TRAYER_COMMAND="$(which ${command})"
done
if [[ -x "${TRAYER_COMMAND}" ]]; then
    sleep 3
    pgrep 'trayer' >/dev/null || \
        "${TRAYER_COMMAND}" \
            --edge top --align center --widthtype request \
            --heighttype pixel --height 14 --transparent true \
            --alpha 0 --tint 0x101010 --align right \
            --distancefrom right --distance 330 &
    pgrep 'nm-applet' >/dev/null || nm-applet &
fi
