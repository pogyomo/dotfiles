## for neovim
### install vim-plug
#curl -fo ~/.config/nvim/autoload/plug.vim --create-dirs \
#    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
### make symbolic link
#ln -sfv ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim

# for neovim
## install packer.nvim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim
## make symbolic link
mkdir ~/.config/
mkdir ~/.config/nvim/
ln -sfv ~/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
ln -sfv ~/dotfiles/neovim/lua ~/.config/nvim/lua
