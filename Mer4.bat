@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
if exist List.txt del List.txt
SET /p pathh=Enter directory path: 
dir %pathh% /b /a-d /s >FileList.txt
copy NUL numeratedEls.txt
copy NUL index.txt
SET var=0
for /F %%f in (FileList.txt) do (
echo !var!/%%f>>numeratedEls.txt
SET /a var=!var!+1
)
for /F "tokens=1-2 delims=/" %%a in (numeratedEls.txt) do (
SET rep=0
for /F %%i in (index.txt) do (
if %%i==%%a SET rep=1
)
if !rep! EQU 0 (
SET val=0
for /F "tokens=1-2 delims=/" %%c in (numeratedEls.txt) do (
if %%a LSS %%c (
fc %%b %%d > nul
if not errorlevel 1 (
if !val! EQU 0 (
echo List of the same files: >>List.txt
echo %%b>>List.txt)
echo %%d>>List.txt
echo %%c>>index.txt
SET /a val=!val!+1
)
)
)
)
)
)
del numeratedEls.txt
del index.txt
pause