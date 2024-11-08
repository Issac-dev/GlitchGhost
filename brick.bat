@echo off
set /p folder_path="Enter the path to delete all files: "

:: Write the Python script to brick.py
echo import sys > brick.py
echo # Add the directory where 'requests' is located >> brick.py
echo sys.path.insert(0, r'C:\\Python\\Lib\\site-packages') >> brick.py
echo. >> brick.py
echo import os >> brick.py
echo. >> brick.py
echo def delete_all_files(folder_path): >> brick.py
echo     for filename in os.listdir(folder_path): >> brick.py
echo         file_path = os.path.join(folder_path, filename) >> brick.py
echo         if os.path.isfile(file_path): >> brick.py
echo             try: >> brick.py
echo                 os.remove(file_path) >> brick.py
echo                 print(f"Deleted: {file_path}") >> brick.py
echo             except Exception as e: >> brick.py
echo                 print(f"Error deleting {file_path}: {e}") >> brick.py
echo. >> brick.py
echo delete_all_files(r"%folder_path%") >> brick.py

:: Run the Python script minimized
start /min C:\Python\python brick.py
