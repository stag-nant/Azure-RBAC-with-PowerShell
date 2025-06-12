<#
.SYNOPSIS
Assigns the 'Storage Account Contributor' role to allow user to create storage accounts.
#>

param (
    [string]$resourceGroupName = "AZ900RGlod48914482",
    [string]$userPrincipalName = "Dev1-48914482@cloudslice.onmicrosoft.com",
    [string]$roleName = "Storage Account Contributor"
)

$user = Get-AzADUser -UserPrincipalName $userPrincipalName
New-AzRoleAssignment -ObjectId $user.Id -RoleDefinitionName $roleName -ResourceGroupName $resourceGroupName
