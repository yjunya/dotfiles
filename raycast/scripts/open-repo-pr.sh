#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open PR of specific repository
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🧑‍💻

source .env

cd $REPOSITORY_PATH

eval "$(gh pr view --web)"
