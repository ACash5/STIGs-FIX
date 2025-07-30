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
$name = "MaxSize"
$value = 32768

if (!(Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
$current = (Get-ItemProperty -Path $path -Name $name -ErrorAction SilentlyContinue).$name
if ($null -eq $current -or $current -lt $value) { Set-ItemProperty -Path $path -Name $name -Value $value -Type DWord }
