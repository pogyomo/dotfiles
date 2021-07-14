@echo off

@rem make symbolic link
if exist %userprofile%\.vimrc del %userprofile%\.vimrc
if exist %userprofile%\.gvimrc del %userprofile%\.gvimrc
if exist %userprofile%\AppData\Local\nvim\init.vim ^
    del %userprofile%\AppData\Local\nvim\init.vim
mkdir %userprofile%\AppData\Local\nvim
mklink %userprofile%\.vimrc %userprofile%\dotfiles\.vimrc
mklink %userprofile%\.gvimrc %userprofile%\dotfiles\.gvimrc
mklink %userprofile%\AppData\Local\nvim\init.vim %userprofile%\dotfiles\.vimrc

@rem install vim-plug
curl -fo %userprofile%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fo %userprofile%\AppData\Local\nvim-data\site\autoload\plug.vim ^
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pause
