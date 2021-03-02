echo.
echo [DocSys]: Restart
set "CURRENT_DIR=%cd%"
set "CATALINA_HOME=%CURRENT_DIR%\tomcat"
set "JAVA_HOME=%CATALINA_HOME%\java\jdk1.8.0_162"
set "JRE_HOME=%CATALINA_HOME%\java\jre1.8.0_162"
set "MYSQL_HOME=%CURRENT_DIR%\mysql"

start stop.bat
start start.bat

echo done.
pause
