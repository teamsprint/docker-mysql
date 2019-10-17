#!/bin/bash

CONTAINER_NAME=mysql

sudo docker run -d -it --name $CONTAINER_NAME -p 18088:8088 -p 18042:8042 -p13306:3306 --privileged teamsprint/mysql:5.7 /usr/sbin/init
sudo docker exec -it $CONTAINER_NAME /bin/bash

