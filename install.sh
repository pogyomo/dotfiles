# --------------------------------------
# for vim
# --------------------------------------
#make symbolic link
ln -sfv ~/dotfiles/init.vim ~/.vimrc

#install vim-plug
curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
