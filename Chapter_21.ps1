<#
.Synopsis
Gets drives based on percentage of free space.
.Description
This command will get all local drives that have less than the specified
    percentage of free space
.Parameter ComputerName
The name of the computer to check
.Parameter DriveType
THe drive type to check
.Parameter MinimumPercentFree
The minimum percent free disk space. This is the threshold. The default value is 10.
    Enter a number between 1 and 100. 
.Example
PS C:\> Get-Disk -MinimumPercentFree 20

#>


param (
    $computername = $env:COMPUTERNAME,
    $driver = 3,
    $MinimumPercentFree = 10
)

Get-WmiObject Win32_LogicalDisk -filter "drivetype=$driver" |
    Where { ($_.FreeSpace / $_.Size) -lt $MinimumPercentFree } |
    Select -Property DeviceID, FreeSpace, Size