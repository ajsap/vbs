' Show-File-Extensions.VBS
' #2016-10-13 | andy@csc.co.nz
HKEY_CURRENT_USER = &H80000001
strComputer = "."
Set objReg = GetObject("winmgmts:\\" & strComputer & "\root\default:StdRegProv")
strKeyPath = "Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
objReg.CreateKey HKEY_CURRENT_USER, strKeyPath
ValueName = "HideFileExt"
dwValue = 0 ' Show = 0, Hide = 1 (Windows Default)
objReg.SetDWORDValue HKEY_CURRENT_USER, strKeyPath, ValueName, dwValue
