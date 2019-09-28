

$appname="ttttt1"
$aspname="aspttttt1"
$rg="testdevops"
$loc="Central US"

$password = ConvertTo-SecureString 'AzureTest@123' -AsPlainText -Force
$credential = New-Object System.Management.Automation.PSCredential ('deepak@sindhus.in', $password)

#login to subscrption
login-azureRmAccount -Credential $Credential
Select-AzureRmSubscription -SubscriptionId 83f64421-ba30-4f5c-974e-c09331cf25b9

#create resource group
New-AzurermResourceGroup -Name $rg -Location $loc

# Create an App Service plan in Free tier.
New-AzurermAppServicePlan -Name $aspname -Location $loc -ResourceGroupName $rg -Tier Free

# Create a web app.
New-AzurermWebApp -Name $appname -Location $loc -AppServicePlan $aspname -ResourceGroupName $rg




