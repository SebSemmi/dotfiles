#!/bin/sh
ln -sF ~/dotfiles/.zsh ~
ln -sF ~/dotfiles/.zshrc ~
ln -sF ~/dotfiles/.vim ~
ln -sF ~/dotfiles/.vimrc ~
ln -sF ~/dotfiles/.tmux.conf ~
ln -sF ~/dotfiles/.zlogin ~
ln -sF ~/dotfiles/.gvimrc ~
ln -sF ~/dotfiles/.gitignore_global ~
mkdir ~/.vim/backups
git submodule init && git submodule update
git config --global core.excludesfile ~/.gitignore_global
