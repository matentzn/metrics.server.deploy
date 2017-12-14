#!/bin/bash

metricsserverdeploy=/home/zeus/evowl/metrics.server.deploy/
tomcat=/opt/tomcat/
tomcatbin=$tomcat"bin/"
tomcatwebapps=$tomcat"webapps/"
deploywebapps=$metricsserverdeploy"webapps/"

# Location of web apps in deploy server
releasemetricsserver=$deploywebapps"metrics.server.war"
releaseowlbadge=$deploywebapps"evowl.ws.war"
releaseevowlui=$deploywebapps"evowl.ui-1.0.0.war"
releaserdf4jserver=$deploywebapps"rdf4j-server.war"
releaserdf4jworkbench=$deploywebapps"rdf4j-workbench.war"

sudo initctl stop tomcat


sudo rm -r $tomcatwebapps"metrics.server"
sudo rm $tomcatwebapps"metrics.server.war"
cp $releasemetricsserver $tomcatwebapps

sudo rm -r $tomcatwebapps"evowl.ws"
sudo rm $tomcatwebapps"evowl.ws.war"
cp $releaseowlbadge $tomcatwebapps

sudo rm -r $tomcatwebapps"evowl.ui-1.0.0"
sudo rm $tomcatwebapps"evowl.ui-1.0.0.war"
cp $releaseevowlui $tomcatwebapps

sudo rm -r $tomcatwebapps"rdf4j-server"
sudo rm $tomcatwebapps"rdf4j-server.war"
cp $releaserdf4jserver $tomcatwebapps

sudo rm -r $tomcatwebapps"rdf4j-workbench"
sudo rm $tomcatwebapps"rdf4j-workbench.war"
cp $releaserdf4jworkbench $tomcatwebapps

sleep 5

sudo initctl start tomcat