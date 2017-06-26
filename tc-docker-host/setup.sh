#!/bin/bash

# create host directories for volumes
mkdir /home/bmantay/tc/data -p && mkdir /home/bmantay/tc/logs && mkdir /home/bmantay/tc/conf

# run server container
docker run -d --name teamcity-server-instance  \
    -v /home/bmantay/tc/data:/data/teamcity_server/datadir \
    -v /home/bmantay/tc/logs:/opt/teamcity/logs  \
    -p 8111:8111 \
    jetbrains/teamcity-server

# run agent container	
docker run -d -e SERVER_URL="dockerhost-bmantay.eastus.cloudapp.azure.com:8111" \
	--name teamcity-agent-instance \
	-v /home/bmantay/tc/conf:/data/teamcity_agent/conf \
	jetbrains/teamcity-agent