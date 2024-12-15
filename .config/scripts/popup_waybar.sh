#!/bin/bash

pid=$(pgrep -x "waybar")

if [ -n "$pid" ]; then
    kill "$pid"
else
    waybar &
    WAYBAR_PID=$!
    DISPLAY_DURATION=5
    sleep $DISPLAY_DURATION
    kill $WAYBAR_PID
fi
