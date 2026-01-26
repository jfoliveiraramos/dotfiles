set -g fish_greeting
set -x EDITOR nvim
set -x GOPATH $HOME/.go
set -x PATH $PATH $GOPATH/bin
set -x PATH $PATH $HOME/.cache/rebar3/bin
set -x QT_QPA_PLATFORM xcb

bind \cq $HOME/.config/scripts/setup_tmux.sh
bind \ca tmux attach
bind \cs "echo \"opening Spotify Player...\" && spotify_player"
bind \e\ce "echo \"opening Thunar at \$PWD...\" && thunar &>/dev/null . & disown && clear"
bind \e\cc "echo \"opening VS Codium at \$PWD...\" && codium >/dev/null . && clear"

set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml
starship init fish | source

zoxide init --cmd cd fish | source

set -gx PNPM_HOME "/home/joaoramos/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
