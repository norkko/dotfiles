#!/bin/bash

# player_status=$(playerctl status 2> /dev/null)
artist=$(playerctl status 2> /dev/null)
title=$(playerctl status 2> /dev/null)

echo "$(title) - $(title)"
