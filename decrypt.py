import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')


from cryptography.fernet import Fernet
import os

def decrypt_folder(folder_path):
    with open("key.key", "rb") as key_file:
        key = key_file.read()
    fernet = Fernet(key)
    for filename in os.listdir(folder_path):
        if filename.endswith(".enc"):
            file_path = os.path.join(folder_path, filename)
            with open(file_path, "rb") as encrypted_file:
                encrypted_data = encrypted_file.read()
            decrypted_data = fernet.decrypt(encrypted_data)
            original_file_path = file_path[:-4]
            with open(original_file_path, "wb") as decrypted_file:
                decrypted_file.write(decrypted_data)
            os.remove(file_path)
            print(f"File '{filename}' decrypted and encrypted version deleted.")

decrypt_folder("C:\\path\\to\\folder")
