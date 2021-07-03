#!/bin/bash

#make symbolic link
unlink ~/.vimrc
unlink ~/.minttyrc
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.minttyrc ~/.minttyrc

#install vim-plug
curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
