if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -gx PATH $HOME/.cargo/bin $PATH
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
zoxide init --cmd cd fish | source

if not set -q LD_LIBRARY_PATH
    set -x LD_LIBRARY_PATH ~/.local/lib/arch-mojo
else
    set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH ~/.local/lib/arch-mojo
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/Ramos/miniconda3/bin/conda
    eval /home/Ramos/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/Ramos/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/Ramos/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/Ramos/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<
#
# <D-a>
