#!/bin/bash

#make symbolic link
if [ -L ~/.vimrc ]; then
    unlink ~/.vimrc
fi
ln -s ~/dotfiles/.vimrc ~/.vimrc

#install vim-plug
curl -fo %USERPROFILE%\vimfiles\autoload\plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
