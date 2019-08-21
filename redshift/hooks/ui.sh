#!/usr/bin/env bash
# DEP: "uitime" script
# DEP: libnotify

if [[ "${1}" = "period-changed" ]]; then
    OLDSTATE="${2}"
    NEWSTATE="${3}"
    case "${NEWSTATE}" in
        day*)
            MODE='day'
            ;;
        night*)
            MODE='night'
            ;;
        *)
            MODE='normal'
            ;;
    esac
    exec "${HOME}/.local/bin/uitime" "${MODE}"
fi
