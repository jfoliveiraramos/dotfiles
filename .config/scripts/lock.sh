#!/bin/bash

monitors=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

for m in $monitors; do
    hyprshot -m output -m "$m" -r --silent |
        convert png:- -scale 20% -blur 0x2 -resize 200% "/tmp/${m}_screenshot.png" &
done

wait
hyprlock
