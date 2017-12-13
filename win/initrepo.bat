@setlocal enabledelayedexpansion

SET metricsserverdeploy=D:\metric.pipeline\metrics.server.deploy\
SET results=D:\metric.pipeline\out\

SET harvestjar=%metricsserverdeploy%jars\metrics.exampleclient-0.0.1-jar-with-dependencies.jar

SET obofile=%metricsserverdeploy%ontologies.ttl
SET evowl=%metricsserverdeploy%ev.owl
SET WS=http://localhost:8080/metrics.server/rest/add/metrics?

::bitsadmin.exe /transfer "JobName" http://www.obofoundry.org/registry/ontologies.ttl "%obofile%"
echo "OBO"
::java -Xms2G -Xmx10G -jar %harvestjar% %obofile% %WS%"format=ttl&context=http://www.obofoundry.org/registry/ontologies.ttl"
echo "ev.owl"
::java -Xms2G -Xmx10G -jar %harvestjar% %evowl% %WS%"format=rdfxml&context=http://ontothenextone.net/ev.owl"


:: Process the results (add them to the server, etc)
cd %results%

for /r %%j in (*.rdf) do (
SET file=%%j
for %%i IN (!file!) DO (
SET FS=%%~ni
SET WSCALL=!WS!"format=rdfxml&context=http://ontothenextone.net/"!FS!
echo !WSCALL!
java -Xms2G -Xmx10G -jar %harvestjar% %%j !WSCALL!
)
)

cd %metricsserverdeploy%win