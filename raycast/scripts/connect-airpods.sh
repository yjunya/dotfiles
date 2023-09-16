#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title connect airpods
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔉

source .env

blueutil --connect $AIRPODS_ADDRESS

