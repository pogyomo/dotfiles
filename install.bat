@echo off

@rem -----------------------------------
@rem for neovim
@rem -----------------------------------

@rem setting for XDG_CONFIG_HOME
setx XDG_CONFIG_HOME "%userprofile%\.config"
mkdir %XDG_CONFIG_HOME%\nvim

@rem make symbolic link
if exist %XDG_CONFIG_HOME%\nvim\init.vim del ^
    %XDG_CONFIG_HOME%\nvim\init.vim
mklink %XDG_CONFIG_HOME%\nvim\init.vim %userprofile%\dotfiles\init.vim

@rem install vim-plug
curl -fo %XDG_CONFIG_HOME%\nvim\autoload\plug.vim --create-dirs ^
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
pause