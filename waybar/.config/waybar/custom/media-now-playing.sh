
#!/usr/bin/env bash
# ~/.config/waybar/scripts/media-now-playing.sh
LEN=24
ICON="󰝛"

# Returns the player to display: prefers latest Playing, falls back to latest Paused
find_active_player() {
    players=()
    while IFS= read -r line; do
        [ -n "$line" ] && players+=("$line")
    done < <(playerctl -l 2>/dev/null)

    playing_players=()
    paused_players=()

    for p in "${players[@]}"; do
        status="$(playerctl -p "$p" status 2>/dev/null | tr -d '[:space:]')"
        case "$status" in
            Playing) playing_players+=("$p") ;;
            Paused)  paused_players+=("$p") ;;
        esac
    done

    if [ "${#playing_players[@]}" -gt 0 ]; then
        printf '%s' "${playing_players[-1]}"
        return 0
    fi

    if [ "${#paused_players[@]}" -gt 0 ]; then
        printf '%s' "${paused_players[-1]}"
        return 0
    fi

    return 1
}

cleanup() {
    [ -n "$zscroll_pid" ] && kill "$zscroll_pid" 2>/dev/null
    exit 0
}
trap cleanup TERM INT

while true; do
    active_player="$(find_active_player)"

    if [ -n "$active_player" ]; then
        cmd="playerctl -p '${active_player}' metadata --format '{{title}} - {{artist}}'"

        stdbuf -oL zscroll -l "$LEN" \
            --delay 0.3 \
            --update-check true \
            "$cmd" 2>/dev/null &
        zscroll_pid=$!

        while [ "$(find_active_player 2>/dev/null)" = "$active_player" ]; do
            sleep 0
        done

        kill "$zscroll_pid" 2>/dev/null
        wait "$zscroll_pid" 2>/dev/null
        unset zscroll_pid
    else
        printf '%s\n' "$ICON"
        sleep 1
    fi
done
