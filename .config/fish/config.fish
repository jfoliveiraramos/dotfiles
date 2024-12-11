if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
zoxide init --cmd cd fish | source

eval (bash -c 'source /home/ramos/.bash_profile')
if not set -q LD_LIBRARY_PATH
    set -x LD_LIBRARY_PATH ~/.local/lib/arch-mojo
else
    set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH ~/.local/lib/arch-mojo
end

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
#
# <D-a>
