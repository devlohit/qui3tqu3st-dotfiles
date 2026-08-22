#!/usr/bin/env zsh

LEN=24
ICON="󰝛"

while true; do
    if playerctl -l 2>/dev/null | grep -q .; then
        # A player exists — launch zscroll in background
        zscroll -l "$LEN" \
            --delay 0.3 \
            --update-check true \
            "playerctl metadata --format '{{title}} - {{artist}}'" 2>/dev/null &
        zscroll_pid=$!

        # Keep zscroll running only while a player still exists
        while playerctl -l 2>/dev/null | grep -q .; do
            sleep 0
        done

        # Player closed — kill zscroll cleanly before looping back
        kill "$zscroll_pid" 2>/dev/null
        wait "$zscroll_pid" 2>/dev/null
    else
        printf '%s\n' "$ICON"
        sleep 1
    fi
done
