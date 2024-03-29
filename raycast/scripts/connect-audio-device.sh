#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title connect audio device
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🔉

source .env

blueutil --connect $AUDIO_DEVICE_UID

count=0
while [ $count -lt 10 ]; do
  count=$(( $count + 1 ))
  if blueutil --connected | grep -i -q "$AUDIO_DEVICE_UID"; then
    SwitchAudioSource -u $AUDIO_DEVICE_UID
    SwitchAudioSource -t input -u $AUDIO_DEVICE_UID
    break
  fi
  sleep 1
done

