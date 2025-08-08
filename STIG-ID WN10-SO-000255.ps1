<#
.SYNOPSIS
    When a Windows session is locked, the username must not be displayed to prevent potential enumeration or targeted attacks.

.NOTES
    Author          : Audie Williams
    LinkedIn        : www.linkedin.com/in/audiewilliams
    GitHub          : github.com/Acash5
    Date Created    : 2025-08-07
    Last Modified   : 2025-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-SO-000255

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-SO-000255).ps1
#> 
# Fix for WN10-SO-000255 - Hide username on locked session

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
$valueName = "DontDisplayLockedUserId"
$valueData = 2

# Create the registry path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force

Write-Output "WN10-SO-000255 fix applied: Username will not be displayed when session is locked."
<#
 Optional: Verify the Setting
powershell
Copy
Edit
Get-ItemProperty -Path $registryPath -Name $valueName
You should see:

plaintext
Copy
Edit
DontDisplayLockedUserId : 2
#>
