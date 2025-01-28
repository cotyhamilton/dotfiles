#!/usr/bin/env bash

if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/cotyhamilton/dotfiles.git $HOME/.dotfiles
fi

stow -d $HOME/.dotfiles -t $HOME .
