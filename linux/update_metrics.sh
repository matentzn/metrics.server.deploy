#!/bin/bash

METRICS=/home/zeus/evowl/metrics/
METRICSCOMPLETED=/home/zeus/evowl/metrics_completed/

mkdir -p $METRICSCOMPLETED

for o in `ls -p "$METRICS"`; 
do
	rdf=$METRICS$o
	rdfc=$METRICSCOMPLETED$o
	WS="http://130.88.193.79:8080/rdf4j-server/repositories/evowl_one/statements?context=%3Chttp://ontothenextone.net/"$o"%3E"
	
	echo $rdf
	
	
	if [ ! -f $rdfc ]; then
		echo "New file, processing..."
		curl -X PUT -H "Content-type: application/rdf+xml" --data-binary @$rdf $WS
		cp $rdf $METRICSCOMPLETED
	else
		if cmp -s "$rdf" "$rdfc" ; then
			echo "File has already been processed, ignoring.."
		else
			echo "File has changed, processing again.."
			curl -X PUT -H "Content-type: application/rdf+xml" --data-binary @$rdf $WS
			cp $rdf $METRICSCOMPLETED
		fi
	fi
done	