#!/bin/bash

case $1 in
    down)
        xbacklight - 5
        #herbstclient emit_hook volume
        ;;
    up)
        xbacklight + 5
        #herbstclient emit_hook volume
        ;;
esac

