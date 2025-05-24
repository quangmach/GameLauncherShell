@ECHO OFF

:: Kill Explorer
taskkill /t /f /im explorer.exe

:: Start Boot Video
START "" "%~dp0..\mpv.exe" --script-opts=osc-visibility=never --ontop --no-terminal --fullscreen --loop "%~dp0Videos\BootVideo.mp4"

:: Start Steam Big Picture
START steam://open/gamepadui

:: Wait for Video to start
set "WindowTitle=mpv"
:waitforvideo
timeout /t 1 >nul
tasklist /v | findstr /i "mpv" >nul || goto waitforvideo

:: Restart Explorer
START explorer.exe

:: Wait for Steam to start
set "WindowTitle=Steam Big Picture Mode"
:waitforlauncher
timeout /t 3
@for /f "Delims=:" %%a in ('tasklist /fi "WINDOWTITLE eq %WindowTitle%"') do @if %%a==INFO goto waitforlauncher

:: Wait for 3 secs for Launcher fully loaded before quit/kill Boot Video
timeout /t 3
taskkill /f /im mpv.exe
EXIT