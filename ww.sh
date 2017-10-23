#!/bin/bash

set -eu

## EDIT HERE ####################
INTERVAL=10s
MP3="${HOME}/Music/hogefuga.mp3"
DIFF_OPTIONS=""
#################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 [target]"
    exit 1
fi

TARGET="$1"
DIFF="$(curl $TARGET 2>/dev/null)"

echo "-- START WATCHING --"
while true; do
    diff ${DIFF_OPTIONS} <(curl "$TARGET" 2>/dev/null) <(print "$DIFF") \
            || mpg123 "$MP3"
    sleep ${INTERVAL}
done
