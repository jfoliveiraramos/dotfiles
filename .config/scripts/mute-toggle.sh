#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
vol_pct=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1 | tr -d '%')

if [ "$mute" = "yes" ]; then
    icon="󰝟" # nf-md-volume_mute
    msg="Muted"
else
    if [ "$vol_pct" -lt 30 ]; then
        icon="󰕿" # nf-md-volume_low
    elif [ "$vol_pct" -lt 70 ]; then
        icon="󰖀" # nf-md-volume_medium
    else
        icon="󰕾" # nf-md-volume_high
    fi
    msg="Unmuted"
fi

dunstify -r 9999 -u low -t 1000 -h string:x-dunst-stack-tag:volume "$icon $msg · ${vol_pct}%"
