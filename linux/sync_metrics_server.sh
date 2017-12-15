#!/bin/sh

METRICS=/home/zeus/evowl/metrics/
TARGET=/home/owl/evowl/metrics/

rsync -avHe ssh owl@130.88.192.36:$TARGET $METRICS