@echo off
set /p message="Enter the message you want to display: "
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('%message%', 'Windows Update')"
