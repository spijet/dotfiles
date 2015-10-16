#!/bin/bash

case $1 in
    down)
        xbacklight - 3
        #herbstclient emit_hook volume
        ;;
    up)
        xbacklight + 3
        #herbstclient emit_hook volume
        ;;
esac

