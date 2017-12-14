#!/bin/sh

METRICS=/home/zeus/evowl/metrics/

for o in `ls -p "$METRICS"`; 
do
	rdf=$METRICS$o
	echo $rdf
	WS="http://130.88.193.79:8080/rdf4j-server/repositories/evowl_one/statements?context=%3Chttp://ontothenextone.net/"$o"%3E"
	echo $WS
	curl -X PUT -H "Content-type: application/rdf+xml" --data-binary @$rdf $WS
done	