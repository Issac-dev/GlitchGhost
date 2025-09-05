@echo off
set /p url="Enter image URL: "

powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%TEMP%\pload\GlitchGhost-main\image.png'"

:: Set the wallpaper in the registry
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%TEMP%\pload\GlitchGhost-main\image.png" /f

:: Refresh the wallpaper settings
RUNDLL32.EXE user32.dll, UpdatePerUserSystemParameters
