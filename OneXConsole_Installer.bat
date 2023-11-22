@echo off

::Script to force run as Admin
set "params=%*"
cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )

setlocal enabledelayedexpansion
set "inputfile=%~dp0OneXConsole\TaskScheduler_Template_DoNotTouch.xml"
set "outputfile=%~dp0temp.xml"
set "searchString=<Arguments>WindowsExplorer.vbs</Arguments>"
set "replaceString=<Arguments>%~dp0OneXConsole\WindowsExplorer.vbs</Arguments>"

if exist "%outputfile%" del "%outputfile%"

for /f "delims=" %%i in ('type "%inputfile%"') do (
    set "line=%%i"
    set "modifiedLine=!line:%searchString%=%replaceString%!"
    echo !modifiedLine! >> "%outputfile%"
)

:: Add Script to replace Playnite as shell
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Shell /t REG_SZ /d "wscript.exe %~dp0OneXConsole\LauncherStartup.vbs" /f

:: Add Task Scheduler to start explorer.exe
schtasks /query /TN "Game Launcher Shell" >NUL 2>&1 && schtasks /delete /tn "Game Launcher Startup" /f & schtasks /create /tn "Game Launcher Shell" /xml %~dp0temp.xml

del "%outputfile%"

timeout /t 3
exit