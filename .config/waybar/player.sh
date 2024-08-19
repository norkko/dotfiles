#!/bin/bash

PLAYER_INDEX=$(cat /tmp/player_index 2> /dev/null || echo 0)
players=$(playerctl -l 2> /dev/null)
total_players=$(echo "$players" | wc -l)
current_player=$(echo "$players" | sed -n "$((PLAYER_INDEX + 1))p")

player_status=$(playerctl -p "$current_player" status 2> /dev/null)
artist=$(playerctl -p "$current_player" metadata artist 2> /dev/null)
title=$(playerctl -p "$current_player" metadata title 2> /dev/null)

if [ -n "$artist" ]; then
    bar="$artist - $title"
else
    bar="$title"
fi

if [ "$player_status" == "Paused" ]; then
    echo "[$player_status] $bar"
else
    echo "$bar"
fi