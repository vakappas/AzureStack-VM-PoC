# Create directory on the root drive.
New-Item -ItemType Directory -Force -Path "C:\ConfigASDK"
Set-Location "C:\ConfigASDK"

# Download the ConfigASDK Script.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-Webrequest http://bit.ly/configasdk -UseBasicParsing -OutFile ConfigASDK.ps1

Start-BitsTransfer https://software-download.microsoft.com/download/pr/Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO -Destination C:\ConfigASDK\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO

$Creds = Get-Credential
$ConfigASDKParams = @{
    azureDirectoryTenantName = "*.onmicrosoft.com"
    authenticationType = "AzureAd"
    downloadPath = "D:\ConfigASDK"
    ISOPath = "C:\ConfigASDK\Windows_Server_2016_Datacenter_EVAL_en-us_14393_refresh.ISO"
    azureStackAdminPwd = "PASSWORD"
    VMpwd = $Creds.Password
    azureAdUsername = "vklabadmin@vkappasoutlook.onmicrosoft.com"
    azureAdPwd = "PASSWORD"
    azureRegSubId = "TO BE COMPLETED"
}

.\ConfigASDK.ps1 -registerASDK -useAzureCredsForRegistration @ConfigASDKParams