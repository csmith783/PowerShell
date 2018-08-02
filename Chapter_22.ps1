<#
.Synopsis
Gets physical network adapters.
.Description
This command will get all physical Network Adapters from the LocalHost
.Parameter ComputerName
The name of the computer to check
.Example
PS C:\> ./chapter_22.ps1 -computername localhost

#>
[CmdletBinding()]

param (
    [Parameter(Mandatory=$true)]
    [Alias('hostname')]
    [string]$computername
)

Write-Verbose "Getting Physical Network Adapter for computer $computername."
Get-WmiObject win32_networkadapter -ComputerName $computername |
    where { $_.PhysicalAdapter } |
    select MACAddress, AdapterType, DeviceID, Name, Speed
Write-Verbose "Finishing Script."