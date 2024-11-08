if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
zoxide init --cmd cd fish | source

set -x PATH "/bin/zig-linux-x86_64-0.14.0" $PATH

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ramos/miniconda3/bin/conda
    eval /home/ramos/miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/ramos/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ramos/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH /home/ramos/miniconda3/bin $PATH
    end
end
# <<< conda initialize <<<
