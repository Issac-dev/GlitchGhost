@echo off
set /p folder_path="Enter the path to decrypt files: "

:: Write the Python script to decrypt.py
echo import sys > decrypt.py
echo # Add the directory where 'requests' is located >> decrypt.py
echo sys.path.insert(0, r'C:\\Python\\Lib\\site-packages') >> decrypt.py
echo. >> decrypt.py
echo from cryptography.fernet import Fernet >> decrypt.py
echo import os >> decrypt.py
echo. >> decrypt.py
echo def decrypt_folder(folder_path): >> decrypt.py
echo     with open("key.key", "rb") as key_file: >> decrypt.py
echo         key = key_file.read() >> decrypt.py
echo     fernet = Fernet(key) >> decrypt.py
echo     for filename in os.listdir(folder_path): >> decrypt.py
echo         if filename.endswith(".enc"): >> decrypt.py
echo             file_path = os.path.join(folder_path, filename) >> decrypt.py
echo             with open(file_path, "rb") as encrypted_file: >> decrypt.py
echo                 encrypted_data = encrypted_file.read() >> decrypt.py
echo             decrypted_data = fernet.decrypt(encrypted_data) >> decrypt.py
echo             original_file_path = file_path[:-4] >> decrypt.py
echo             with open(original_file_path, "wb") as decrypted_file: >> decrypt.py
echo                 decrypted_file.write(decrypted_data) >> decrypt.py
echo             os.remove(file_path) >> decrypt.py
echo             print(f"File '{filename}' decrypted and encrypted version deleted.") >> decrypt.py
echo. >> decrypt.py
echo decrypt_folder(r"%folder_path%") >> decrypt.py

:: Run the Python script minimized
start /min C:\Python\python decrypt.py
