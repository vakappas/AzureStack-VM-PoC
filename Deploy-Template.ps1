# Login to Azure
Login-AzAccount

# Select the Subscription on focus
Select-AzSubscription -Subscription "vakappas - Internal Consumption"

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


New-AzResourceGroup -Name $rg -Location $location
New-AzResourceGroupDeployment -TemplateFile .\azuredeploy.json -TemplateParameterObject $templateParameters  -ResourceGroupName $rg
Remove-AzResourceGroup -Name $rg -Force