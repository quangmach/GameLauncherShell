@ECHO OFF
::START "" "vlc.exe" --fullscreen --video-on-top --play-and-exit --no-video-title --loop -Idummy "%~dp0Videos\BootVideo.mp4"
START "" "%~dp0..\mpv.exe" --script-opts=osc-visibility=never --ontop --no-terminal --loop --fullscreen "%~dp0Videos\BootVideo.mp4"

:: Wait for OneXConsole to start
set "WindowTitle=OneXConsole"
:loop
timeout /t 3
@for /f "Delims=:" %%a in ('tasklist /fi "WINDOWTITLE eq %WindowTitle%"') do @if %%a==INFO goto loop

:: Wait for 3 secs for Launcher fully loaded before quit/kill Boot Video
timeout /t 3
::taskkill /im vlc.exe
taskkill /im mpv.exe
EXIT