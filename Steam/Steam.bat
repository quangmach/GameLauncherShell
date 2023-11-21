@ECHO OFF
::START "" "C:\Program Files\VideoLAN\VLC\vlc.exe" --fullscreen --video-on-top --no-video-title --loop -Idummy "%~dp0..\Videos\BootVideo_Steam.mp4"
START "" "%~dp0..\mpv.exe" --script-opts=osc-visibility=never --ontop --no-terminal --fullscreen --loop "%~dp0..\Videos\BootVideo_Steam.mp4"
START steam://open/gamepadui

:: Wait for Steam to start
set "WindowTitle=Steam Big Picture Mode"
:loop
timeout /t 5
@for /f "Delims=:" %%a in ('tasklist /fi "WINDOWTITLE eq %WindowTitle%"') do @if %%a==INFO goto loop
::"taskkill /im vlc.exe
taskkill /im mpv.exe
EXIT