@echo off

@rem make symbolic link
if exist %HOMEDRIVE%%HOMEPATH%\.vimrc del %HOMEDRIVE%%HOMEPATH%\.vimrc
mklink %HOMEDRIVE%%HOMEPATH%\.vimrc %HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc

@rem install vim-plug
curl -fo %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
