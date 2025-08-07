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
    STIG-ID         : WN10-CC-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000005).ps1 NoLockScreenCamera
#>
# YOUR CODE GOES HERE$path = "HKLM\SOFTWARE\Policies\Microsoft\Windows\Personalization"

New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Personalization" -Name "NoLockScreenCamera" -Value 1 -PropertyType DWord -Force
