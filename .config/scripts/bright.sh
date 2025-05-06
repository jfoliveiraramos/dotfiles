#!/bin/bash
step=5

if [ "$1" = "--up" ]; then
    brightnessctl set +"$step"%
elif [ "$1" = "--down" ]; then
    brightnessctl set "$step"%-
else
    echo "Usage: $0 [--up|--down]"
    exit 1
fi

current=$(brightnessctl g)
max=$(brightnessctl m)
pct=$((100 * current / max))

message="󰃠 ${pct}%"
dunstify -r 9999 -u low -t 1000 -h string:x-dunst-stack-tag:osd "$message"
