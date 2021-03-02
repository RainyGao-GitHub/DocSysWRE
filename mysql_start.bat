@echo off
set "CURRENT_DIR=%cd%"
set "MYSQL_HOME=%CURRENT_DIR%\mysql"

echo [DocSys]: CURRENT_DIR: %CURRENT_DIR%
echo [DocSys]: MYSQL_HOME: %MYSQL_HOME%
echo [DocSys]: Generate MySql Config

set strOld=CURRENT_DIR
set strNew=%CURRENT_DIR%
set templateMyIniFile=%MYSQL_HOME%\template-my.ini
set dstMyIniFile=%MYSQL_HOME%\bin\my.ini
set templateCtlBatFile=%MYSQL_HOME%\template-ctl.bat
set dstCtlBatFile=%MYSQL_HOME%\scripts\ctl.bat

setlocal enabledelayedexpansion
for /f "tokens=*" %%j in (%templateMyIniFile%) do (
	set "tmp=%%j"
	if not !tmp!.==. (
	  set "tmp=!tmp:%strOld%=%strNew%!"
	  echo !tmp!>>temp1.txt
	)
)
move temp1.txt %dstMyIniFile%

for /f "tokens=*" %%j in (%templateCtlBatFile%) do (
	set "tmp=%%j"
	if not !tmp!.==. (
	  set "tmp=!tmp:%strOld%=%strNew%!"
	  echo !tmp!>>temp2.txt
	)
)
move temp2.txt %dstCtlBatFile%

cd /D %~dp0

echo Diese Eingabeforderung nicht waehrend des Running beenden
echo Please dont close Window while MySQL is running
echo MySQL is trying to start
echo Please wait  ...
echo MySQL is starting with mysql\bin\my.ini (console)

mysql\bin\mysqld --defaults-file=mysql\bin\my.ini --standalone --console

if errorlevel 1 goto error
goto finish

:error
echo.
echo MySQL konnte nicht gestartet werden
echo MySQL could not be started
pause

:finish
