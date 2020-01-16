# MySQL Docker Image (for Hadoop & Hive)

teamsprint/mysql:5.7

# Based on (in a row)

teamsprint/centos:7<br/>
teamsprint/jdk:8<br/>
teamsprint/hadoop:2.7.3<br/>

# Build the image

run build.sh

# Start a container

run run.sh

The container name is "mysql". If you don't want, just edit the scripts.

# Attach a container

run attach.sh

# Destroy containers

run destroy.sh

# IMPORTANT: After attach you might to want to to:
./start-hadoop.sh (Optional: HDFS & Yarn)<br/>
./test-hadoop.sh (Optional)<br/>

./init-mysql.sh (MySQL setting)<br/>
./start-mysql.sh (Optional; already started by init-mysql.sh)<br/>
./conn-mysql.sh (Optional)<br/>
./stop-mysql.sh (Optional)<br/>

# WARNING:
# You should check if init-mysql.sh has succeeded.
# Especially when you ran right after startup.
# I recommend to wait just 5 seconds after startup.

