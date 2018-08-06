# Review Lab 3
# Chapters 1-19

# Task 1
# Create alist of running processes. The list should include only process name, id, vm and pm. Show the VM and PM columns in megabytes
# Put the list into an HTML file named Procs.html. 
# Make sure the file has an embedded title of "Current Processes"
gps | select -Property ProcessName, Id, @{l='VM';e={$_.VM/1MB -as [int]}}, @{l='PM';e={$_.PM/ 1MB -as [int]}} | ConvertTo-Html -Head "Current Processes" | Out-File "Process.html"
.\Process.html

# Task 2
# Using WMi or Cim, create a tab delimited file named Services.tdf that contains all the servicese on your computer
# Include only names, status, startmode, and account
Get-WmiObject -Class Win32_Service | select Name, Status, StartMode, StartName | Export-Csv -Delimiter "`t" -Path "C:\Services\Services.tdf"
Import-Csv -Path "C:\Services\Services.tdf" -Delimiter "`t"

# Task 3
# Write a script
# Prompt the user for a computername -save toa variable
# query the computer for the OS name, version number, when it last booted, and how long it has been running
# Include the computer name in your out put
$Computer = Read-Host -Prompt "What is the computer name?"
Get-CimInstance -ComputerName $Computer -ClassName Win32_operatingSystem | Ft -Property caption, OperatingSystem, version, lastboottime, @{l='uptime'; e={(get-date) - $_.lastbootuptime}}, PSComputerName

# Task 4
# Take your commands from the previous task and turn it into a parameterized script. 
# Include an alias of CN and make it mandatory
# The Output should show the smae properties, but you may want to come up with a better name for the OS fiels
param (
    [Parameter(Mandatory=$true)]
    [Alias('CN')]
    $computername

)

#$Computer = Read-Host -Prompt "What is the computer name?"
Get-CimInstance -ComputerName $computername -ClassName Win32_operatingSystem |
    Ft -Property caption, version, lastbootuptime, @{l='uptime'; e={(get-date) - $_.lastbootuptime}}, PSComputerName, @{l='OperatingSystem';e={$_.Caption}}

    # Task 5
    # Using a background job. Find all installed products using the WMI and win32_product class. 
    # When finished get the results and display the product name, company, version, install date, and installation location
    Start-Job -Name "Products" -ScriptBlock { Get-WmiObject -Class Win32_Product } 
    $products = Receive-Job -Name Products
    $products | Select Name, company, version, installdate, installlocation | ogv