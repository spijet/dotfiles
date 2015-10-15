#!/bin/bash

case $1 in
    down)
        xbacklight - 1
        #herbstclient emit_hook volume
        ;;
    up)
        xbacklight + 1
        #herbstclient emit_hook volume
        ;;
esac

