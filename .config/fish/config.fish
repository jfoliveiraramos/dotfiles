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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ramos/.miniconda3/bin/conda
    eval /home/ramos/.miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/ramos/.miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ramos/.miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/ramos/.miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

