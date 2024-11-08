import sys 
# Add the directory where 'requests' is located 
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages') 
 
import os 
 
def delete_all_files(folder_path): 
    for filename in os.listdir(folder_path): 
        file_path = os.path.join(folder_path, filename) 
        if os.path.isfile(file_path): 
            try: 
                os.remove(file_path) 
                print(f"Deleted: {file_path}") 
            except Exception as e: 
                print(f"Error deleting {file_path}: {e}") 
 
delete_all_files(r"C:\xampp\htdocs\ncc\ttt") 
