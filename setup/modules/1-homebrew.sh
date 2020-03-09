#!/usr/bin/env bash

if hash brew 2>/dev/null; then
    echo Homebrew installed
else
    echo Homebrew not found...installing
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    # Ref: https://brew.sh/
fi