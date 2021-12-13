#!/bin/bash

while true
do

osd1=$(ceph osd df | grep "^ 0" | cut -c 27-32)
osd2=$(ceph osd df | grep "^ 1" | cut -c 27-32)
osd3=$(ceph osd df | grep "^ 2" | cut -c 27-32)
osd4=$(ceph osd df | grep "^ 3" | cut -c 27-32)
osd5=$(ceph osd df | grep "^ 4" | cut -c 27-32)


currTime=$(date)
printf "\n${currTime}\n"
printf "OSD1: ${osd1}\n"
printf "OSD2: ${osd2}\n"
printf "OSD3: ${osd3}\n"
printf "OSD4: ${osd4}\n"
printf "OSD5: ${osd5}\n"

sleep 5

done


