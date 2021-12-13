#!/bin/bash

for ((i =0; i < 1000; i++));
do
    x=$(($i%3+1))
    o="object${i}"
    echo "Remove ${o}"
    rados -p cephPool4 rm "$o"
done < unBalObjects.txt
