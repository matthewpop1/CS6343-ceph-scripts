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
count=5;
status="";
time=0;

start=$(date +%s)
medStart=$(date +%s)
START_TIME=`echo $(($(date +%s%N)/1000000))`
START_TIME2=`echo $(($(date +%s%N)/1000000))`
for (( i=1; i<=$1; i++ ))
do
    x=$(($i%3+1))
    o="object${i}"
    c="cephPool${x}"
    f="data/stock-data-${i}.csv"
    printf "Put ${o}"
    rados -p "$c" put "$o" "$f"
    END_TIME=`echo $(($(date +%s%N)/1000000))`
    ELAPSED_TIME=$(($END_TIME - $START_TIME))
    printf " Runtime: ${ELAPSED_TIME} ms \n"
    START_TIME=`echo $(($(date +%s%N)/1000000))`
    time=$(($time + $ELAPSED_TIME))
done
end=$(date +%s)

seconds=$(echo "$end - $start" | bc)
minutes=$((seconds/60))
seconds=$((seconds%60))
END_TIME2=`echo $(($(date +%s%N)/1000000))`
ELAPSED_TIME=$(($END_TIME2 - $START_TIME2))
printf "\n\tTime elapsed ${minutes} min ${seconds} sec\n"
printf "\n\tAverage moving time (ms):"
var2=$1
echo "scale=2 ; $time / $var2 " | bc 
printf "\n"
done
