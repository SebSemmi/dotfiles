#!/bin/sh

#DOTFILES_DIR="~/dotfiles"

ln -sF ~/dotfiles/.zsh ~
ln -sF ~/dotfiles/.zshrc ~
ln -sF ~/dotfiles/.vim ~
ln -sF ~/dotfiles/.vimrc ~
ln -sF ~/dotfiles/.tmux.conf ~
ln -sF ~/dotfiles/.zlogin ~
ln -sF ~/dotfiles/.gvimrc ~
ln -sF ~/dotfiles/.gitignore_global ~
ln -sF ~/dotfiles/.config ~
git submodule update --init
git config --global core.excludesfile ~/.gitignore_global
