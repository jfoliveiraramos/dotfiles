#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
eval "$(starship init bash)"
eval "$(zoxide init --cmd cd bash)"

export GDK_BACKEND=wayland

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/joaoramos/.miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/joaoramos/.miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/joaoramos/.miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/joaoramos/.miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

. "$HOME/.cargo/env"
