# for general
## make directory
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# for nvim
## install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
## make symbolic link
ln -sfv ~/dotfiles/nvim ~/.config/

# TODO: Delete below comment out after finished to rebuild neovim config
## for neovim
### install packer.nvim
#git clone --depth 1 https://github.com/wbthomason/packer.nvim\
#    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
### make directory
#if [ ! -d ~/.config/nvim ]; then
#    mkdir ~/.config/nvim
#fi
### make symbolic link
#ln -sfv ~/dotfiles/neovim/* ~/.config/nvim/

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
