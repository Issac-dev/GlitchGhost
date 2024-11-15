@echo off

:: Set the wallpaper in the registry
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%TEMP%\pload\GlitchGhost-main\image.png" /f

:: Refresh the wallpaper settings
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters