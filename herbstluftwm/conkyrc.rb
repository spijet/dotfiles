#!/usr/bin/env ruby
# coding: utf-8

BAT = ENV['BAT'] || "BAT0"
CONKY_CFG = <<EOF
conky.config = {
    background = false,
    cpu_avg_samples = 2,
    net_avg_samples = 2,
    no_buffers = true,
    out_to_console = true,
    out_to_stderr = false,
    out_to_x = false,
    extra_newline = false,
    update_interval = 2.0,
    uppercase = false,
    pad_percents = 2,
    short_units = yes
}

conky.text = [[
conky	\\
# MPD Status
${if_mpd_playing}%{F\\#9fbc00}♪%{F-} %{F\\#909090}%{A:mpc toggle:}${mpd_artist} - %{F-}${mpd_title} %{A}%{F\\#9fbc00}|%{F-} ${endif}\\
# Battery
${if_existing /sys/class/power_supply/#{BAT}/status}${battery_short #{BAT}}${endif}${if_existing /sys/class/power_supply/#{BAT}/power_now}:${execi 10 bc <<< \"scale=1; $(</sys/class/power_supply/#{BAT}/power_now)/1000000\"}W %{F\\#9fbc00}|%{F-}${endif}\\
# Time and Date
 ${time %H:%M \%\{F\#909090\}%Y\%\{F\#bcbcbc\}%m\%\{F\#efefef\}%d} \\
# Weather script
%{F\\#9fbc00}|%{F-} ${execi 120 cat /tmp/weatherdata}\\
]]
EOF

puts CONKY_CFG
