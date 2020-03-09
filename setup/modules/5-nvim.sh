#!/usr/bin/env bash

if hash nvim 2>/dev/null; then
    echo NVIM installed
else
    echo NVIM not found...installing
    brew install neovim
    python2 -m pip install neovim
    python3 -m pip install neovim
    ls -d ~/.config/nvim || ( mkdir -p $HOME/.config && ln -s ~/.dotfiles/nvim ~/.config/. )
    mkdir -p $HOME/.vim-backup $HOME/.vim-undo $HOME/.vim-views $HOME/.vim-swap
    nvim +PlugInstall +qa
fi
