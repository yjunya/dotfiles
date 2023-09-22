#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title restart-vpn
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 📶

source .env

scutil --nc stop $VPN_NAME

count=0
while [ $count -lt 60 ]; do
  count=$(( $count + 1 ))
  if [[ "$(scutil --nc status $VPN_NAME | head -n 1)" == "Disconnected" ]]; then
    scutil --nc start $VPN_NAME --user $USER --password $PASSWORD --secret $VPN_SECRET
    break
  fi
  sleep 1
done

