#!/usr/bin/env bash

if hash fzf 2>/dev/null; then
    echo FZF installed
else
    echo FZF not found...installing
    brew install fzf
    /usr/local/opt/fzf/install
fi