# Login to Azure
Login-AzRmAccount

# Select the Subscription on focus
Select-AzureRmSubscription -Subscription "vakappas - Internal Consumption"

$cred = Get-Credential
$rg = "ASDK-RG"
$location = "westeurope"

$templateParameters = @{
    adminPassword = $cred.Password
    publicDnsName = "vklab-asdk"
    autoDownloadASDK = $true
    virtualNetworkName = "ASDK-VNET"
    virtualMachineSize = "Standard_E32s_v3"
}


New-AzureRmResourceGroup -Name $rg -Location $location
New-AzureRmResourceGroupDeployment -TemplateFile .\new-azuredeploy.json -TemplateParameterObject $templateParameters  -ResourceGroupName $rg