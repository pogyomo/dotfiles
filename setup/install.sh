# install vim-plug
## for neovim
curl -fo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

## for vim
curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# make symbolic link
## for neovim
ln -sfv ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim

## for vim
ln -sfv ~/dotfiles/vim/init.vim ~/.vimrc
