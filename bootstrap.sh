#!/bin/sh
ln -s ~/dotfiles/.zsh ~
ln -s ~/dotfiles/.zshrc ~
ln -s ~/dotfiles/.vim ~
ln -s ~/dotfiles/.vimrc ~
ln -s ~/dotfiles/.tmux.conf ~
ln -s ~/dotfiles/.zlogin ~
ln -s ~/dotfiles/.gvimrc ~
git submodule init && git submodule update
mkdir ~/.vimbackup
