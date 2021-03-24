[CmdletBinding()]
param( $siten,
       $pname
)

$appname=$siten
$aspname=$pname
$rg="testdevops"
$loc="Central US"

$password = ConvertTo-SecureString 'Sheena@05' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ('komalgill023@gmail.com', $password)

#login to subscrption
login-azureRmAccount -Credential $Credential
Select-AzureRmSubscription -SubscriptionId 8853d54c-c00e-4562-b764-60ec3da433ab

#create resource group
New-AzurermResourceGroup -Name $rg -Location $loc

# Create an App Service plan in Free tier.
New-AzurermAppServicePlan -Name $aspname -Location $loc -ResourceGroupName $rg -Tier Free

# Create a web app.
New-AzurermWebApp -Name $appname -Location $loc -AppServicePlan $aspname -ResourceGroupName $rg




