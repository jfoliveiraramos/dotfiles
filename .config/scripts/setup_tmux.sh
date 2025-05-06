#!/usr/bin/env fish

function tmux-enter
    set session $argv[1]
    if set -q TMUX
        tmux switch-client -t $session
    else
        tmux attach -t $session
    end
end

set sessions backend frontend reporting-app data-services operations
set session (printf '%s\n' $sessions | fzf --layout=reverse)

set work_dir ~/Repos/

switch $session
    case operations
        if not tmux has-session -t operations
            tmux new-session -d -s operations -c $work_dir/operations-frontend
            tmux send-keys -t operations:0 'yarn start' C-m
            tmux new-window -t operations:1 -n 'nvim' -c $work_dir/operations-frontend
            tmux send-keys -t operations:1 'nvim' C-m
            tmux new-window -t operations:2 -n 'shell' -c $work_dir/operations-frontend
        end
        tmux select-window -t operations:1
        tmux-enter operations

    case backend
        if not tmux has-session -t backend
            tmux new-session -d -s backend -c $work_dir/backend
            tmux send-keys -t backend:0 './start.sh' C-m
            tmux new-window -t backend:1 -n 'nvim' -c $work_dir/backend
            tmux send-keys -t backend:1 'nvim' C-m
            tmux new-window -t backend:2 -n 'artisan' -c $work_dir/backend
            tmux send-keys -t backend:2 'docker compose exec -u sail performativ-api-service bash '
            tmux new-window -t backend:3 -n 'shell' -c $work_dir/backend
        end
        tmux select-window -t backend:1
        tmux-enter backend

    case frontend
        if not tmux has-session -t frontend
            tmux new-session -d -s frontend -c $work_dir/frontend
            tmux send-keys -t frontend:0 'yarn start:local' C-m
            tmux new-window -t frontend:1 -n 'nvim' -c $work_dir/frontend
            tmux send-keys -t frontend:1 'nvim' C-m
            tmux new-window -t frontend:2 -n 'shell' -c $work_dir/frontend
        end
        tmux select-window -t frontend:1
        tmux-enter frontend

    case data-services
        if not tmux has-session -t data-services
            tmux new-session -d -s data-services -c $work_dir/data-services
        end
        tmux-enter data-services

    case reporting-app
        if not tmux has-session -t reporting-app
            tmux new-session -d -s reporting-app -c $work_dir/data-services/reporting-app
            tmux send-keys -t reporting-app:1 'yarn tauri dev' C-m
            tmux new-window -t reporting-app:2 -n 'backend' -c $work_dir/data-services/reporting-app/src-tauri/
            tmux send-keys -t reporting-app:2 'nvim' C-m
            tmux new-window -t reporting-app:3 -n 'frontend' -c $work_dir/data-services/reporting-app/src/
            tmux send-keys -t reporting-app:3 'nvim' C-m
            tmux new-window -t reporting-app:4 -n 'shell' -c $work_dir/data-services/reporting-app/
        end
        tmux-enter reporting-app

    case '*'
        echo 'No session selected or invalid selection.'
end
