if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -x GOROOT /usr/local/go
set -x PATH $GOROOT/bin $PATH

set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
zoxide init --cmd cd fish | source

bind \cq $HOME/.config/scripts/setup_tmux.sh
bind \ca tmux attach
