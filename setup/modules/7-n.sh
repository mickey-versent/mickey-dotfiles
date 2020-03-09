#!/usr/bin/env bash

if hash n 2>/dev/null; then
    echo n installed
else
    echo n not found...installing
    brew install n
    mkdir -p $HOME/.n
    ag 'export N_PREFIX' ~/.zshrc || ( echo 'export N_PREFIX=$HOME/.n' >> ~/.zshrc && echo 'export PATH=$N_PREFIX/bin:$PATH' >> ~/.zshrc )
fi
