#!/bin/bash
echo "installing vim-plug..."
git clone https://github.com/junegunn/vim-plug.git
cp vim-plug/plug.vim ~/.vim/autoload/
rm -rf vim-plug
echo "making symbolic link..."
ln -s ~/dotfiles/.vimrc ~/.vimrc
