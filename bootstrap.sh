#!/bin/sh
ln -s ~/dotfiles/.zsh ~
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.vim ~
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.tmux.conf ~
ln -s ~/dotfiles/.zlogin ~
ln -s ~/dotfiles/.gvimrc ~
ln -s ~/dotfiles/.gitignore_global ~
mkdir ~/.vim/backups
git submodule init && git submodule update
git config --global core.excludesfile ~/.gitignore_global
