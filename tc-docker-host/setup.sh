#!/bin/bash

# create host directories for volumes
sudo mkdir /home/bmantay/tc/data -p && mkdir /home/bmantay/tc/logs -p && mkdir /home/bmantay/tc/conf -p && mkdir /home/bmantay/tc/data/plugins -p

# create dir for db drivers
sudo mkdir /home/bmantay/tc/data/lib/jdbc -p 

# get the db drivers
sudo apt-get install wget
sudo wget https://github.com/Brianmantay/cicd-pipe/raw/master/tc-docker-host/lib/sqljdbc42.jar -P /home/bmantay/tc/data/lib/jdbc/

# get the dotnet core plugin 
sudo wget https://github.com/Brianmantay/cicd-pipe/raw/master/tc-docker-host/plugins/dotnet-core-plugin.zip -P /home/bmantay/tc/data/plugins/

# get the octopus plugin
sudo wget https://github.com/Brianmantay/cicd-pipe/raw/master/tc-docker-host/plugins/Octopus.TeamCity.zip -P /home/bmantay/tc/data/plugins/

# run server container
sudo docker run --restart=always -d --name teamcity-server-instance  \
	-v /home/bmantay/tc/data:/data/teamcity_server/datadir \
	-v /home/bmantay/tc/logs:/opt/teamcity/logs  \
	-p 8111:8111 \
	jetbrains/teamcity-server

# run agent container
sudo docker run --restart=always -d -e SERVER_URL="dockerhost-bmantay.eastus.cloudapp.azure.com:8111" \
	--name teamcity-agent-instance \
	-v /home/bmantay/tc/conf:/data/teamcity_agent/conf \
	bmantay/teamcity-agent-dotnet