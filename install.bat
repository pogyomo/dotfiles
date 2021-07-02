@echo off
echo what do you want to do?
echo 1.install/update vim-plug
echo 2.uninstall vim-plug
echo 3.make symbolic link
echo 4.delete symbolic link
echo 5~.end bat
set /p choice="?"


if %choice% == 1 (
    goto :install_vim_plug
) else if %choice% == 2 (
    goto :uninstall_vim_plug
) else if %choice% == 3 (
    goto :make_symbolic_link
) else if %choice% == 4 (
    goto :delete_symbolic_link
) else (
    exit
)


:install_vim_plug
    echo installing vim-plug...
    curl -fo %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    exit
:uninstall_vim_plug
    del %HOMEDRIVE%%HOMEPATH%\vimfiles\autoload\plug.vim
    exit
:make_symbolic_link
    echo makeing symbolic link...
    mklink %HOMEDRIVE%%HOMEPATH%\.vimrc %HOMEDRIVE%%HOMEPATH%\dotfiles\.vimrc
    exit
:delete_symbolic_link
    echo deleting symbolic link
    del %HOMEDRIVE%%HOMEPATH%\.vimrc
    exit
