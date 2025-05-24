# Game Launcher Shell (Updated 2.0)
Replace Game Launcher such as Playnite/Steam Big Picture on Windows startup without reveal Desktop at all, making PC Gaming Device look truly like Gaming Console
### Changes in 2.0:
- Switch from replace explorer.exe shell method to using Userinit to avoid explorer.exe related issues like random Onscreen Keyboard Popup and explorer window artifacts...
<p align="center">
<img src="https://raw.githubusercontent.com/quangmach/GameLauncherShell/master/Playnite_demo.gif" />
<img src="https://raw.githubusercontent.com/quangmach/GameLauncherShell/master/Steam_demo.gif" />
</p>

**Origin from: https://github.com/Blueforcer/PlayniteShell** and remake by me so it's One click Install and do not need to disable User Account Control (UAC), and not using BatToExeConverterX64 (some users afraid of Trojan wrong detection by Windows Defender)

## What happen here?

Windows will boot normaly, and during User initializing it will start the script. This script simply kill explorer.exe first, load the Video in fullscreen and plays the bootanimation. While it looping Video, it loads Launcher (Playnite/Steam Big Picture) in the background and restart Windows Desktop (explorer.exe) which is all covering by Boot Video in Fullscreen.

## Instruction:
1. Enable Login without Password
https://www.minitool.com/data-recovery/windows-11-auto-login.html
2. Download & Install script
Download release (not repo - repo for reviewing code), copy it to anywhere and unzip it, and simply run Installer_Playnite.bat if you using Playnite or Installer_Steam.bat if you using Steam Big Picture (It will request for Admin permission or just run it as Admin at first) to install script automatically and Restart to test if it working (It should :D)
3. _Additional advice if you using Playnite is install **"Splash Screen"** Playnite's Extension here: https://playnite.link/addons.html#SplashScreen_d8c4f435-2bd2-49d8-98f6-87b1d415934a so you will almost never see Windows Desktop again when not needed._

P/s: 
- To uninstall just run Uninstaller.bat
- This one use all viewable batch script & vbscript (vbscript is used here to make batch script running hidden) so it's totally safe
- mpv.exe in the release zip is a portable lightweight opensourced video player (https://github.com/mpv-player/mpv) As I want my script to be click and run.
- You can use any video as "boot" animation which is a mp4 in Videos folder (Rename to BootVideo.mp4 and replace the one in Steam or Playnite Videos Folder).
- You are free to edit and use for other case such as for HTPC Media Launcher (Kodi...)
