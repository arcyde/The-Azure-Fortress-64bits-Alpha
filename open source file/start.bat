::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFDpGTx2GOVeeCaIS5Of66/m7tkgOQOdxcYzUug==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFDpGTx2GOVeeA6YX/Ofr096mhGAtaLRreobPyYi6KOVTy1/xZ5Nt8HVIjNkJHwgWewquDg==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
mode con:cols=100 lines=40
title The Azure Fortress - Heretic Multiplayer Platform - Alpha Version // By Arcyde

:welcome
if exist ./cfg/nick.cmd goto screen
echo.
echo.
echo. 
echo  Welcome to The Azure Fortress, a DOS platform where you can play Heretic in multiplyer mode, press 
echo any key to go to our first configuration.
echo.
echo.
call .\src\logo.bat
pause>nul
goto nickname

:nickname
cls
echo.
call .\src\logo.bat
echo.
echo.
echo Insert your nickname to be used in online mode:
echo.
set /p nick=
echo %nick% > .\cfg\nick.cmd
goto screen

:screen
cls
if exist ./cfg/screen.cmd goto menu
echo.
echo.
echo                               Now, lets set the gamescreen resolution:
echo.
echo            1- 640x480 / 2- 800x600 / 3- 1024x768 / 4- 1280x600 / 5- 1366x768 / 6- Manual 
echo.
call .\src\logo.bat
choice /C 123456>nul
if %errorlevel%==6 goto manual
if %errorlevel%==5 goto 1366
if %errorlevel%==4 goto 1280
if %errorlevel%==3 goto 1024
if %errorlevel%==2 goto 800
if %errorlevel%==1 goto 640

:manual
cls
call .\src\logo.bat
echo.
echo Insert widht: (Example: 800, 1024, 1366, 1500...)
echo.
set /p widht=
echo.
echo Insert height: (Example: 480, 600, 768, 800...)
echo.
set /p height=
echo ok >./cfg/screen.cmd
echo %widht% >./cfg/widht.cmd
echo %height% >./cfg/height.cmd
goto menu

:1366
cls
echo ok >./cfg/screen.cmd
echo 1366 >./cfg/widht.cmd
echo 768 >./cfg/height.cmd
goto menu

:1280
cls
echo ok >./cfg/screen.cmd
echo 1280 >./cfg/widht.cmd
echo 600 >./cfg/height.cmd
goto menu

:1024
cls
echo ok >./cfg/screen.cmd
echo 1024 >./cfg/widht.cmd
echo 768 >./cfg/height.cmd
goto menu

:800
cls
echo ok >./cfg/screen.cmd
echo 800 >./cfg/widht.cmd
echo 600 >./cfg/height.cmd
goto menu

:640
cls
echo ok >./cfg/screen.cmd
echo 640 >./cfg/widht.cmd
echo 480 >./cfg/height.cmd
goto menu

:menu
cls
set /p nick=<.\cfg\nick.cmd
echo Welcome %nick%! 
ECHO.
ECHO.
echo                                         Select desired option:
ECHO.
echo.  
echo             1 - Host or Join Game / 2 - Change Resolution or Nick / 3 - About / 4 - Exit
echo.
call .\src\logo.bat
CHOICE /C 1234>NUL
if %errorlevel%==4 goto exit
if %errorlevel%==3 goto about
if %errorlevel%==2 goto change
if %errorlevel%==1 goto join

:exit
cls
exit

:about
cls
call .\src\logo.bat
echo.
echo  The Azure Fortress is a multiplayer platform for Heretic, created just for Discord's community 
echo Heretic "&" Hexen, its GZDoom-based and uses DOS to consume less memory and disk usage, compatible 
echo with windows 7, 8 and 10.
echo.
echo Created by: Arcyde
echo.
pause
goto menu

:change
cls
ECHO.
echo                                         Select desired option:
echo.
echo.
echo               1 - Change Gamescreen Resolution / 2 - Change Nickname / 3 - Back to menu
echo.
call .\src\logo.bat
choice /C 123>nul
if %errorlevel%==3 goto menud
if %errorlevel%==2 goto chnick
if %errorlevel%==1 goto chres

