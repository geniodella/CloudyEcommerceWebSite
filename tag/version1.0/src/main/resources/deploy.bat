set workspacedir=C:\Users\francesco.dibartolo\workspace
set tomcatdir=C:\apache-tomcat-7.0.27
set projectname=EcommerceFrontEnd

cd %tomcatdir%\bin

call shutdown.bat

del %tomcatdir%\webapps\%projectname%.war

cd %workspacedir%\ParentProject

call mvn clean install

move %workspacedir%\%projectname%\target\%projectname%.war %tomcatdir%\webapps

rmdir %tomcatdir%\webapps\%projectname% /s /q

cd %tomcatdir%\bin

call script.bat

cd C:\Software
