#!/bin/bash

for (( i=1; i<=1000; i++ ))
do

o="object${i}"
num=$(ceph osd map cephPool4 $o -f json-pretty | jq '"\(.acting_primary)"')
temp=""\""1"\"""

if [[ $num == $temp ]];
then
	printf "${i}\n" >> unBalObjects.txt
fi
done
