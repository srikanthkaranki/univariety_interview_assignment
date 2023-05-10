Part 1:-
========
1) Pull the image using below command
docker pull docker pull iammrchetan/csvserver:1.0.1 --> To pull the image
2) Develop a shell script to create a inputFile with the given range of index
vim gencsv.sh
below is the content of a gencsv.sh file
=========================================================
#!/bin/bash

start_index=$1
stop_index=$2

if [ -d $1 ] || [ -d $2 ];then
        echo "Script execution should be in the format of 'sh gencsv.sh <start index> <stop index>'";
else
        echo "Script execution started";
fi

if [ -f inputFile ];then
        rm -rf inputFile;
        echo "Removed old inputFile"
else
        echo "inputFile not found"
fi;

echo "Creating new inputFile"

for i in $(seq $start_index $stop_index);
do
        echo "$i,$RANDOM" >> inputFile;
done
echo "inputFile creation completed!!!"
============================================================

3) Execute gencsv.sh to create inputFile
./gencsv.sh 2 8

4) Command to start a container, "-P" option in the below command is to assign a random hostport to a container port
docker run -d -P iammrchetan/csvserver:1.0.1

5) Command to see all running and failed containers
docker ps -a 

6) Command to see the logs of a container
docker logs <container id>

7) Mounted locally created inputFile to /csvserver/inputdata path in the container and started the container using below command.
docker run -d -P --mount type=bind,source="$(pwd)"/inputFile,target=/csvserver/inputdata <image id /image name>

8) Command to get the shell access to the container
docker exec -it <container id> /bin/sh

9) Command to see on which port the application is running 
netstat -tulpn | grep LISTEN

Output of the above command is like below. With the output we can see the application is running on 9300 port number

OutPut:- tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver

10) Deleted the container with the use of below command
docker rm -f <container id>

11) Run the new container expose the service through 9393 port on the host and set the environment variable using below command
docker run -d -p 9393:9300 --mount type=bind,source="$(pwd)"/inputFile,target=/csvserver/inputdata -e CSVSERVER_BORDER="Orange" <image id /image name>







