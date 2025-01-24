 <#
.History
   24/10/2024 - 1.1 - Updated script to use the newer Az cmdlets instead of AzureRm
   13/10/2020 - 1.0 - Initial release - David Alzamendi
.DESCRIPTION
   Uploads a private key to key vault in Base-64 format
    
.PARAMETERS 
	None   
#>
# Connect to your account
Connect-AzAccount

# Show Azure Subscriptions on tenant
Get-AzSubscription

# Connect to subscription
Set-AzContext -Subscription "XXXXX-XXXXX-XXXXX-XXXXX-XXXXX"

# Define variables

# Define Path
$PrivateKey = [System.IO.File]::ReadAllBytes("C:\Your file")

# Convert to base 64 and to secure string
$Base64 = [System.Convert]::ToBase64String($PrivateKey)
$Secret = ConvertTo-SecureString -String $Base64 -AsPlainText -Force

# Upload key to secret
Set-AzKeyVaultSecret -VaultName 'KeyVault-Name' -Name 'SecretName' -SecretValue $Secret 
