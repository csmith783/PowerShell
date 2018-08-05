# Review Lab 2
# Chapters 1-14

# Task 1
# Display a list of running processes in at able, that includes only the process names, and ID numbers. Dont let the table have large whitespace
Get-Process | ft -Property Name, Id -AutoSize

# Task 2
# Runthis: get-wmi-object -class win32_systemdriver
# Rerun it and display only: Driver SHort Name, display name, path to driver file and its start mode and current state, display the path property as path
Get-WmiObject -Class Win32_systemdriver | select Name, DisplayName, Status, StartMode, @{l='Path';e={$_.PathName}} 

# Task 3
# Rung get-psprovider from a remote machine. 
Invoke-Command -ComputerName localhost, localhost -ScriptBlock { Get-PSProvider }

# Task 4
# Use notpad tocreate a file name Computers.txt
# get running services from the computers in computers.txt 
Invoke-Command -ComputerName (cat Computers.txt) -ScriptBlock { get-service | ? { $_.Status -eq "Running" } }

# Task 5
# Get all instances on win32_logicaldisk where drivetype eq 3. Display: Drive letter, size, free space and percent free. 
# once the command works, filter to drives that only have 50% or greater free space. 
Get-WmiObject -Class Win32_LogicalDisk | ? { $_.DriveType -eq 3 } | select DeviceID, Size, FreeSpace, @{l='PercentFree';e={$_.FreeSpace/$_.Size * 100 -as [int] }} | ? {$_.PercentFree -gt 50 }

# Task 6
# display a list of all WMI classes in the root\CIMv2 namespace that start with WIN32 - using the Cim cmdlets
Get-CimClass -Namespace root/CIMV2

# Task 7
# Display alist of all win32_service instances where the startmode is auto and the state is not running
Get-WmiObject -Class Win32_service | ? {$_.StartMode -eq "Auto" -and $_.State -ne "Running" }

# Task 8
# Find a command that can send email messages. What are the mandatory parameters for the command
Send-MailMessage -From "from@gmail.com" -To "to@gmail.com" -Subject "This is a test" -SmtpServer mail.google.com

# Task 9
# Run a command that will display the folder permissions for c:\ 
get-acl -Path "C:\" | fl *

# Task 10
# Run a command that will display the permissions of every folder in C:\Users 
gci | Get-Acl
gci -Directory H | Get-Acl

# Task 11
# Find a command that will start Notepad under another credential that is not yours.
Start-Process -Credential "user2" Notepad

# Task 12
# Run a command that will pause the shell for 10 seconds
Start-Sleep -Seconds 10

# Task 13
# Can you find a help file that explains the shells operators
man *operator*
man about_operators

# Task 14
# Using get-winevent, display a list of all log files that have entries and sort the results in descending order by the number of entries
Get-WinEvent -ListLog * | ? {$_.RecordCount } | sort RecordCount -Descending

# Task 15
# run get-ciminstance, and display ina  table: number of cores, manufacturer, name, column titled MaxSpeed that = maximum clock speed
Get-CimInstance -ClassName Win32_Processor | ft -Property NumberOfCores, Name, @{l='MaxSpeed';e={$_.MaxClockSpeed}}, Manufacturer

# Task 16
# Run get-ciminstance -classname and display: processes witha  peak working set size greater than 100,000, only show process name, versions, and desc
Get-WmiObject -Class Win32_Process -Filter "PeakWorkingSetSize >= 100000" | Select -Property Name, ExecutablePath, Peak*

# Task 17
# Run find-module and find all modules with a tag of network; display name, version, and description
Find-Module | ? { $_.Tags -like "*network*" } | Select -Property Name, Version, Description
find-module -Tag Network | sort name | Select name, Version, Description