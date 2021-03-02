@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START
if not ""%1"" == ""START"" goto stop
"C:\docsysRel\docsys\mysql\bin\mysqld" --defaults-file="C:\docsysRel\docsys\mysql\bin\my.ini" --standalone --console
if errorlevel 1 goto error
goto finish
:stop
"C:\docsysRel\docsys\apache\bin\pv" -f -k mysqld.exe -q
if not exist "C:\docsysRel\docsys\mysql\data\%computername%.pid" goto finish
echo Delete %computername%.pid ...
del "C:\docsysRel\docsys\mysql\data\%computername%.pid"
goto finish
:error
echo MySQL could not be started
:finish
exit
