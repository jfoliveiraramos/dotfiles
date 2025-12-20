if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting

set -x EDITOR nvim

set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin

set -x PATH $PATH $HOME/.cache/rebar3/bin

set -x QT_QPA_PLATFORM xcb

set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source
zoxide init --cmd cd fish | source

bind \cq $HOME/.config/scripts/setup_tmux.sh
bind \ca tmux attach

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/ramos/.miniconda3/bin/conda
    eval /home/ramos/.miniconda3/bin/conda "shell.fish" hook $argv | source
else
    if test -f "/home/ramos/.miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/ramos/.miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/ramos/.miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

# pnpm
set -gx PNPM_HOME "/home/joaoramos/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'micromamba shell init' !!
set -gx MAMBA_EXE /usr/bin/micromamba
set -gx MAMBA_ROOT_PREFIX "/home/ramos/.micromamba"
# $MAMBA_EXE shell hook --shell fish --root-prefix $MAMBA_ROOT_PREFIX | source
# <<< mamba initialize <<<
