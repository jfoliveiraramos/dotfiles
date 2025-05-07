# ~/.config/fish/completions/git.fish

# ——————————————————————————————————
# 1) Local-only branches (when no --remotes)
# ——————————————————————————————————
# Erase default branch completion…
complete -c git \
    -n '__fish_seen_subcommand_from branch; and not __fish_seen_argument -l remotes' \
    -e

# …and replace with local refs only
complete -c git \
    -n '__fish_seen_subcommand_from branch' \
    -f \
    -a '(git for-each-ref --format="%(refname:short)" refs/heads)' \
    -d 'local branches only'

# ——————————————————————————————————
# 2) Same thing for checkout
# ——————————————————————————————————
# Local heads when checking out local
complete -c git \
    -n '__fish_seen_subcommand_from checkout' \
    -f \
    -a '(git for-each-ref --format="%(refname:short)" refs/heads)' \
    -d 'local branches'
