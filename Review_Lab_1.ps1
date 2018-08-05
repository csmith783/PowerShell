# Review Lab 1

# Task 1
# Run a command that will display the newest 100 entries from the application event log
Get-EventLog -LogName Application -Newest 100

# Task 2
# Write a command to display the top 5 processes based on VM usage
Get-Process | Sort VM -Descending | select -First 5

# Task 3
# Create a CSV that contains all services, including only the services name and status. have running services listed before stopped services
gsv | sort status -Descending | select name, status

# Task 4
# Write a command that changes the start up type of bits to manual
Set-Service -Name BITS -StartupType Manual

# Task 5
# display alist of all files named win*.*
Get-ChildItem -LiteralPath "c:\"  -Recurse -Name "win*.*"

# Task 6
# get adirectory lsiting for c:\Program Files. Include all sub folders and files. output to a text file "C:\Dir.txt"
gci -Path "C:\Program Files" -Recurse > C:\Dir.txt

# Task 7
# Get a list of the 20 most recent entries form the security event log and convert to XML. Do not save a file to the disk, display to the console. 
get-eventlog -logname Application -Newest 20 | ConvertTo-Xml

# Task 8
# Get a list of all event logs on the compiter, selecting the log name, its max size and overflow action. Convert to CSV 
Get-EventLog -List | select -Property LogDisplayName, MaximumKilobytes, OverflowAction | ConvertTo-Csv

# Task 9
# Get a list of services. Keep only the service names, display names, and status. send that info to an html file titled "Service Report". Have the phrase "Installed Services" preceed the services. and have the service names in HI format
Get-Service | select Name, DisplayName, Status | ConvertTo-Html -Title "Service Report" -Head "Installed Services" | Out-File "Service_Report.html"

# Task 10
# Create a new alias named D. which runs get-childitem. export just that alias toa  file. close the shell. open a new one. and import D
New-Alias -Name D -Value Get-ChildItem -PassThru | Export-Alias -Path alias.xml
Import-Alias .\alias.xml
D

# Task 11
# Display installed hotfixes that are either hotfix or update, but not security update
Get-HotFix -Description Update, HotFix

# Task 12
# runa  command that will display the current directory that the shell is in
pwd
Get-Location

# Task 13
# Run a command that will display the most recent commands that you have run in the shell. locate the command that you ran for task 11 and rerun it
h
get-history
history
r 8

# Task 14
# Run a command that will modifies the security event log to overwrite old events as needed
gcm *eventlog*
man Limit-EventLog -ShowWindow
Limit-EventLog -LogName Security -OverflowAction OverwriteAsNeeded

# Task 15
# Use the new-item cmdlet to make a new directory named "C:\Review"
New-Item -Name "Review" -ItemType Directory

# Task 16 
# Display the contents of the following registry key
# HKCU:\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders
Get-Item -Path "HKCU:\software\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders"

# Task 17
# find, but do not run cmdlets taht can do the following:
# Restart acomputer
# Shutdown a computer
# Remove a computer from a working group or a domain
# restore a computers system restore checkpoint
gcm *computer*
Restart-Computer
Stop-Computer
Remove-Computer
Checkpoint-Computer

# Task 18
# what command do you think can be used to change a registry value?
gcm *registry*
man New-Item -Examples
man New-Item -ShowWindow