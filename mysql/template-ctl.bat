@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop


"CURRENT_DIR\mysql\bin\mysqld" --defaults-file="CURRENT_DIR\mysql\bin\my.ini" --standalone --console
if errorlevel 1 goto error
goto finish

:stop
"CURRENT_DIR\apache\bin\pv" -f -k mysqld.exe -q

if not exist "CURRENT_DIR\mysql\data\%computername%.pid" goto finish
echo Delete %computername%.pid ...
del "CURRENT_DIR\mysql\data\%computername%.pid"
goto finish


:error
echo MySQL could not be started

:finish
exit
