<#
.SYNOPSIS
Assigns a built-in Azure role to a user in a specified resource group.
#>

param (
    [string]$resourceGroupName = "AZ900RGlod48914482",
    [string]$userPrincipalName = "Dev1-48914482@cloudslice.onmicrosoft.com",
    [string]$roleName = "Network Contributor"
)

# Connect to Azure
Write-Host "Retrieving user: $($userPrincipalName)..."
try {
    $user = Get-AzADUser -UserPrincipalName $userPrincipalName -ErrorAction Stop
    Write-Host "User $($user.DisplayName) found with Object ID: $($user.Id)"
} catch {
    Write-Warning "User not found."
    exit
}

Write-Host "Retrieving role definition for '$roleName'..."
try {
    $roleDefinition = Get-AzRoleDefinition -Name $roleName -ErrorAction Stop
} catch {
    Write-Warning "Role not found."
    exit
}

Write-Host "Assigning '$roleName' role to '$($user.DisplayName)'..."
try {
    New-AzRoleAssignment -ObjectId $user.Id -RoleDefinitionName $roleName -ResourceGroupName $resourceGroupName -ErrorAction Stop
    Write-Host "Role assigned successfully."
} catch {
    Write-Error "Assignment failed: $($_.Exception.Message)"
}
