echo.
echo [DocSys]: Start
set "CURRENT_DIR=%cd%"
set "CATALINA_HOME=%CURRENT_DIR%\tomcat"
set "JAVA_HOME=%CATALINA_HOME%\java\jdk1.8.0_162"
set "JRE_HOME=%CATALINA_HOME%\java\jre1.8.0_162"
set "MYSQL_HOME=%CURRENT_DIR%\mysql"

echo [DocSys]: Start MySQL
start mysql_start.bat

echo [DocSys]: Start Tomcat
"%CATALINA_HOME%\bin\catalina.bat" run


echo done.
pause


