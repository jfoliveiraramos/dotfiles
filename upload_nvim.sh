#!/bin/bash

if [[ $# -eq 0 ]]; then
    commit="Updates NeoVim config"
else
    commit="$1"
fi

rm -rf ./.config/nvim
cp -r ~/.config/nvim ./.config/

git add -A
git commit -a -m "$commit"
git push
