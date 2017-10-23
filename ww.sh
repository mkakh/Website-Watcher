#!/bin/bash

set -eu

## EDIT HERE ####################
INTERVAL=30s
MP3="${HOME}/Music/hogefuga.mp3"
DIFF_OPTIONS=""
#################################

if [ $# -ne 1 ]; then
    echo "Usage: $0 [target]"
    exit 1
fi

TARGET="$1"

function get_html() {
    curl "$TARGET" 2>/dev/null
}

DIFF="$(get_html)"

echo "-- START WATCHING --"
while true; do
    diff ${DIFF_OPTIONS} <(echo "$(get_html)") <(echo "$DIFF") \
            || mpg123 "$MP3"
    sleep ${INTERVAL}
done
