<#
.SYNOPSIS
    The Allow Telemetry setting must be configured to Basic (1) or Security (0).

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
# WN10-CC-000205 - Ensure Telemetry is not set to Full

$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set telemetry to Basic (1) for broad compatibility
# Use 0 if you're on Enterprise/Education and want Security only
New-ItemProperty -Path $regPath -Name "AllowTelemetry" -Value 1 -PropertyType DWord -Force | Out-Null

Write-Host "WN10-CC-000205 applied: Telemetry set to Basic (not Full)."

