# for general
## make directory
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# for nvim
git clone https://github.com/pogyomo/nvim ~/.config/nvim

# for vim
## make symbolic link
ln -sfv ~/dotfiles/vim/init.vim ~/.vimrc

# for wezterm
## make directory
if [ ! -d ~/.config/wezterm ]; then
    mkdir ~/.config/wezterm
fi
## make symbolic link
ln -sfv ~/dotfiles/wezterm/* ~/.config/wezterm/
