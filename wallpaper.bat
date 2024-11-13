@echo off
set /p url="Enter name image URL: "
powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%TEMP%\image.png'"
set "wallpaper=%TEMP%\image.png"
reg add "HKCU\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%wallpaper%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
