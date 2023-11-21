@echo off

::Script to force run as Admin
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

:: Replace explorer.exe back
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "explorer.exe" /f && echo "Re add Explorer.exe as Windows Shell successful"

:: Add Task Scheduler to start explorer.exe
schtasks /query /TN "Game Launcher Shell" >NUL 2>&1 && schtasks /delete /tn "Game Launcher Shell" /f

echo "Uninstall Successfully"

timeout /t 3
exit