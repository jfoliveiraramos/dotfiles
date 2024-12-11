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
export LD_LIBRARY_PATH=/home/ramos/.local/lib/arch-mojo:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/ramos/.local/lib/arch-mojo:$LD_LIBRARY_PATH
