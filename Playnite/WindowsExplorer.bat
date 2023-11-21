@echo off
:: Wait for Playnite to start
set "WindowTitle=Playnite"
:loop
timeout /t 3
@for /f "Delims=:" %%a in ('tasklist /fi "WINDOWTITLE eq %WindowTitle%"') do @if %%a==INFO goto loop

:: Restarting Explorer
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "explorer.exe" /f
timeout /T 1
start explorer.exe
timeout /T 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "wscript.exe %~dp0PlayniteStartup.vbs" /f
exit