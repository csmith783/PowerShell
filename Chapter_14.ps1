# What class can you use to view the current IP address of a network adapter? 
# Does the class have any menthods that you could use to release aDHCP lease? 
# Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapterConfiguration
Get-WmiObject -Class Win32_NetworkAdapterConfiguration | gm
# Method = ReleaseDHCPLease
# book answer: was all jacked up; so I modified it to the following
Get-CimClass Win32_NetworkAdapterConfiguration | select -expand CimClassMethods | ? {$_.Name -like "*DHCP*" }

# Create a table that shows a computer name, OS Build number, OS Description, and BIOS serial number
Get-WmiObject -Namespace root\cimv2 -Class Win32_OperatingSystem | ft -Property PSComputerName, BuildNumber, Caption, @{l='BIOS Serial Number';e={Get-WmiObject -Namespace root\cimv2 -Class Win32_bios | select -expand SerialNumber}}

# Query a list of HotFixes using WMI
Get-CimInstance -ClassName Win32_QuickFixEngineering

# Is that list different that what is returned by get-hotfix?
# Slightly, the get-hotfix cmdlet returns the source of the hotfix. 

# Display a list of services, and their attributes
Get-CimInstance -ClassName Win32_Service

# Using the CIM cmdlets, list all available classes in the securitycenter2 namespace with product as part of the name
Get-CimClass -Namespace root/SecurityCenter2 -ClassName *product*

# Once you discover the name, use the CIM cmdlets to display any antispyware appications. 
Get-CimInstance -Namespace root\securitycenter2 -ClassName AntiSpywareProduct
Get-CimInstance -Namespace root\securitycenter2 -ClassName AntiVirusProduct