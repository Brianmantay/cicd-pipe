# cicd-pipe

An experiment automating the setup of TeamCity and Octopus Deploy in Azure



## Deploy ARM templates

This deploys a docker host upon which a TeamCity Server and Agent containers are started. The Agent image is customised to support dotnet core. An MSSQL Database is also deployed and associated JDBC driver required by TeamCity.

<a href="http://armviz.io/#/?load=https://raw.githubusercontent.com/Brianmantay/cicd-pipe/master/tc-docker-host/azuredeploy.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>

An Octopus Deploy template is also deployed, this is pretty much just taken from the Azure Marketplace.

<a href="http://armviz.io/#/?load=https://raw.githubusercontent.com/Brianmantay/cicd-pipe/master/octopus-server/azuredeploy.template.json" target="_blank">
  <img src="http://armviz.io/visualizebutton.png"/>
</a>

All secrets are stored in an Azure Ket Vault that is not part of either template.

`./Deploy.ps1`

Wait... then go to the TeamCity URL

## Configure TeamCity

Database connection setup:
1. Select the database type: MS SQL Server

2. Refresh JDBC drivers to pick up the driver copied during setup.sh

3. Follow through remaining setup

4. The TeamCity Agent Docker conainer is running so go to "Agents > Unauthorized" and authorize it

5. Enable the NuGet feed, go to "Administration > NuGet Feed" then enable 

## Configure Octopus

1. Setup the built in NuGet server at "Library > External Feeds"

2. Create API key for TeamCity to NuGet packages
