:: deploy everything

SET metricsserverdeploy=D:\metric.pipeline\metrics.server.deploy\

SET tomcat=D:\tools\tomcat\

SET tomcatbin=%tomcat%bin\
SET tomcatwebapps=%tomcat%webapps\

SET deploywebapps=%metricsserverdeploy%webapps\


:: Location of web apps in deploy server
SET releasemetricsserver=%deploywebapps%metrics.server.war
SET releaseowlbadge=%deploywebapps%evowl.ws.war
SET releaseevowlui=%deploywebapps%evowl.ui-1.0.0.war
SET releaserdf4jserver=%deploywebapps%rdf4j-server.war
SET releaserdf4jworkbench=%deploywebapps%rdf4j-workbench.war

cd %tomcatbin%
call shutdown.bat

@RD /S /Q %tomcatwebapps%metrics.server
xcopy /y %releasemetricsserver% %tomcatwebapps%

@RD /S /Q %tomcatwebapps%evowl.ws
xcopy /y %releaseowlbadge% %tomcatwebapps%

@RD /S /Q %tomcatwebapps%evowl.ui-1.0.0
xcopy /y %releaseevowlui% %tomcatwebapps%

@RD /S /Q %tomcatwebapps%rdf4j-server
xcopy /y %releaserdf4jserver% %tomcatwebapps%

@RD /S /Q %tomcatwebapps%rdf4j-workbench
xcopy /y %releaserdf4jworkbench% %tomcatwebapps%

call startup.bat
cd %metricsserverdeploy%win