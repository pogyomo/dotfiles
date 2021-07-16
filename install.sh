# install vim-plug
curl -fo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# make symbolic link
ln -sfv ~/dotfiles/init.vim ~/.config/nvim/init.vim
