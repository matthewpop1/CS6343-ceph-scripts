#!/bin/bash

scp read.sh cephuser@client:~/data/read.sh
scp read.sh cephuser@client2:~/data/read.sh
scp read.sh cephuser@client3:~/data/read.sh

scp write.sh cephuser@client:~/data/write.sh
scp write.sh cephuser@client2:~/data/write.sh
scp write.sh cephuser@client3:~/data/write.sh

scp unBalRead.sh cephuser@client:~/data/unBalRead.sh
scp unBalRead.sh cephuser@client2:~/data/unBalRead.sh
scp unBalRead.sh cephuser@client3:~/data/unBalRead.sh

scp unBalWrite.sh cephuser@client:~/data/unBalWrite.sh
scp unBalWrite.sh cephuser@client2:~/data/unBalWrite.sh
scp unBalWrite.sh cephuser@client3:~/data/unBalWrite.sh

scp removeData.sh cephuser@client:~/data/removeData.sh
scp removeData.sh cephuser@client2:~/data/removeData.sh
scp removeData.sh cephuser@client3:~/data/removeData.sh

scp removeUnbalData.sh cephuser@client:~/data/removeUnbalData.sh
scp removeUnbalData.sh cephuser@client2:~/data/removeUnbalData.sh
scp removeUnbalData.sh cephuser@client3:~/data/removeUnbalData.sh

scp unBalObjects.txt cephuser@client:~/data/unBalObjects.txt
scp unBalObjects.txt cephuser@client2:~/data/unBalObjects.txt
scp unBalObjects.txt cephuser@client3:~/data/unBalObjects.txt
