#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title disconnect audio device
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔇

source .env

blueutil --disconnect $AUDIO_DEVICE_UID

