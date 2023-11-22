@echo off
:: Restarting Explorer
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "explorer.exe" /f
timeout /T 1
start explorer.exe
timeout /T 1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "wscript.exe %~dp0LauncherStartup.vbs" /f

::OneXConsole have to start after explorer.exe to show up
cmd.exe /c START "" "C:\Program Files\OneXConsole\OneXConsole.exe"

exit