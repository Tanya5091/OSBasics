@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
SET /p pathh=Enter path: 
copy NUL empty.txt
FOR /F %%i in ('dir %pathh% /a:d/b') do (
SET counter=0
FOR /F %%j in ('dir !pathh!\%%i /b') do (
SET /a counter=!counter!+1
)
if !counter! EQU 0 echo !pathh!\%%i>>empty.txt
) 
echo List of empty folders is in file empty.txt
pause