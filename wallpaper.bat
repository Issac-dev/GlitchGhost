@echo off
set "wallpaperPath=%temp%\wallpaper.jpg"
set "url=https://path/to/image"

:: Download the image from URL
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%url%', '%wallpaperPath%')"

:: Set the downloaded image as wallpaper
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaperPath%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
