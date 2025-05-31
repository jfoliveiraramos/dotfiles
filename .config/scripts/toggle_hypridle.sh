#!/bin/bash

if [ "$(systemctl is-active --user hypridle.service)" = "active" ]; then
    systemctl --user stop hypridle.service
    lock="Disabled"
else
    systemctl --user start hypridle.service
    lock="Enabled"
fi

message="󰥿 Lock ${lock}"
dunstify -r 9997 -u low -t 1000 -h string:x-dunst-stack-tag:osd "$message"
