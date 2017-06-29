# cicd-pipe

An experiment automating the setup of TeamCity and Octopus Deploy in Azure

## Deploy ARM template

This mainly deploys a docker host upon which a TeamCity Server and Agent containers are started. An SQL Database is also 
deployed and associated JDBC driver required by TeamCity.

`./Deploy.ps1`

Wait... then go to the TeamCity URL

## Configure TeamCity

Database connection setup:
1. Select the database type: MS SQL Server

2. Refresh JDBC drivers to pick up the driver copied during setup.sh

3. Follow through remaining setup

*Note:* TeamCity couldn't connect to the SQL DB because of the firewall. In Azure go to the teamCityDB firewall and... 
"allow access to azure resources". I couldn't see where to incorporate this into the ARM template as of yet.

4. The TeamCity Agent Docker conainer is running so go to "Agents > Unauthorized" and authorize it
