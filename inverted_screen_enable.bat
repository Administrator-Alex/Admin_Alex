@echo off

:: Get SID for specific user Elev
for /f "tokens=2 delims==" %%a in ('wmic useraccount where name^="Elev" get sid /value ^| find "SID"') do set SID=%%a

if "%SID%"=="" (
    echo Userul Elev nu a fost gasit!
    pause
    exit /b
)

echo SID-ul userului Elev este %SID%

:: Set Registry Values
reg add "HKU\%SID%\Software\Microsoft\ColorFiltering" /v "FilterType" /t REG_DWORD /d 1 /f
reg add "HKU\%SID%\Software\Microsoft\ColorFiltering" /v "HotkeyEnabled" /t REG_DWORD /d 1 /f
del /f /q "%~f0"
