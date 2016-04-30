#!/bin/bash
conky -c ~/.config/herbstluftwm/conkyrc 2>/dev/null | while read line; do herbstclient emit_hook conky $line; done
