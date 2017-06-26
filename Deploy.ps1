$resourceGroup = "docker"

Login-AzureRMAccount

New-AzureRmResourceGroup -Name $resourceGroup -Location "eastus"

New-AzureRmResourceGroupDeployment -Name DockerHost -ResourceGroupName $resourceGroup `
  -TemplateUri https://raw.githubusercontent.com/Brianmantay/cicd-pipe/master/tc-docker-host/azuredeploy.json `
  -TemplateParameterUri https://raw.githubusercontent.com/Brianmantay/cicd-pipe/master/tc-docker-host/azuredeploy.parameters.json
