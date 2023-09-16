#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title open rubymine in server
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🛤️

source .env

cd $WORKSPACE_PATH

eval "$(rtx hook-env -s bash)"

open /Applications/RubyMine.app

