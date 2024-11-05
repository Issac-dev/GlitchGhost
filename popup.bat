@echo off
powershell -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('This is a simple popup message!', 'Windows Update')"
