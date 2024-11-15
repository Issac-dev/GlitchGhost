@echo off
set /p url="Enter image URL: "

powershell -Command "Invoke-WebRequest -Uri '%url%' -OutFile '%TEMP%\pload\GlitchGhost-main\image.png'"
