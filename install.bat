@echo off

@rem set XDG_CONFIG_HOME
setx XDG_CONFIG_HOME "%USERPROFILE%\.config"
if not exist %XDG_CONFIG_HOME%\nvim mkdir %XDG_CONFIG_HOME%\nvim

@rem make symbolic link
if exist %XDG_CONFIG_HOME%\nvim\init.vim del %XDG_CONFIG_HOME%\nvim\init.vim
mklink %XDG_CONFIG_HOME%\nvim\init.vim %USERPROFILE%\dotfiles\init.vim

@rem install vim-plug
curl -fo %XDG_CONFIG_HOME%\nvim\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pause
