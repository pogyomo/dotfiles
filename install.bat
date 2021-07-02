@echo off

@rem make symbolic links
if exist %USERPROFILE%\.vimrc del %USERPROFILE%\.vimrc
mklink %USERPROFILE%\.vimrc %USERPROFILE%\dotfiles\.vimrc

@rem install vim-plug
curl -fo %USERPROFILE%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

pause
