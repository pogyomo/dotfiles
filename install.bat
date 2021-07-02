@echo off
echo installing vim-plug...
git clone https://github.com/junegunn/vim-plug
copy vim-plug\plug.vim %HOMEDRIVR%%HOMEPATH%\vimfiles\autoload
rd /s /q vim-plug
echo makeing symbolic link...
mklink %HOMEDRIVE%%HOMEPATH%\.vimrc %HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc
