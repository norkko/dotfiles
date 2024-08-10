#!/bin/bash
player_status=$(playerctl status 2> /dev/null)
echo "$(playerctl metadata artist) - $(playerctl metadata title)"
