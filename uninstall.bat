@echo off

@rem delete directory
rd /s /q %XDG_CONFIG_HOME%\nvim

@rem comment
echo Please delete XDG_CONFIG_HOME via environment variable setting dialog.

pause
