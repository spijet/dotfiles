#!/usr/bin/env bash

hc() { herbstclient "$@" ;}

# loads layouts for each tag coming from file specified by $1
# the format is the one created by savestate.sh

# a common usage is:
# savestate.sh > mystate
# and sometime later:
# loadstate.sh < mystate

while read line ; do
    tag="${line%%: *}"
    tree="${line#*: }"
    hc add "$tag"
    hc load "$tag" "$tree"
done < "$1"
