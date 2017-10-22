#!/bin/bash

set -eu

## EDIT HERE ####################
INTERVAL=30s
TARGET="http://www.mkakh.com/"
MP3="${HOME}/Music/hogefuga.mp3"
#################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 [target]"
fi

DIFF="$(curl $TARGET 2>/dev/null)"

while true; do
    diff <(curl "$TARGET" 2>/dev/null) <(echo "$DIFF")
            || mpg123 "$MP3"
    sleep ${INTERVAL}
done