:menud
cls
goto menu

:chnick
cd ./cfg/
del nick.cmd
cd ../
goto nickname

:chres
cd ./cfg/
del screen.cmd
del widht.cmd
del height.cmd
cd ../
goto screen

:join
cls
echo. 
echo                                         Select desired option:
echo.
echo.
echo                           1 - Host Game / 2 - Join Game /  3- Back to Menu
echo.
call .\src\logo.bat
choice /C 123>nul
if %errorlevel%==3 goto menug
if %errorlevel%==2 goto joingame
if %errorlevel%==1 goto hostgame

:menug
cls
goto menu

:joingame
cls
call .\src\logo.bat
echo.
echo Nickname: %nick%
echo.
echo Insert IP to connection:
set /p ip=
cls
call ./src/logo.bat
echo.
echo Set renderer mode:
echo.
echo 1- Doom Software Renderer / 2- OpenGL
CHOICE /C 12>nul
if %errorlevel%==2 goto opengl
if %errorlevel%==1 goto soft

:opengl
cls
echo Vid_renderer 1 >./cfg/renderer.cmd
cls
goto spwad

:soft
cls
echo Vid_renderer 0 >./cfg/renderer.cmd
cls
goto spwad

:spwad
cls
call ./src/logo.bat
echo.
echo Insert how many PWADs will be used:
echo.
echo 0 / 1 / 2 / 3 / 4 / 5 
choice /c 012345>nul
if %errorlevel%==5 goto 5wads
if %errorlevel%==4 goto 4wads
if %errorlevel%==3 goto 3wads
if %errorlevel%==2 goto 2wads
if %errorlevel%==1 goto 1wad
if %errorlevel%==0 goto 0wad

:5wads
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 3 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad3=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad3%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad3% .\gzdoom\%wad3%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 4 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad4=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad4%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad4% .\gzdoom\%wad4%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 5 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad5=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad5%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad5% .\gzdoom\%wad5%
goto join5

:join 5
cls
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
echo gzdoom.exe -join %ip% -widht %wid% -height %hei% -file %wad1% %wad2% %wad3% %wad4% %wad5% +set nick %nick% +%rend% > .\gzdoom\join.bat 
cd .\gzdoom\
start join.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:4wads
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 3 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad3=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad3%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad3% .\gzdoom\%wad3%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 4 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad4=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad4%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad4% .\gzdoom\%wad4%
goto join4

:join4
cls
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
echo gzdoom.exe -join %ip% -widht %wid% -height %hei% -file %wad1% %wad2% %wad3% %wad4% +set nick %nick% +%rend% > .\gzdoom\join.bat 
cd .\gzdoom\
start join.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:3wads
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 3 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad3=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad3%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad3% .\gzdoom\%wad3%
goto join3

:join3
cls
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
echo gzdoom.exe -join %ip% -widht %wid% -height %hei% -file %wad1% %wad2% %wad3% +set nick %nick% +%rend% > .\gzdoom\join.bat 
cd .\gzdoom\
start join.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:2wads
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
goto join2

:join2
cls
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
echo gzdoom.exe -join %ip% -widht %wid% -height %hei% -file %wad1% %wad2% +set nick %nick% +%rend% > .\gzdoom\join.bat 
cd .\gzdoom\
start join.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:1wad
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
goto join1

:join1
cls
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
echo gzdoom.exe -join %ip% -widht %wid% -height %hei% -file %wad1% +set nick %nick% +%rend% > .\gzdoom\join.bat 
cd .\gzdoom\
start join.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:0wad
cls
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
echo gzdoom.exe -join %ip% -widht %wid% -height %hei% +set nick %nick% +%rend% > .\gzdoom\join.bat 
cd .\gzdoom\
start join.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:hostgame
cls
call .\src\logo.bat
echo.
echo Nickname: %nick%
echo.
echo Insert number of players:
set /p players=
cls
call .\src\logo.bat
echo Insert game mode: (example: Deathmatch Cooperative)
set /p gamemode=
cls
call .\src\logo.bat
echo Insert skill: 1 2 3 4 5
set /p ski=
cls
call .\src\logo.bat
echo Insert map: (example: E2M3, E1M7, E4M2)
set /p map=
cls
call ./src/logo.bat
echo.
echo Set renderer mode:
echo.
echo 1- Doom Software Renderer / 2- OpenGL
CHOICE /C 12>nul
if %errorlevel%==2 goto openglh
if %errorlevel%==1 goto softh

