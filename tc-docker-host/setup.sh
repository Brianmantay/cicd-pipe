#!/bin/bash

# create host directories for volumes
sudo mkdir /home/bmantay/tc/data -p && mkdir /home/bmantay/tc/logs -p && mkdir /home/bmantay/tc/conf -p

# create dir for db drivers
sudo mkdir /home/bmantay/tc/data/lib/jdbc -p 

# get the db drivers
sudo apt-get install wget
sudo wget https://github.com/Brianmantay/cicd-pipe/raw/master/tc-docker-host/sqljdbc42.jar -P /home/bmantay/tc/data/lib/jdbc/

# run server container
sudo docker run -d --name teamcity-server-instance  \
	-v /home/bmantay/tc/data:/data/teamcity_server/datadir \
	-v /home/bmantay/tc/logs:/opt/teamcity/logs  \
	-p 8111:8111 \
	jetbrains/teamcity-server

# run agent container
sudo docker run -d -e SERVER_URL="dockerhost-bmantay.eastus.cloudapp.azure.com:8111" \
	--name teamcity-agent-instance \
	-v /home/bmantay/tc/conf:/data/teamcity_agent/conf \
	jetbrains/teamcity-agent