#!/bin/bash

player_status=$(playerctl status 2> /dev/null)
artist=$(playerctl metadata artist 2> /dev/null)
title=$(playerctl metadata title 2> /dev/null)

bar="$artist - $title"
if [ $player_status == "Paused" ]; then
    echo "[$player_status] $bar"
else
    echo $bar
fi