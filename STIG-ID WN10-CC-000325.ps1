<#
.SYNOPSIS
    Users must not be allowed to change their account picture, as this can be a vector for personalization abuse and potential policy circumvention in managed environments.

.NOTES
    Author          : Audie Williams
    LinkedIn        : www.linkedin.com/in/audiewilliams
    GitHub          : github.com/Acash5
    Date Created    : 2025-08-07
    Last Modified   : 2025-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000325

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000325).ps1
#> 
# Fix for WN10-CC-000325 - Prevent users from changing their account picture

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer"
$valueName = "UseDefaultTile"
$valueData = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Apply the registry setting
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force

Write-Output "WN10-CC-000325 fix applied: Users can no longer change their account picture."
