@ echo off
SET /p Seconds=Enter number of seconds you want to convert N:
if %Seconds% GEQ 86399 Goto Error 
if %Seconds% LSS 0 Goto Error 
SET /a S=%Seconds% %% 60
SET /a Minutes=%Seconds% / 60
SET /a M=%Minutes% %% 60
SET /a Hours= %Minutes% / 60
ECHO Result is %Hours% hours %M% minutes %S% seconds
Goto End
:Error
ECHO N should be a natural number less than 86400.
:End
pause