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