:openglh
cls
echo Vid_renderer 1 >./cfg/renderer.cmd
cls
goto spwadh

:softh
cls
echo Vid_renderer 0 >./cfg/renderer.cmd
cls
goto spwadh

:spwadh
cls
call ./src/logo.bat
echo.
echo Insert how many PWADs will be used:
echo.
echo 0 / 1 / 2 / 3 / 4 / 5 
choice /c 012345>nul
if %errorlevel%==5 goto 5wadsh
if %errorlevel%==4 goto 4wadsh
if %errorlevel%==3 goto 3wadsh
if %errorlevel%==2 goto 2wadsh
if %errorlevel%==1 goto 1wadh
if %errorlevel%==0 goto 0wadh

:5wadsh
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 3 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad3=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad3%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad3% .\gzdoom\%wad3%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 4 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad4=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad4%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad4% .\gzdoom\%wad4%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 5 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad5=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad5%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad5% .\gzdoom\%wad5%
goto host5

:host5
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
cls
echo gzdoom.exe -widht %wid% -height %hei% -host %players% -%gamemode% -skill %ski% -file %wad1% %wad2% %wad3% %wad4% %wad5% +map %map% +set nick %nick% +%rend% > .\gzdoom\host.bat
cd .\gzdoom\
start host.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit 

:4wadsh
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 3 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad3=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad3%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad3% .\gzdoom\%wad3%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 4 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad4=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad4%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad4% .\gzdoom\%wad4%
goto host4

:host4
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
cls
echo gzdoom.exe -widht %wid% -height %hei% -host %players% -%gamemode% -skill %ski% -file %wad1% %wad2% %wad3% %wad4% +map %map% +set nick %nick% +%rend% > .\gzdoom\host.bat
cd .\gzdoom\
start host.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit 

:3wadsh
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 3 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad3=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad3%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad3% .\gzdoom\%wad3%
goto host3

:host3
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
cls
echo gzdoom.exe -widht %wid% -height %hei% -host %players% -%gamemode% -skill %ski% -file %wad1% %wad2% %wad3% +map %map% +set nick %nick% +%rend% > .\gzdoom\host.bat
cd .\gzdoom\
start host.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit

:2wadsh
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 2 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad2=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad2%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad2% .\gzdoom\%wad2%
goto host2

:host2
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
cls
echo gzdoom.exe -widht %wid% -height %hei% -host %players% -%gamemode% -skill %ski% -file %wad1% %wad2% +map %map% +set nick %nick% +%rend% > .\gzdoom\host.bat
cd .\gzdoom\
start host.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit 

:1wadh
cls
call ./src/logo.bat
echo. 
echo Insert PWAD 1 with extension (example: ichor.wad / brighmaps.pk3):
set /p wad1=
echo https://allfearthesentinel.net/zandronum/download.php?file=%wad1%
httpget https://allfearthesentinel.net/zandronum/download.php?file=%wad1% .\gzdoom\%wad1%
goto host1

:host1
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
cls
echo gzdoom.exe -widht %wid% -height %hei% -host %players% -%gamemode% -skill %ski% -file %wad1% +map %map% +set nick %nick% +%rend% > .\gzdoom\host.bat
cd .\gzdoom\
start host.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit 

:0wadh
goto host0

:host0
set /p rend=<./cfg/renderer.cmd
set /p wid=<./cfg/widht.cmd
set /p hei=<./cfg/height.cmd
cls
echo gzdoom.exe -widht %wid% -height %hei% -host %players% -%gamemode% -skill %ski% +map %map% +set nick %nick% +%rend% > .\gzdoom\host.bat
cd .\gzdoom\
start host.bat
cd ..\
cls
start "The Azure Fortress.exe"
exit 