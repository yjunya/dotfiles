#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title open rubymine
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🛤️

source .env

sh ./open-app-in-dir.sh /Applications/RubyMine.app $WORKSPACE_PATH &
