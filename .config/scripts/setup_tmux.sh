#!/usr/bin/env bash

session_dir="$HOME/.config/scripts/tmux_sessions"
session_file="$(ls "$session_dir" | fzf --layout=reverse)"

if [ -z "$session_file" ]; then
    echo "No session selected."
    exit 1
fi

source "$session_dir/$session_file"

: "${name:?Missing name}"
: "${work_dir:?Missing work_dir}"

if ! tmux has-session -t "$name" 2>/dev/null; then
    tmux new-session -d -s "$name" -c "$work_dir"

    index=0
    for window_name in "${window_names[@]}"; do
        cmd="${window_cmds[$index]}"
        cmd="${cmd//:::/\\n}"
        IFS=$'\n' read -rd '' -a panel_cmds <<<"$(echo -e "$cmd")"

        if [ "$index" -eq 0 ]; then
            tmux rename-window -t "$name:$index" "$window_name"
            tmux send-keys -t "$name:$index" "${panel_cmds[0]}" C-m
        else
            tmux new-window -t "$name:$index" -n "$window_name" -c "$work_dir"
            tmux send-keys -t "$name:$index" "${panel_cmds[0]}" C-m
        fi

        if [ "${#panel_cmds[@]}" -eq 2 ]; then
            tmux split-window -h -t "$name:$index" -c "$work_dir"
            tmux send-keys -t "$name:$index".1 "${panel_cmds[1]}" C-m
        fi

        index=$((index + 1))
    done
fi

tmux select-window -t "$name:1"

if [ -n "$TMUX" ]; then
    tmux switch-client -t "$name"
else
    tmux attach -t "$name"
fi
