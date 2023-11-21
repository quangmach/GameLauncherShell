Set WshShell = CreateObject("WScript.Shell")
CurrentFolder = CreateObject("Scripting.FileSystemObject").GetParentFolderName(WScript.ScriptFullName)
WshShell.Run chr(34) & CurrentFolder&"\Steam.bat" & Chr(34), 0
Set WshShell = Nothing