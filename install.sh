#!/bin/bash

select choice in \
install/update_vim-plug \
uninstall_vim-plug \
make_symbolic_link \
delete_symbolic_link \
exit

do
    if [ "$choice" = "install/update_vim-plug" ]; then
        echo "installing vim-plug..."
        curl -fo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        echo "finish!"
    elif [ "$choice" = "uninstall_vim-plug" ]; then
        echo "deleting vim-plug..."
        rm ~/.vim/autoload/plug.vim
        echo "finish!"
    elif [ "$choice" = "make_symbolic_link" ]; then
        echo "making symbolic link..."
        ln -sf ~/dotfiles/.vimrc ~/.vimrc
        echo "finish!"
    elif [ "$choice" = "delete_symbolic_link" ]; then
        echo "deleting symbolic link..."
        unlink ~/.vimrc
        echo "finish!"
    else
        exit
    fi

done
