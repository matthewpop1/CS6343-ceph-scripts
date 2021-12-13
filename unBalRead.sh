#!/bin/bash

while true
do
timing=0;
startTime=0;
endTime=0;
start=0;
end=0;
medStart=0;
medEnd=0;
count=0;
status="";
time=0;

start=$(date +%s)
medStart=$(date +%s)
START_TIME=`echo $(($(date +%s%N)/1000000))`
START_TIME2=`echo $(($(date +%s%N)/1000000))`
while read i;
do
    count=$((count+1)))
    x=$(($i%3+1))
    o="object${i}"
    c="cephPool4"
    f="data2/stock-data-${i}.csv"
    printf "Get ${o}"
    rados -p "$c" get "$o" "$f"
    END_TIME=`echo $(($(date +%s%N)/1000000))`
    ELAPSED_TIME=$(($END_TIME - $START_TIME))
    printf " Runtime: ${ELAPSED_TIME} ms \n"
    START_TIME=`echo $(($(date +%s%N)/1000000))`
    time=$(($time + $ELAPSED_TIME))
done < unBalObjects.txt
end=$(date +%s)

seconds=$(echo "$end - $start" | bc)
minutes=$((seconds/60))
seconds=$((seconds%60))
END_TIME2=`echo $(($(date +%s%N)/1000000))`
ELAPSED_TIME=$(($END_TIME2 - $START_TIME2))
printf "\n\tTime elapsed ${minutes} min ${seconds} sec\n"
printf "\n\tAverage moving time (ms):"
var2=$((count))
echo "scale=2 ; $time / $var2 " | bc 
printf "\n"
done
