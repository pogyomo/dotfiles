# for neovim
## install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
## make symbolic link
mkdir ~/.config/
mkdir ~/.config/nvim/
ln -sfv ~/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
ln -sfv ~/dotfiles/neovim/lua ~/.config/nvim/lua

# for vim
## make symbolic link
ln -sfv ~/dotfiles/vim/init.vim ~/.vimrc
