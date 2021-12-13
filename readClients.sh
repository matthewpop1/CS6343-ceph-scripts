#!/bin/bash

cat helperScripts/read.sh | ssh cephuser@192.168.1.84 &
cat helperScripts/read.sh | ssh cephuser@192.168.1.85 &
cat helperScripts/read.sh | ssh cephuser@192.168.1.87

