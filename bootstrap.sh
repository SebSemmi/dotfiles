#!/bin/sh

DOTFILES_DIR="~/dotfiles"

ln -sF $DOTFILES_DIR/.zsh ~
ln -sF $DOTFILES_DIR/.zshrc ~
ln -sF $DOTFILES_DIR/.vim ~
ln -sF $DOTFILES_DIR/.vimrc ~
ln -sF $DOTFILES_DIR/.tmux.conf ~
ln -sF $DOTFILES_DIR/.zlogin ~
ln -sF $DOTFILES_DIR/.gvimrc ~
ln -sF $DOTFILES_DIR/.gitignore_global ~
mkdir ~/.vim/backups
git submodule update --init
git config --global core.excludesfile ~/.gitignore_global
