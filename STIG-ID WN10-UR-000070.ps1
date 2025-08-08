<#
.SYNOPSIS
   The “Deny access to this computer from the network” user right on workstations must be configured to prevent access from highly privileged domain accounts and local accounts on domain systems and unauthenticated access on all systems.

.NOTES
    Author          : Audie Williams
    LinkedIn        : www.linkedin.com/in/audiewilliams
    GitHub          : github.com/Acash5
    Date Created    : 2025-08-07
    Last Modified   : 2025-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-UR-000070

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
   
   PS C:\> .\__remediation_template(STIG-ID-WN10-UR-000070).ps1

Group Policy Path:
Computer Configuration > Windows Settings > Security Settings > Local Policies > User Rights Assignment

Policy Name:
Deny access to this computer from the network
#> 
# Fix for WN10-UR-000070 - Deny access to this computer from the network for specific accounts

# Required accounts to deny
$denyAccounts = @(
    "Local account",               # Built-in
    "Guests",                      # Built-in
    "Domain Admins",               # Only if domain-joined
    "Enterprise Admins"            # Only if domain-joined
)

# Define policy name
$policy = "SeDenyNetworkLogonRight"

# Get current policy
$seceditExport = "$env:TEMP\secpol.inf"
$seceditDatabase = "$env:TEMP\secedit.sdb"
secedit /export /cfg $seceditExport /areas USER_RIGHTS /quiet

# Append new setting
Add-Content -Path $seceditExport -Value "`n[$policy]"

foreach ($account in $denyAccounts) {
    Add-Content -Path $seceditExport -Value "$policy = *$account"
}

# Apply the new security policy
secedit /configure /db $seceditDatabase /cfg $seceditExport /quiet

# Clean up
Remove-Item $seceditExport, $seceditDatabase -Force

Write-Output "WN10-UR-000070 fix applied: Deny network access set for sensitive accounts."

