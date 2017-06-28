$resourceGroup = "cicd"
$timestamp = [int](Get-Date -UFormat %s -Millisecond 0)

if (!$AzureRMAccount.Context.Tenant) {
    $AzureRMAccount = Add-AzureRmAccount 
}

New-AzureRmResourceGroup -Name $resourceGroup -Location "eastus"

New-AzureRmResourceGroupDeployment -Name DockerHost -ResourceGroupName $resourceGroup `
    -TemplateUri https://raw.githubusercontent.com/Brianmantay/cicd-pipe/master/tc-docker-host/azuredeploy.json `
    -TemplateParameterUri https://raw.githubusercontent.com/Brianmantay/cicd-pipe/master/tc-docker-host/azuredeploy.parameters.json `
    -timestamp $timestamp


   