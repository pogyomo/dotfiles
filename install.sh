#make symbolic link
for f in .??*
do
    [ "$f" = ".git" ] && continue
    ln -sf ~/dotfiles/$f ~/$f
done

#install vim-plug
curl -fo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
