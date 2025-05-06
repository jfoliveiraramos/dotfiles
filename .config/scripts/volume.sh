#!/bin/bash

step=5

vol_pct=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1 | tr -d '%')
mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')

if [ "$1" = "--up" ]; then
    if [ "$vol_pct" -lt 100 ]; then
        pactl set-sink-volume @DEFAULT_SINK@ +"$step"%
    fi
elif [ "$1" = "--down" ]; then
    pactl set-sink-volume @DEFAULT_SINK@ -"$step"%
else
    echo "Usage: $0 [--up|--down]"
    exit 1
fi

vol_pct=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -n1 | tr -d '%')

if [ "$mute" = "yes" ]; then
    icon="󰝟"
else
    if [ "$vol_pct" -lt 30 ]; then
        icon="󰕿"
    elif [ "$vol_pct" -lt 70 ]; then
        icon="󰖀"
    else
        icon="󰕾"
    fi
fi

message="$icon ${vol_pct}%"
dunstify -r 9999 -u low -t 1000 -h string:x-dunst-stack-tag:volume "$message"
