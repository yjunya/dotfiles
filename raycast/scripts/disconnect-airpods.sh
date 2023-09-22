#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title disconnect airpods
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔇

source .env

blueutil --disconnect $AIRPODS_ADDRESS

