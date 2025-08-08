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
    STIG-ID         : WN10-SO-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-CC-000030).ps1 
#>
# Fix for WN10-SO-000005 - Require password on wake after sleep (on battery)

# GUID for "Require a password on wakeup" - On Battery
$subgroupGuid = "4f971e89-eebd-4455-a8de-9e59040e7347"
$settingGuid = "abfc2519-3608-4c2a-94ea-171b0ed546ab"

# Set to require password (1 = Require password)
powercfg /SETDCVALUEINDEX SCHEME_CURRENT $subgroupGuid $settingGuid 1

# Apply the change
powercfg /SETACTIVE SCHEME_CURRENT

Write-Output "WN10-SO-000005 fix applied: Password required on wake from sleep (on battery)."
#
#Verify the Setting
#powercfg /QUERY SCHEME_CURRENT $subgroupGuid $settingGuid
#The Current AC/DC Power Setting Index should show 0x00000001
