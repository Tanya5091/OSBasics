@echo off 
setlocal ENABLEDELAYEDEXPANSION
SET /p Natural=Enter natural number N to convert:
if %Natural% LSS 0 Goto Error 
SET Hex=0123456789ABCDEF
SET res=
:Startloop
SET /a Current=%Natural% %% 16
SET "Cur=!Hex:~%Current%,1!"
SET "res=%Cur%%res%"
SET /a Natural=%Natural% / 16 
if %Natural% GEQ 1 GOTO Startloop
ECHO Hexadecimal representation of your input N is %res%
Goto End
:Error
ECHO N should be a natural number less than 86400.
:End
pause