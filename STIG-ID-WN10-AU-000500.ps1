<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Audie Williams
    LinkedIn        : www.linkedin.com/in/audiewilliams
    GitHub          : github.com/Acash5
    Date Created    : 2025-07-30
    Last Modified   : 2025-07-30
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# YOUR CODE GOES HERE$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
# WN10-AU-000500 — Set Application log max size to 32,768 KB (or higher)

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
New-Item -Path $regPath -Force | Out-Null

# 32768 KB (0x00008000). Increase if you prefer larger logs.
New-ItemProperty -Path $regPath -Name "MaxSize" -PropertyType DWord -Value 32768 -Force | Out-Null

# Optional: force policy refresh
gpupdate /target:computer /force | Out-Null

Write-Host "WN10-AU-000500 applied: Application log max size set to 32,768 KB."

