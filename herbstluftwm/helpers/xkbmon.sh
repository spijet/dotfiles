#!/bin/bash

skb | \
    while read line
    do
        herbstclient emit_hook layout $line
    done &
disown
