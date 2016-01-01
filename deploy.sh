#!/bin/zsh

cd "$(dirname "$0")"

cp -f tmux.conf ~/.tmux.conf 
#Tmux will create new sessions in its conf file. So please reload it manually.
# tmux source-file ~/.tmux.conf
cp -f zshrc ~/.zshrc && source ~/.zshrc
