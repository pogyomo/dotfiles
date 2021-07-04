@echo off

@rem make symbolic link
if exist %HOMEDRIVE%%HOMEPATH%\.vimrc del %HOMEDRIVE%%HOMEPATH%\.vimrc
if exist %HOMEDRIVE%%HOMEPATH%\.gvimrc del %HOMEDRIVE%%HOMEPATH%\.gvimrc
mklink %HOMEDRIVE%%HOMEPATH%\.vimrc %HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc
mklink %HOMEDRIVE%%HOMEPATH%\.gvimrc %HOMEDRIVE%%HOMEPATH%\dotfiles\.gvimrc

@rem install vim-plug
curl -fo %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
