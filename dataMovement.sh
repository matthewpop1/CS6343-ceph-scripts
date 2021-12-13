#!/bin/bash

timing=0;
startTime=0;
endTime=0;
start=0;
end=0;
count=3;
status="";

while true
do

status=$(ceph osd pool stats | grep -c "nothing")
status2=$(ceph status | grep -c "HEALTH_OK")

if [ $timing -eq "0" ];
then

	if ((${status} != 4 )) || ((${status2} != 1));
	then
		timing=1
		startTime=$(date)
		start=$(date +%s)
		printf "\n~~~~~~~~~~~~~~~~~~Read/Write START~~~~~~~~~~~~~~~~~~\n"
		printf "\n~~~~~~~~~~~~~~~~~~Read/Write START~~~~~~~~~~~~~~~~~~\n" >> cephLog.txt
	fi
else

	if  ((${status} == 4)) && ((${status2} ==1));
	then
		printf "\n~~~~~~~~~~~~~~~~~~Read/Write END~~~~~~~~~~~~~~~~~~"
		printf "\n~~~~~~~~~~~~~~~~~~Read/Write END~~~~~~~~~~~~~~~~~~" >> cephLog.txt
		printf "\n\t${startTime}"
		printf "\n\t${startTime}" >> cephLog.txt
		endTime=$(date)
		end=$(date +%s)
		printf "\n\t${endTime}"
		printf "\n\t${endTime}" >> cephLog.txt
		seconds=$(echo "$end - $start" | bc)
		minutes=$((seconds/60))
		seconds=$((seconds%60))
		
		printf "\n\tTime elapsed ${minutes} min ${seconds} sec\n"
		printf "\n\tTime elapsed ${minutes} min ${seconds} sec\n" >> cephLog.txt
		timing=0
	fi
fi
        osd1=$(ceph osd df | grep "^ 0" | cut -c 27-32)
        osd2=$(ceph osd df | grep "^ 1" | cut -c 27-32)
        osd3=$(ceph osd df | grep "^ 2" | cut -c 27-32)
        osd4=$(ceph osd df | grep "^ 3" | cut -c 27-32)
        osd5=$(ceph osd df | grep "^ 4" | cut -c 27-32)
	osd6=$(ceph osd df | grep "^ 5" | cut -c 27-32)

        currTime=$(date)
	if((${count} == 3));
	then
        	printf "\n${currTime}\n"
        	printf "OSD1: ${osd1}\n"
        	printf "OSD2: ${osd2}\n"
        	printf "OSD3: ${osd3}\n"
        	printf "OSD4: ${osd4}\n"
       		printf "OSD5: ${osd5}\n"
		printf "OSD6: ${osd6}\n"
		count=0
	fi

	printf "\n${currTime}\n" >> cephLog.txt
	printf "OSD1: ${osd1}\n" >> cephLog.txt
	printf "OSD2: ${osd2}\n" >> cephLog.txt
	printf "OSD3: ${osd3}\n" >> cephLog.txt
	printf "OSD4: ${osd4}\n" >> cephLog.txt
	printf "OSD5: ${osd5}\n" >> cephLog.txt
	printf "OSD6: ${osd6}\n" >> cephLog.txt

	count=$((count+1))
	sleep 1
done

