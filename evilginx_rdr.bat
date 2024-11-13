@echo off
set /p message="Enter the message you want to display: "
set /p link="Enter the link you want to open: "
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%message%', 'Information'); Start-Process '%link%'"
