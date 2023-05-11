Git Local Workspace Setup:-
===========================
1. Go to /opt on the vm

- cd /opt

2. Clone the project

- git clone https://github.com/iammrchetan/interview-assignment.git  --> To clone the git repository

3. Go to interview-assignment/solution folder

- cd interview-assignment/solution

4. Change the remote url to your personal git repo url

- git remote set-url origin git@github.com:srikanthkaranki/univariety_interview_assignment.git

Soultion Part 1:-
=================
1. Pull the image using below command

- docker pull docker pull iammrchetan/csvserver:1.0.1 --> To pull the image

2. Developed a shell script to create a inputFile with the given range of index. Have a look in the file to see the logic.

- vim gencsv.sh

3. Execute gencsv.sh to create inputFile

- ./gencsv.sh 2 8

4. Execute below git commands to push the gencsv.sh file to remote repo

- git add gencsv.sh
- git commit -m "< commit message >"
- git push origin HEAD

5. Command to start a container, "-P" option in the below command is to assign a random hostport to a container port

- docker run -d -P iammrchetan/csvserver:1.0.1

6. Command to see all running and failed containers

- docker ps -a 

7. Command to see the logs of a container

- docker logs <container id>

8. Mounted locally created inputFile to /csvserver/inputdata path in the container and started the container using below command
 
- docker run -d -P --mount type=bind,source="$(pwd)"/inputFile,target=/csvserver/inputdata iammrchetan/csvserver:1.0.1

9. Command to get the shell access to the container

- docker exec -it container_id /bin/sh

10. Command to see on which port the application is running 
- netstat -tulpn | grep LISTEN

- Output of the above command is like below. With the output we can see the application is running on 9300 port number

- OutPut:- tcp6       0      0 :::9300                 :::*                    LISTEN      1/csvserver

11. Deleted the container with the use of below command

- docker rm -f container_id

12. Run the new container expose the service through 9393 port on the host and set the environment variable using below command

- docker run -d -p 9393:9300 --mount type=bind,source="$(pwd)"/inputFile,target=/csvserver/inputdata -e CSVSERVER_BORDER="Orange" iammrchetan/csvserver:1.0.1

13.  Execute below git commands to push all the files to remote repo

- git add inputFile
- git commit -m "Adding inputFile"

- git add part-1-cmd
- git commit -m "Adding part-1-cmd file"

- git add part-1-output
- git commit -m "Adding part-1-output file"

- git add part-1-logs
- git commit -m "Adding part-1-logs file"

- git push origin HEAD







