@echo off
title cig Launcher
color 0f

:main_loop
cls
echo.
echo                                           **********************                                     
echo                                         *************************                                  
echo                                       *****************************                                 
echo                                     ********************************                                 
echo                                   **********************************                                 
echo                                 *************************************                                  
echo                                ************************************                                  
echo                                *********************************                                   
echo                               ***********************************                                   
echo                              **************************************                                
echo                            *******************************************                              
echo                            *********************************************                            
echo                            ***      ****************             *********                           
echo                            **        **************               *******                          
echo                            **          ***********                *******                          
echo                            **         *************               *******                          
echo                            *         ***************            *********                          
echo                             ********************************************                           
echo                              **********  **  *************************                           
echo                                *********      **********************                              
echo                                   ******  **   *******************                                
echo                                     *****  *   *****************                                   
echo                                      *************************                                      
echo                                       **********************                                         
echo                                         ****************                                            
echo                                          ** ** ** **                                              
echo                                          ** ** ** **
echo  Initializing client Please wait

ping localhost -n 5 >nul

echo Running CIG Launcher 

echo *******************************************
echo **                                      **
echo **         Initializing client          **
echo **                                      **
echo *******************************************

ping localhost -n 10 >nul

echo Running CIG Launcher 
start "C:\Program Files\Roberts Space Industries\RSI Launcher\RSI Launcher.exe" "C:\Program Files\Roberts Space Industries\StarCitizen\LIVE\StarCitizen_Launcher.exe" +map DFM_Orison -server -log -nosteam -connect 26.63.38.182:8000

:logo_loop
rem Check if both Star Citizen launcher and Star Citizen processes are still running during the 3-minute period
tasklist | find "StarCitizen_Launcher.exe" >nul
set "launcher_check=%errorlevel%"

tasklist | find "StarCitizen.exe" >nul
set "game_check=%errorlevel%"

if %launcher_check% equ 0 (
    rem The launcher process is still running, check for the game process
    if %game_check% equ 0 (
        rem Both processes are still running, display the success message
        echo Server Started Successfully [LAN] INITIALIZED
    ) else (
        rem The game process has closed, display the interrupted message
        echo Star Citizen game process closed. Check your Port Settings or Consult your ISP
        timeout /nobreak /t 10
    )
) else (
    rem The launcher process has closed, display the interrupted message
    echo Star Citizen Launcher process closed. Check your Port Settings or Consult your ISP
    timeout /nobreak /t 10
    goto main_loop
)

timeout /nobreak /t 60
goto logo_loop
