<#
.SYNOPSIS
Test failure by trying to create a storage account with insufficient permission.
#>

$resourceGroupName = "AZ900RGlod48914482"
$location = "East US"
$storageName = "storagedemo4891"

New-AzStorageAccount -ResourceGroupName $resourceGroupName `
                     -Name $storageName `
                     -Location $location `
                     -SkuName Standard_LRS `
                     -Kind StorageV2
