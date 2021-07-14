@echo off

@rem delete symbolic link
del %userprofile%\.vimrc
del %userprofile%\.gvimrc
del %userprofile%\AppData\Local\nvim\init.vim

@rem uninstall vim-plug
del %userprofile%\vimfiles\autoload\plug.vim
del %userprofile%\AppData\Local\nvim-data\site\autoload\plug.vim

pause
