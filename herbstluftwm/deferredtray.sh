#!/bin/bash
sleep 3
pgrep 'trayer' > /dev/null || trayer --edge top --align center --widthtype request --heighttype pixel --height 14 --transparent true --alpha 0 --tint 0x101010 --align right --distancefrom right --distance 310 &
pgrep 'nm-applet' > /dev/null || nm-applet
pgrep 'redshift' > /dev/null || redshift-gtk
