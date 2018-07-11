# Import the NetAdapterModule; using the get-netadapter cmdlet, display a lost of non-virtual network adapters. 
Import-Module NetAdapter
Get-NetAdapter -Physical

# Import the DNS Client Module; using the get-dnsclientcache cmdlet, display a list of A and AAAA records from the cache
import-module DnsClient
Get-DnsClientCache -Type A,AAAA

# Display all .exe files under c:\windows\system32 that are larger than 5 MB
gci "C:\Windows\System32\*.exe" | ? { $_.Length -gt 5MB }

# Display a list of all hotfixes that are security updates
get-hotfix | gm
Get-HotFix -Description "Security Update" 

# Display a list of all hotfixes that were installed by the administrator, and which are updates
get-hotfix -Description "Security Update" | ? { $_.InstalledBy -match "system"}

# Display a list of all processes running with either the name Conhost or the name svchost
gps -Name conhost, svchost