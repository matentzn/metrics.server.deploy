metricsserverdeploy=/home/zeus/evowl/metrics.server.deploy/
results=/home/zeus/evowl/metrics/
rdf4console=/home/zeus/evowl/eclipse-rdf4j-2.2.4/bin/console.sh

harvestjar=$metricsserverdeploy"jars\metrics.exampleclient-0.0.1-jar-with-dependencies.jar"

obofile=$metricsserverdeploy"ontologies.ttl"
evowl=$metricsserverdeploy"ev.owl"

WS=http://localhost:8080/metrics.server/rest/add/metrics?

wget -O $obofile http://www.obofoundry.org/registry/ontologies.ttl

echo "OBO"

curl -X PUT -H "Content-type: text/turtle" --data-binary @$obofile http://130.88.193.79:8080/rdf4j-server/repositories/evowl_one/statements?context=%3Chttp://www.obofoundry.org/registry/ontologies.ttl%3E

echo ""
echo "ev.owl"

curl -X PUT -H "Content-type: application/rdf+xml" --data-binary @$evowl http://130.88.193.79:8080/rdf4j-server/repositories/evowl_one/statements?context=%3Chttp://ontothenextone.net/ev.owl%3E