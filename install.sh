#!/bin/bash

#display selector
select choice in \
1.install/update vim-plug \
2.uninstall vim-plug \
3.make symbolic link \
4.delete symbolic link \
5.end shell \
exit

if $choice == 1
    curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    exit
else if $choice == 2
