#!/usr/bin/env bash

[ -f $HOME/.gitconfig ] && echo "gitconfig linked" || ( echo "linking gitconfig" && ln -s $HOME/.dotfiles/git/gitconfig $HOME/.gitconfig )
[ -f $HOME/.gitignore_global ] && echo "global gitignore linked" || ( echo "linking global gitignore" && ln -s $HOME/.dotfiles/git/gitignore $HOME/.gitingore_global )
