@echo off
    set d=1
     set m=1
     set y=2020

:increment
SET /a d=%d%+1
if %d% LEQ 31 goto checkvalidity
SET /a d=1
SET /a m=%m%+1
if %m% LEQ 12 goto checkvalidity
set /a m=1
set /a y=%y%+1
:checkvalidity
if %d% EQU 31 (
if %m% EQU 2 goto increment
if %m% EQU 4 goto increment
if %m% EQU 6 goto increment
if %m% EQU 9 goto increment
if %m% EQU 11 goto increment
)
if %d% EQU 30 (
if %m% EQU 2 goto increment
)
SET /a x= %y% %% 400
SET /a z= %y% %% 4
if %d% EQU 29 (
if %m% EQU 2 (
if %x% EQU 0 goto increment
if %z% NEQ 0 goto increment
)
)
SET res=0
echo Tomorrow is %d%.%m%.%y%. Your events for tomorrow: 
for /F "tokens=1-2 delims=: " %%a in (Dates.txt) do (
if %d%.%m%.%y% equ %%b (
echo %%a
SET /a res=1)
)
if %res% EQU 0 echo NO EVENTS
pause