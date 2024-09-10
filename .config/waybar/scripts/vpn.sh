#!/bin/bash

tunneling=$(curl -m 1 -sS https://am.i.mullvad.net/json | jq '.mullvad_exit_ip')
type=$(curl -sS -m 1 https://am.i.mullvad.net/json | jq -r '.mullvad_server_type')
hostname=$(curl -sS -m 1 https://am.i.mullvad.net/json | jq -r '.mullvad_exit_ip_hostname')
organization=$(curl -sS -m 1 https://am.i.mullvad.net/json | jq -r '.organization')
ip=$(curl -sS -m 1 https://am.i.mullvad.net/json | jq -r '.ip')

if [ -z $tunneling ]; then
    ping -c 1 -i 0.2 9.9.9.9 >& /dev/null
    if [ $? -ne 1 ]; then
        echo "{\"text\":\"     VPN service down! $?\", \"tooltip\":\"\"}"
    else
        echo "{\"text\":\"\", \"tooltip\":\"\"}"
    fi
    exit 0
fi

if $tunneling ; then
    echo "{\"text\":\"󰀂 \", \"tooltip\":\"$type\n$ip\n$hostname\"}"
else
    echo "{\"text\":\"     VPN offline.\", \"tooltip\":\"$organization\n$ip\"}"
fi
