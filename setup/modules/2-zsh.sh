#!/usr/bin/env bash

if ls /usr/local/bin/zsh >/dev/null 2>&1; then
    echo ZSH installed
else
    echo ZSH not found...installing
    ls ~/.zshrc > /dev/null 2>&1 || ln -s ~/.dotfiles/.zshrc ~/.zshrc
    brew install zsh
    curl -L git.io/antigen > ~/.antigen.zsh
fi