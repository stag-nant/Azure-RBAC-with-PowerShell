<#
.SYNOPSIS
Tests permissions by attempting to create a VNet as the user.
#>

# Define values
$resourceGroupName = "AZ900RGlod48914482"
$vnetName = "TestVNet"
$location = "East US"
$addressPrefix = "10.0.0.0/16"
$subnetName = "default"
$subnetPrefix = "10.0.0.0/24"

# Create VNet
New-AzVirtualNetwork -Name $vnetName `
                     -ResourceGroupName $resourceGroupName `
                     -Location $location `
                     -AddressPrefix $addressPrefix `
                     -Subnet @(@{Name=$subnetName; AddressPrefix=$subnetPrefix})
