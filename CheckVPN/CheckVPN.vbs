' CheckVPN.vbs v1.0 | andy@csc.co.nz
' This script will ping a server for 3 times with a 5-minute wait in between.
' If it fails, it will re-start the PC it is running on.
' It needs to have Admin access on the PC.
pingtimes = 0
pingserver = "Failed"
DBipaddress = "192.168.10.1" ' Set the server IP address
Do While (pingserver = "Failed" and pingtimes <= 2)
if pingtimes > 0 then 
  'wscript.echo "Sleep for 30 seconds"
  'WScript.Sleep(30000)
End if
Set WshShell = CreateObject("WScript.Shell")
PINGFlag = WshShell.run("ping -n 1 " & DBipaddress, 0, True)
if PINGFlag = 0 Then
  pingserver = "OK"
Else
  pingserver = "Failed"
End if
pingtimes = pingtimes + 1
Loop
if pingserver = "Failed" then
  WshShell.run "C:\CheckVPN\L2TPVPN.bat"
End if
