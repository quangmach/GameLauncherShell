@ECHO OFF
::START "" "vlc.exe" --fullscreen --video-on-top --play-and-exit --no-video-title --loop -Idummy "%~dp0Videos\BootVideo_Playnite.mp4"
START "" "%~dp0..\mpv.exe" --script-opts=osc-visibility=never --ontop --no-terminal --loop --fullscreen "%~dp0..\Videos\BootVideo_Playnite.mp4"
START "" "%LOCALAPPDATA%\Playnite\Playnite.FullscreenApp.exe" --hidesplashscreen
:: Wait for Playnite to start
set "WindowTitle=Playnite"
:loop
timeout /t 5
@for /f "Delims=:" %%a in ('tasklist /fi "WINDOWTITLE eq %WindowTitle%"') do @if %%a==INFO goto loop
::taskkill /im vlc.exe
taskkill /im mpv.exe
EXIT