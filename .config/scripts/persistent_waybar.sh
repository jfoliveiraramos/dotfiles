#!/bin/bash

pid=$(pgrep -x "waybar")

if [ -n "$pid" ]; then
    kill "$pid"
else
    waybar &
fi
