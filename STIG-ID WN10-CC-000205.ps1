<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Audie Williams
    LinkedIn        : www.linkedin.com/in/audiewilliams
    GitHub          : github.com/Acash5
    Date Created    : 2025-08-07
    Last Modified   : 2025-08-07
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000205

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000205).ps1 
#>
# Fix for WN10-CC-000205 - Disable password hints

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
$valueName = "NoLocalPasswordHint"
$valueData = 1

# Create the registry path if it doesn't exist
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Apply the setting
New-ItemProperty -Path $registryPath -Name $valueName -Value $valueData -PropertyType DWord -Force

Write-Output "WN10-CC-000205 fix applied: Password hints are now disabled."
<#
Verify the Value
Get-ItemProperty -Path $registryPath -Name $valueName
If you get NoLocalPasswordHint : 1, you're compliant.
#>
