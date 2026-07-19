#!/usr/bin/env bash

# if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
#     branch="$(git branch --format='%(refname:short)' | fzf --layout=reverse)"
#     if [[ -n "$branch" ]]; then
#         if git checkout "$branch"; then
#             if [[ -n "$TMUX" ]]; then
#                 tmux send-keys -t "$TMUX_PANE" "clear" Enter
#             else
#                 clear
#             fi
#         else
#             if [[ -n "$TMUX" ]]; then
#                 tmux send-keys -t "$TMUX_PANE" "echo hey" Enter
#                 tmux display-popup # -E -w 60% -h 20% -d "$TMUX_PANE" \
#                 #"echo 'Checkout failed - press Enter...' >&2 && read"
#             else
#                 echo >&2
#             fi
#         fi
#     fi
# fi
