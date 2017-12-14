#!/bin/sh

# rsync -avzhe ssh backup.tar root@192.168.0.100:/backups/
METRICS=/home/zeus/evowl/metrics/
TARGET=/home/owl/evowl/metrics/

rsync -avXrz --delete -e ssh $METRICS owl@130.88.192.36:$TARGET